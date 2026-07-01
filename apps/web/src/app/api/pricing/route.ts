import { NextResponse } from "next/server";
import { prisma } from "@repo/database";
import { auth } from "@/auth";
import crypto from "crypto";

// ── SGR auth helpers (same pattern as Express sgr-client) ────────────────────

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

async function syncSgrTariffs() {
  try {
    const integration = await prisma.integration.findFirst({
      where: { type: "SGR_PORTAL", isActive: true, deletedAt: null },
      orderBy: { updatedAt: "desc" },
    });
    const config = (integration?.config || {}) as Record<string, any>;
    const baseUrl = (config.baseUrl || process.env.SGR_BASE_URL || "https://dev.trc.co.tz/ecargo_sgr").replace(/\/$/, "");
    const serviceName = config.serviceName || process.env.SGR_SERVICE_NAME || "SETL_SERVICE";
    const headerService = config.headerService || process.env.SGR_HEADER_SERVICE || "ANONYMOUS_SERVICE";
    const clientRef = config.clientRef || process.env.SGR_CLIENT_REF || "XCNT202606830874";
    const privateKey = config.privateKey || process.env.SGR_PRIVATE_KEY || DEFAULT_PRIVATE_KEY;

    // Build signed headers (timestamp ms + ".{}" payload)
    const timestamp = Date.now().toString();
    const sign = crypto.createSign("RSA-SHA256");
    sign.update(`${timestamp}.{}`);
    const signature = sign.sign(privateKey.trim(), "base64");

    const headers = {
      Accept: "application/json",
      "Content-Type": "application/json",
      "X-Service-Name": serviceName,
      "X-Header-Service": headerService,
      "X-Timestamp": timestamp,
      "X-Signature": signature,
      clientRef,
    };

    const url = `${baseUrl}/sec/trc/sgr-parcel/v1/fetch/parcel-tariffs`;
    const response = await fetch(url, { method: "GET", headers });
    if (!response.ok) {
      let errorBody = "";
      try {
        errorBody = await response.text();
      } catch (_) {}
      throw new Error(`SGR tariff fetch failed: ${response.status}${errorBody ? ` - ${errorBody}` : ""}`);
    }

    const result = await response.json();
    if (result.code !== "SUCCESS" || !Array.isArray(result.data)) {
      throw new Error(result.message || "Invalid SGR tariff response");
    }

    for (const t of result.data) {
      await (prisma as any).pricingRule.upsert({
        where: { name: t.name },
        update: {
          type: "SGR_TARIFF",
          value: t.minimumCharge,
          condition: JSON.stringify({
            description: t.description,
            distanceRate: t.distanceRate,
            weightRate: t.weightRate,
            parcelCategory: t.parcelCategory,
            sgrId: t.id,
          }),
          isActive: true,
        },
        create: {
          name: t.name,
          type: "SGR_TARIFF",
          value: t.minimumCharge,
          condition: JSON.stringify({
            description: t.description,
            distanceRate: t.distanceRate,
            weightRate: t.weightRate,
            parcelCategory: t.parcelCategory,
            sgrId: t.id,
          }),
          isActive: true,
        },
      });
    }
  } catch (err: any) {
    console.error("[Web Pricing Sync] SGR tariff sync failed:", err.message);
  }
}

// ── Route handlers ────────────────────────────────────────────────────────────

export async function GET() {
  // Sync tariffs from TRC SGR before returning
  await syncSgrTariffs();

  try {
    const rules = await (prisma as any).pricingRule.findMany({
      where: { deletedAt: null },
      orderBy: { name: "asc" },
    });

    // Enrich SGR_TARIFF entries with parsed metadata
    const enriched = rules.map((r: any) => {
      if (r.type === "SGR_TARIFF" && r.condition) {
        try {
          const meta = JSON.parse(r.condition);
          return {
            ...r,
            minimumCharge: r.value,
            distanceRate: meta.distanceRate,
            weightRate: meta.weightRate,
            description: meta.description,
            parcelCategory: meta.parcelCategory,
            sgrId: meta.sgrId,
          };
        } catch {
          return r;
        }
      }
      return r;
    });

    return NextResponse.json({ success: true, data: enriched });
  } catch (error) {
    console.error("Error fetching pricing rules:", error);
    return NextResponse.json({ error: "Internal Server Error" }, { status: 500 });
  }
}

export async function POST(request: Request) {
  const session = await auth();
  if (session?.user?.role !== "SUPER_ADMIN") {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    const body = await request.json();
    const rule = await (prisma as any).pricingRule.create({
      data: {
        name: body.name,
        type: body.type,
        value: parseFloat(body.value),
        condition: body.condition,
        isActive: body.isActive ?? true,
      },
    });
    return NextResponse.json(rule, { status: 201 });
  } catch (error) {
    console.error("Error creating pricing rule:", error);
    return NextResponse.json({ error: "Internal Server Error" }, { status: 500 });
  }
}
