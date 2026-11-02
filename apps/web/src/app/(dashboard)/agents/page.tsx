import { AgentsList } from "@/components/users/agents-list";
import { Panel } from "@/components/dashboard/dashboard-shell";
import { Users } from "lucide-react";

export default function AgentsPage() {
  return (
    <div className="flex flex-col gap-5">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-600 bg-slate-100 px-2.5 py-1 rounded-full">
              Workforce
            </span>
          </div>
          <h1 className="text-[20px] font-semibold text-slate-800 tracking-tight">
            Agents
          </h1>
          <p className="text-sm text-slate-400 font-medium mt-0.5">
            Manage agents and their regional assignments.
          </p>
        </div>

        <Panel title="All Agents" icon={Users} iconColor="text-indigo-400">
          <AgentsList />
        </Panel>
    </div>
  );
}
