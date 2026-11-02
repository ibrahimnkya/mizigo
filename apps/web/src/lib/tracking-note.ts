/**
 * Human-readable note for a tracking event. Older events stored the station's
 * ID as the location and "by undefined" when the staff name was missing.
 */
export function trackingNote(e: { description?: string | null; location?: string | null }): string {
  const description = (e.description ?? "")
    .replace(/\s+by (undefined|null)\b/gi, "")
    .replace(/^Parcel received at station$/i, "Received at the station")
    .trim();
  const location = e.location && !/^[0-9A-HJKMNP-TV-Z]{26}$/i.test(e.location) ? e.location : "";
  return [description, location].filter(Boolean).join(" · ");
}
