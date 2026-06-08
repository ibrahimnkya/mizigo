import LegalLayout from "@/components/layout/legal-layout";

export const metadata = {
  title: "Terms of Service | Mizigo Portal",
  description: "Terms of Service for Mizigo National Rail Logistics Portal.",
};

export default function TermsPage() {
  return (
    <LegalLayout title="Terms of Service" activeTab="terms">
      <div className="space-y-8 text-slate-300">
        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            1. Acceptance of Terms
          </h2>
          <p className="text-[13px] leading-relaxed">
            By accessing or using the Mizigo Portal (the "Service"), provided by
            Mizigo Core ("we", "our", or "us"), you agree to be bound by these
            Terms of Service. If you do not agree to these terms, you must
            immediately cease all access and use of the Service.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            2. Description of Service
          </h2>
          <p className="text-[13px] leading-relaxed">
            Mizigo is an enterprise logistics management and tracking system
            designed for Tanzanian SGR and MGR rail freight transport. We
            provide real-time tracking, parcel dispatch logging, station
            management, and digital cargo synchronization. The transit
            estimations (ETAs) provided by our tracking engine are estimates
            only and are subject to railway network conditions, weather, and
            operational schedules.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            3. User Obligations & Conduct
          </h2>
          <p className="text-[13px] leading-relaxed mb-3">
            In accessing the Service, you agree to:
          </p>
          <ul className="list-disc list-inside space-y-2 text-[13px] pl-4">
            <li>
              Provide accurate and complete parcel details when registering and
              tracking.
            </li>
            <li>
              Maintain the confidentiality of any portal credentials and
              security tokens assigned to you.
            </li>
            <li>
              Use security tokens solely for verification of parcel pickup and
              authorized cargo handling.
            </li>
            <li>
              Not engage in automated data gathering, scraping, or load testing
              without prior written consent from Mizigo Administration.
            </li>
          </ul>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            4. Intellectual Property
          </h2>
          <p className="text-[13px] leading-relaxed">
            All content, database structures, designs, graphics, and software
            code contained within the Mizigo Portal are the intellectual
            property of Mizigo and are protected by applicable copyright,
            trademark, and intellectual property laws of the United Republic of
            Tanzania and international treaties.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            5. Limitation of Liability
          </h2>
          <p className="text-[13px] leading-relaxed">
            To the maximum extent permitted by law, Mizigo and its operators
            shall not be liable for any direct, indirect, incidental, or
            consequential damages resulting from (a) the use or inability to use
            the portal; (b) delays in railway transportation or inaccurate ETA
            calculations; (c) unauthorized access to or alteration of cargo
            tracking numbers; or (d) any service interruptions.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            6. Governing Law
          </h2>
          <p className="text-[13px] leading-relaxed">
            These Terms of Service shall be governed by and construed in
            accordance with the laws of the United Republic of Tanzania, without
            regard to its conflict of law principles. Any legal action arising
            out of or relating to these terms shall be subject to the exclusive
            jurisdiction of the courts of Tanzania.
          </p>
        </div>

        <div>
          <h2 className="text-xl font-black text-blue-400 uppercase tracking-wider mb-3">
            7. Modifications to Terms
          </h2>
          <p className="text-[13px] leading-relaxed">
            We reserve the right to revise or update these Terms of Service at
            any time. Changes will be posted directly to this page with an
            updated revision date. Continued use of the portal after changes
            have been posted constitutes acceptance of the new terms.
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
