import LegalLayout from "@/components/layout/legal-layout";

export const metadata = {
  title: "Privacy Policy | Mizigo Portal",
  description: "Privacy Policy for Mizigo National Rail Logistics Portal.",
};

export default function PrivacyPage() {
  return (
    <LegalLayout title="Privacy Policy" activeTab="privacy">
      <div className="space-y-8 text-slate-300">
        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            1. Information We Collect
          </h2>
          <p className="text-[13px] leading-relaxed mb-3">
            To facilitate efficient rail cargo logistics and parcel tracking, we
            collect the following types of information:
          </p>
          <ul className="list-disc list-inside space-y-2 text-[13px] pl-4">
            <li>
              <span className="text-white font-bold">Logistics Data:</span>{" "}
              Tracking numbers, origin station, destination station, weight,
              parcel type, and status timeline records.
            </li>
            <li>
              <span className="text-white font-bold">Contact Details:</span>{" "}
              Phone numbers and names of receivers and senders to facilitate SMS
              status updates and verification.
            </li>
            <li>
              <span className="text-white font-bold">Device & Query Data:</span>{" "}
              IP addresses, browser types, and tracking search queries to ensure
              security and prevent platform abuse.
            </li>
          </ul>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            2. How We Use Information
          </h2>
          <p className="text-[13px] leading-relaxed mb-3">
            The data collected is processed strictly for logistics and platform
            operations, specifically to:
          </p>
          <ul className="list-disc list-inside space-y-2 text-[13px] pl-4">
            <li>
              Synchronize and display live parcel location and station dispatch
              records.
            </li>
            <li>
              Send verification security tokens to authorize package collection.
            </li>
            <li>
              Enable the recent tracking history functionality on your local
              browser.
            </li>
            <li>
              Monitor system performance, coordinate transit terminal sync, and
              secure the logistics API.
            </li>
          </ul>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            3. Cookies and Local Storage
          </h2>
          <p className="text-[13px] leading-relaxed">
            We utilize standard web local storage to enhance your experience.
            Specifically, your search queries and recent tracking numbers are
            stored locally on your device (`mzg_recent_tracking`) for quick
            access in your search engine history. This data does not leave your
            device unless you perform a tracking query, and you can clear it at
            any time by clearing your browser cache.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            4. Data Sharing & Third-Parties
          </h2>
          <p className="text-[13px] leading-relaxed">
            Mizigo does not sell, lease, or distribute personal customer data.
            We only share logistics transit records with authorized national
            railway operators and partners involved directly in the handling and
            transport of cargo, or where required to comply with statutory and
            legal obligations in the United Republic of Tanzania.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            5. Data Masking & Security
          </h2>
          <p className="text-[13px] leading-relaxed">
            We prioritize data protection. Publicly accessible tracking links
            incorporate strict privacy-masking rules (e.g. obscuring telephone
            numbers and sender/receiver names) to prevent unauthorized
            discovery. Access to full details requires specific system
            authentication or matching authorization keys. We implement
            industrial-grade TLS encryption and database access policies to
            secure all data.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            6. Your Rights
          </h2>
          <p className="text-[13px] leading-relaxed">
            Under relevant data protection guidelines, you have the right to
            request access to records associated with your phone number, request
            correction of inaccurate logistics fields, or object to specific
            updates. For inquiries, please contact our internal compliance team
            at the station terminals.
          </p>
        </div>

        <div className="pt-6 border-t border-white/5 flex justify-between items-center text-[10px] uppercase font-black tracking-widest text-slate-500">
          <span>Last Updated: June 2, 2026</span>
          <span>Version 1.0.0</span>
        </div>
      </div>
    </LegalLayout>
  );
}
