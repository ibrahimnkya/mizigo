export const normalizePhoneNumber = (value?: string | null): string | null => {
  if (!value) return null;
  const trimmed = String(value).trim();
  if (!trimmed) return null;

  const digitsOnly = trimmed.replace(/\D/g, "");
  if (!digitsOnly) return null;

  if (digitsOnly.startsWith("255")) {
    return digitsOnly;
  }

  if (digitsOnly.startsWith("0")) {
    return `255${digitsOnly.slice(1)}`;
  }

  return digitsOnly;
};
