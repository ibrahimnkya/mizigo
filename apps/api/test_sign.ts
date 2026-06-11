import crypto from "crypto";

const publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCpNs5Vm1uwxrA0EEwbCACylnqzwf4kJaENxn/vbklopzyTxZjnv0eSumA7oytlwzHwQuadMS44zx0dc2xno+jNrGDYRf8Cd5iN0V1xPRhwOJeyhQhuiziw57YuUhu70gEGklb2SAFxM3DWtzecJnR17lrsCYwZ8q/0cXjbTCQUYQIDAQAB";

try {
  let formattedKey = publicKey.trim();
  if (!formattedKey.includes("-----BEGIN PRIVATE KEY-----")) {
    formattedKey = `-----BEGIN PRIVATE KEY-----\n${formattedKey}\n-----END PRIVATE KEY-----`;
  }
  const sign = crypto.createSign("RSA-SHA256");
  sign.update("test");
  const signature = sign.sign(formattedKey, "base64");
  console.log("Signature generated:", signature);
} catch (error: any) {
  console.error("Signing failed:", error.message);
}
