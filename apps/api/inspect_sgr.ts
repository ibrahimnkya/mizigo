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

const FULL_URL = "https://dev.trc.co.tz/ecargo_sgr/sec/trc/sgr-parcel/v1/fetch/sgr-stations";

async function main() {
  // Postman script: timestamp = Date.now().toString() (milliseconds)
  //   GET payload  = timestamp + ".{}"
  const timestamp = Date.now().toString();
  const signaturePayload = `${timestamp}.{}`;

  console.log(`Timestamp : ${timestamp}`);
  console.log(`Payload   : ${signaturePayload}`);
  console.log(`URL       : ${FULL_URL}\n`);

  const sign = crypto.createSign("RSA-SHA256");
  sign.update(signaturePayload);
  const signature = sign.sign(privateKey, "base64");
  console.log(`Signature : ${signature.substring(0, 60)}...\n`);

  const headers: Record<string, string> = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "X-Service-Name": "SETL_SERVICE",
    "X-Header-Service": "ANONYMOUS_SERVICE",
    "X-Timestamp": timestamp,
    "X-Signature": signature,
    clientRef: "XCNT202606830874",
  };

  try {
    const response = await fetch(FULL_URL, { method: "GET", headers });
    const status = response.status;
    const body = await response.text();

    if (status === 200) {
      console.log(`✅ SUCCESS (200)`);
      console.log(body);
    } else {
      console.log(`❌ FAILED (${status})`);
      console.log(body);
    }
  } catch (e: any) {
    console.log(`💥 ERROR: ${e.message}`);
  }
}

main();
