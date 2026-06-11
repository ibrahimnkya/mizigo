import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import crypto from "crypto";

const DEFAULT_PRIVATE_KEY = `-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEYigO1boZbS0f
uODIf4yfz3u0Ey0OCUq+164FxduncYZFXzsT1TcWO2xgq0eJ9097Stb4g56j9zG/
Q621LS4hupriwz8j82skvnEGLkJ7dsi1egk/OOD8RbNbJm9iaTZuGipW4o/ELQZC
6LoJyYdxDXIu2Zj1QojvRqPnn3OXRzTqCXL/g6RlMl3DxY2iX40fNtGCUKbzwa5w
lYkKvK7GznG/toMES+r0FV6WLDB3e8s+5Hf1ELtIvr3oGmTHb2deJusQKXESe0FS
bHpWXYl2IZ++k8jns3IoOTLrM5Ug01/UyPT3L94BMKz4oZRYFMdfE17zb0Om3VP7
THXRBegJAgMBAAECggEADh9k9BQoqvVv/k0EVUbe7Qs1wTBz2AORDYJjMGUXM8Z1
On3ruLRnnsCtPZJztZdEbwBlzz9f5Di9qhyK3HGgVKqfwtj5rHMv7FeJt0ESZOCY
9HwPOC21+E5m5JIyBmi8klRtYQwv/JKkVaF454VHqTinUnkxh8m+IT76QIj1/hXv
lTUmRtvsB4YvEfIqiQ6HS6zYWHXuN99IAIFF+vazEzGWnJUBcC+vL7n0n8uSF4Hi
hazkEk25NCcycMnh94YYTK6L7F1vKEWlcGJVrlB13LFMR3tKsnfCe0Y7ZvbVftIq
LYTK5I4UQwq2qQB+d3hzC4Gy0hoUwIu6qg3/uC3ltQKBgQDldS6zIMGE5r1VNkgj
qeoXjVYmb1XSNkToX8Mn8w5wCAm799EH2/8JPwcJ2XxtSqIi6sz3pSW3ztfdu/SI
jMF5VMyrMwtTD1YT+fTXvyTioALmxdiU0+1ATOPlPu2ZHCrs2vyyk2yFxTkv2Por
q0I9c9obUzlU9IIb/wpZZQqAZwKBgQDbGY+MGtKyLqcVCetTvhBM3+y5xxUxTvpP
HwnB0dhkxgLOUsDskApuQnAHnoeSxhUGfDXTBxbEJfWCXcbfI+q4mZMkRmunnYb3
Bq1MMKlaBc1pBxgvlPi2jaycGOVvycvBe3TJBlaAbEG0AAhXPbFSkkPWnumRx3W2
4jQ3yc9ODwKBgQCCwzkN1Aj0mBolyX1q9ZX2PhFubdxWo565Xnl09sqvhaUmfZ+d
/v1kY4q7Tjnefr3PcEfGiVLpYPMb5dUBTFWls3G/zqMRfpfrYnLp0IBQtidxJCa9
CdkW37qwFiCJNMgxmsqPafxab36biedno31oT/FnyRHPHFhZZAqdzzsg2QKBgQCW
odcoCtTqfdqPQ1eQJm7Me3MkMnQmh1beCMfLgjsU5XHOaeSLf2g8b97Xzi0FQrv3
znOu1wPW7QYCj/iHNwlLywH3gZbIESxWLzf71sTHyI91ctQ0+mWYFIUkeJVdKs60
Ae3Du2DDQCpX12HkoNyFmVucdXq9p/UNPC2MYWnuDwKBgHAoaoB090z9qoDaXJdo
BIW8VhqgRAIBJCKGRYZdENOnrXpSpWRsd2yufCf11i+3SOOGwULQwu9yTxYtewQ4
Y7D0YJ9J3KpXMVZNNS5VaT+k7D81FDb951dyeLHlrZKz4eeEAQJeHzv7DESe3K2k
Xxl1aX27xQqfkVYHvccMiSR1
-----END PRIVATE KEY-----`;

async function syncSgrStationsInWeb() {
  try {
    // 1. Load SGR Config
    const integration = await prisma.integration.findFirst({
      where: { type: "SGR_PORTAL", isActive: true, deletedAt: null },
      orderBy: { updatedAt: "desc" },
    });

    const config = (integration?.config || {}) as Record<string, any>;
    const baseUrl = config.baseUrl || process.env.SGR_BASE_URL || "https://dev.trc.co.tz/ecargo_sgr";
    const serviceName = config.serviceName || process.env.SGR_SERVICE_NAME || "SETL_SERVICE";
    const headerService = config.headerService || process.env.SGR_HEADER_SERVICE || "ANONYMOUS_SERVICE";
    const clientRef = config.clientRef || process.env.SGR_CLIENT_REF || "XCNT202606830874";
    const privateKey = config.privateKey || process.env.SGR_PRIVATE_KEY || DEFAULT_PRIVATE_KEY;

    // 2. Prepare request
    // TRC expects millisecond timestamp (Date.now()), not seconds
    const timestamp = Date.now().toString();
    // GET signature payload: timestamp + ".{}"
    const signaturePayload = `${timestamp}.{}`;

    // Sign payload
    const sign = crypto.createSign("RSA-SHA256");
    sign.update(signaturePayload);
    let formattedKey = privateKey.trim();
    if (!formattedKey.includes("-----BEGIN PRIVATE KEY-----")) {
      formattedKey = `-----BEGIN PRIVATE KEY-----\n${formattedKey}\n-----END PRIVATE KEY-----`;
    }
    const signature = sign.sign(formattedKey, "base64");

    const headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "X-Service-Name": serviceName,
      "X-Header-Service": headerService,
      "X-Timestamp": timestamp,
      "X-Signature": signature,
      "clientRef": clientRef,
    };

    let cleanedBaseUrl = baseUrl.trim();
    if (cleanedBaseUrl.endsWith("/")) {
      cleanedBaseUrl = cleanedBaseUrl.substring(0, cleanedBaseUrl.length - 1);
    }
    const url = `${cleanedBaseUrl}/sec/trc/sgr-parcel/v1/fetch/sgr-stations`;

    console.log(`[Web Sync] Fetching SGR stations from: ${url}`);
    const response = await fetch(url, {
      method: "GET",
      headers,
    });

    if (!response.ok) {
      throw new Error(`SGR API status: ${response.status}`);
    }

    const result = await response.json();
    const isSuccess = result.code === "SUCCESS" || result.success === true;
    if (!isSuccess || !Array.isArray(result.data)) {
      throw new Error(result.message || result.error?.message || "Invalid structure");
    }

    let trcOrg = await prisma.organization.findFirst({
      where: { name: "Tanzania Railways Corporation" },
    });

    if (!trcOrg) {
      trcOrg = await prisma.organization.create({
        data: {
          name: "Tanzania Railways Corporation",
          description: "National rail logistics provider",
        },
      });
    }

    for (const s of result.data) {
      const existingByCode = await prisma.station.findUnique({
        where: { code: s.code },
      });

      if (existingByCode && existingByCode.id !== s.id) {
        await prisma.station.delete({
          where: { id: existingByCode.id },
        });
      }

      const existingByName = await prisma.station.findUnique({
        where: { name: s.name },
      });

      if (existingByName && existingByName.id !== s.id) {
        await prisma.station.delete({
          where: { id: existingByName.id },
        });
      }

      await prisma.station.upsert({
        where: { id: s.id },
        update: {
          code: s.code,
          name: s.name,
          isActive: s.isActive !== false,
          organizationId: trcOrg.id,
        },
        create: {
          id: s.id,
          code: s.code,
          name: s.name,
          isActive: s.isActive !== false,
          organizationId: trcOrg.id,
        },
      });
    }
    console.log(`[Web Sync] Successfully synced ${result.data.length} stations.`);
  } catch (error: any) {
    console.error("[Web Sync] SGR Stations sync failed, falling back to local DB:", error.message);
  }
}

export async function GET(request: Request) {
  try {
    const { searchParams } = new URL(request.url);
    const organizationId = searchParams.get("organizationId");

    // Sync SGR stations from SGR portal
    await syncSgrStationsInWeb();

    const stations = await (prisma as any).station.findMany({
      where: organizationId ? { organizationId } : undefined,
      orderBy: { name: "asc" },
    });
    return NextResponse.json(stations);
  } catch (error) {
    console.error("Error fetching stations:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}

export async function POST(request: Request) {
  const session = await auth();
  if (session?.user?.role !== "SUPER_ADMIN") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    const body = await request.json();
    const station = await (prisma as any).station.create({
      data: {
        name: body.name,
        code: body.code,
        location: body.location,
        isActive: body.isActive ?? true,
      },
    });
    return NextResponse.json(station, { status: 201 });
  } catch (error) {
    console.error("Error creating station:", error);
    return NextResponse.json(
      { error: "Internal Server Error" },
      { status: 500 },
    );
  }
}
