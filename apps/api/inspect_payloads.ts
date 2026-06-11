import crypto from "crypto";

const privateKey = `-----BEGIN PRIVATE KEY-----
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

const serviceName = "SETL_SERVICE";
const headerService = "ANONYMOUS_SERVICE";
const clientRef = "XCNT202606830874";
const path = "/sec/trc/sgrparcel/v1/fetch/sgr-stations";
const url = `https://dev.trc.co.tz/ecargo_sgr${path}`;

async function testCombination(label: string, payload: string, timestamp: string) {
  const sign = crypto.createSign("RSA-SHA256");
  sign.update(payload);
  const signature = sign.sign(privateKey, "base64");

  const headers: Record<string, string> = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "X-Service-Name": serviceName,
    "X-Header-Service": headerService,
    "X-Timestamp": timestamp,
    "X-Signature": signature,
    "clientRef": clientRef,
  };

  try {
    const response = await fetch(url, { method: "GET", headers });
    if (response.status !== 401) {
      console.log(`🎉 SUCCESS! Payload: [${label}] -> Status: ${response.status} ${response.statusText}`);
      const body = await response.text();
      console.log("Body:", body.substring(0, 300));
      return true;
    }
  } catch (error: any) {
    // Ignore fetch errors
  }
  return false;
}

async function main() {
  const msTime = Date.now().toString();
  const secTime = Math.floor(Date.now() / 1000).toString();

  const timeFormats = [
    { name: "Seconds", val: secTime },
    { name: "Milliseconds", val: msTime }
  ];

  for (const timeInfo of timeFormats) {
    const t = timeInfo.val;
    const candidates = [
      { name: "Empty", val: "" },
      { name: "Timestamp", val: t },
      { name: "ClientRef", val: clientRef },
      { name: "Path", val: path },
      { name: "ClientRef + Timestamp", val: `${clientRef}${t}` },
      { name: "ClientRef + \\n + Timestamp", val: `${clientRef}\n${t}` },
      { name: "Timestamp + ClientRef", val: `${t}${clientRef}` },
      { name: "Timestamp + \\n + ClientRef", val: `${t}\n${clientRef}` },
      { name: "Path + Timestamp", val: `${path}${t}` },
      { name: "Path + \\n + Timestamp", val: `${path}\n${t}` },
      { name: "Timestamp + Path", val: `${t}${path}` },
      { name: "Timestamp + \\n + Path", val: `${t}\n${path}` },
      { name: "ClientRef + Timestamp + Path", val: `${clientRef}${t}${path}` },
      { name: "ClientRef + \\n + Timestamp + \\n + Path", val: `${clientRef}\n${t}\n${path}` },
      { name: "Path + ClientRef + Timestamp", val: `${path}${clientRef}${t}` },
      { name: "Path + \\n + ClientRef + \\n + Timestamp", val: `${path}\n${clientRef}\n${t}` },
      { name: "GET + Path + Timestamp", val: `GET${path}${t}` },
      { name: "GET + \\n + Path + \\n + Timestamp", val: `GET\n${path}\n${t}` },
      { name: "GET + \\n + Path + \\n + Timestamp + \\n + ClientRef", val: `GET\n${path}\n${t}\n${clientRef}` },
      { name: "ServiceName + HeaderService + ClientRef + Timestamp", val: `${serviceName}${headerService}${clientRef}${t}` },
      { name: "ServiceName + \\n + HeaderService + \\n + ClientRef + \\n + Timestamp", val: `${serviceName}\n${headerService}\n${clientRef}\n${t}` },
    ];

    console.log(`Testing with ${timeInfo.name} Timestamp: ${t}`);
    for (const c of candidates) {
      const ok = await testCombination(`${timeInfo.name} - ${c.name}`, c.val, t);
      if (ok) return;
    }
  }

  console.log("❌ All combinations returned 401.");
}

main();
