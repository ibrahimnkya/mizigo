"use client";
import { Suspense, useState } from "react";

import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api/client";
import {
  Package,
  ShieldCheck,
  Plus,
  Smartphone,
  Download,
  History,
  Globe,
  Zap,
  Search,
  Database,
  Loader2,
  CheckCircle2,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { format } from "date-fns";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
import { Activity } from "lucide-react";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
  SheetDescription,
} from "@repo/ui/sheet";
import { Input } from "@repo/ui/input";
import { Label } from "@repo/ui/label";
import { toast } from "sonner";

function AppVersionsPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";
  const [openPublish, setOpenPublish] = useState(false);
  const [forceUpdate, setForceUpdate] = useState(false);

  const { data: versions, isLoading } = useQuery({
    queryKey: ["app-versions"],
    queryFn: async () => {
      const { data } = await api.get("/app-versions");
      return data.data || data;
    },
  });

  const { mutate: publishVersion, isPending: isPublishing } = useMutation({
    mutationFn: async (payload: any) => {
      const { data } = await api.post("/app-versions", payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["app-versions"] });
      toast.success("App version published successfully");
      setOpenPublish(false);
      setForceUpdate(false);
    },
    onError: (err: any) => {
      toast.error(
        err.response?.data?.error?.message || "Failed to publish version"
      );
    },
  });

  const handlePublishSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    const payload = {
      version: formData.get("version") as string,
      minSupportedVersion: formData.get("minSupportedVersion") as string,
      downloadUrl: formData.get("downloadUrl") as string,
      forceUpdate: forceUpdate,
    };
    publishVersion(payload);
  };

  const latest = versions?.[0];

  if (isLoading) {
    return (
      <div className="min-h-screen bg-[#f8f9fb] flex items-center justify-center">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10">
      <div className="max-w-[1520px] mx-auto flex flex-col gap-6">
        <ReportPageHeader
          title="App Versions"
          subtitle="Manage platform releases and device deployment"
          iconName="Smartphone"
          action={
            <Sheet open={openPublish} onOpenChange={setOpenPublish}>
              <SheetTrigger asChild>
                <button className="h-11 px-6 bg-slate-900 text-white rounded-[10px] text-[11px] font-black uppercase tracking-widest flex items-center gap-2 shadow-xl shadow-slate-900/10 hover:bg-slate-800 transition-all active:scale-95">
                  <Plus size={14} strokeWidth={3} />
                  Publish New Version
                </button>
              </SheetTrigger>
              <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden border border-slate-100 bg-white shadow-2xl rounded-2xl flex flex-col">
                <div className="bg-slate-900 px-8 py-8 flex items-center gap-5 shrink-0 relative overflow-hidden">
                  <div className="absolute inset-0 bg-gradient-to-br from-blue-600/10 to-transparent pointer-events-none" />
                  <div className="w-12 h-12 rounded-[10px] bg-white/10 border border-white/10 flex items-center justify-center shrink-0 relative z-10 shadow-2xl backdrop-blur-md">
                    <Database className="w-6 h-6 text-white" strokeWidth={2.5} />
                  </div>
                  <div className="flex flex-col relative z-10 text-left">
                    <SheetTitle className="text-[20px] font-black text-white tracking-tight leading-tight uppercase">
                      Publish App Version
                    </SheetTitle>
                    <SheetDescription className="text-white/40 text-[11px] font-bold uppercase tracking-[0.2em] mt-0.5">
                      Deploy a new release to the mobile application ecosystem
                    </SheetDescription>
                  </div>
                </div>

                <form
                  id="publish-version-form"
                  onSubmit={handlePublishSubmit}
                  className="p-8 space-y-8 flex-1 overflow-y-auto custom-scrollbar"
                >
                  <div className="space-y-6">
                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Version Code
                      </Label>
                      <Input
                        name="version"
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold focus:ring-4 focus:ring-blue-50 focus:border-blue-500 transition-all"
                        placeholder="e.g. 1.0.0"
                        required
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Minimum Supported Version
                      </Label>
                      <Input
                        name="minSupportedVersion"
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold focus:ring-4 focus:ring-blue-50 focus:border-blue-500 transition-all"
                        placeholder="e.g. 1.0.0"
                        required
                      />
                    </div>

                    <div className="space-y-2">
                      <Label className="text-[10px] font-black uppercase tracking-widest text-slate-400 ml-1">
                        Binary Download URL
                      </Label>
                      <Input
                        name="downloadUrl"
                        className="h-14 px-5 bg-slate-50 border-slate-100 rounded-[10px] text-[14px] font-bold focus:ring-4 focus:ring-blue-50 focus:border-blue-500 transition-all"
                        placeholder="e.g. https://example.com/app.apk"
                        required
                      />
                    </div>

                    <div className="flex items-center justify-between p-4 bg-slate-50 border border-slate-100 rounded-[10px]">
                      <div className="flex flex-col text-left">
                        <span className="text-[11px] font-black uppercase tracking-widest text-slate-900">
                          Force Update
                        </span>
                        <span className="text-[9px] font-bold text-slate-400 uppercase tracking-tight mt-0.5">
                          Enforce mandatory update compliance
                        </span>
                      </div>
                      <input
                        type="checkbox"
                        checked={forceUpdate}
                        onChange={(e) => setForceUpdate(e.target.checked)}
                        className="w-5 h-5 rounded border-slate-300 text-blue-600 focus:ring-blue-500 cursor-pointer"
                      />
                    </div>
                  </div>
                </form>

                <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
                  <button
                    type="button"
                    onClick={() => setOpenPublish(false)}
                    className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-50 transition-all active:scale-[0.98]"
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    form="publish-version-form"
                    disabled={isPublishing}
                    className="flex-[1.5] h-14 rounded-xl bg-slate-900 text-white text-[11px] font-black uppercase tracking-[0.2em] hover:bg-slate-800 transition-all shadow-xl shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
                  >
                    {isPublishing ? (
                      <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
                    ) : (
                      <>
                        <CheckCircle2 size={16} strokeWidth={3} />
                        Publish Release
                      </>
                    )}
                  </button>
                </div>
              </SheetContent>
            </Sheet>
          }
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              {/* Stats */}
              <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
                {[
                  {
                    label: "Registered Devices",
                    value: versions?.length ? "—" : "0",
                    icon: Smartphone,
                    color: "text-blue-600",
                    tag: "All Platforms",
                  },
                  {
                    label: "Current Status",
                    value: latest ? "Live" : "None",
                    icon: Globe,
                    color: "text-emerald-600",
                    tag: "Deployment",
                  },
                  {
                    label: "Force Update",
                    value: latest?.forceUpdate ? "On" : "Off",
                    icon: Zap,
                    color: "text-amber-500",
                    tag: "Update Policy",
                  },
                  {
                    label: "Platforms",
                    value: "Android + iOS",
                    icon: ShieldCheck,
                    color: "text-slate-900",
                    tag: "Supported",
                  },
                ].map((stat, i) => (
                  <div
                    key={i}
                    className="flex flex-col p-6 bg-white border border-slate-100 rounded-[10px] shadow-sm group hover:border-slate-300 transition-all hover:shadow-xl hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div
                        className={cn(
                          "w-12 h-12 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-slate-900 group-hover:text-white",
                          stat.color,
                        )}
                      >
                        <stat.icon size={22} strokeWidth={2.5} />
                      </div>
                      <span className="text-[10px] font-black uppercase tracking-widest px-3 py-1.5 rounded-[10px] bg-slate-50 text-slate-400 font-bold group-hover:bg-blue-50 group-hover:text-blue-600">
                        {stat.tag}
                      </span>
                    </div>
                    <div>
                      <h4 className="text-[32px] font-black tracking-tight text-slate-900 leading-none">
                        {stat.value}
                      </h4>
                      <p className="text-[12px] font-black text-slate-400 uppercase tracking-[0.2em] mt-3 leading-none">
                        {stat.label}
                      </p>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-slate-900 rounded-[10px] p-8 text-white relative overflow-hidden shadow-2xl flex flex-col justify-between min-h-[400px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />

                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-[10px] bg-white/10 flex items-center justify-center mb-8 border border-white/10 backdrop-blur-md shadow-2xl shadow-blue-500/10">
                      <Smartphone
                        className="h-6 w-6 text-blue-400"
                        strokeWidth={2.5}
                      />
                    </div>
                    <h3 className="text-[24px] font-black tracking-tight leading-none mb-3">
                      Release Management
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80 mb-6">
                      Distribute app updates seamlessly across platforms. Use
                      forced updates to enforce compliance and network
                      compatibility.
                    </p>
                  </div>

                  <div className="relative z-10 space-y-3">
                    <div className="px-4 py-3 bg-white/5 rounded-[10px] border border-white/5 flex items-center justify-between group hover:border-white/20 transition-all">
                      <div className="flex flex-col">
                        <span className="text-[10px] font-black uppercase tracking-widest text-slate-400 group-hover:text-white transition-colors">
                          Latest Version
                        </span>
                        <span className="text-[8px] font-bold text-slate-600 uppercase tracking-tight">
                          Active Node
                        </span>
                      </div>
                      <span className="text-[14px] font-black text-emerald-400 tabular-nums">
                        {latest?.version || "N/A"}
                      </span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[10px] border border-slate-100 shadow-sm p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-black text-slate-900 mb-2">
                    Version Adoption Stats
                  </h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Detailed graphical analysis of application distribution and
                    version adoption will be populated here.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white rounded-[12px] border border-slate-200/60 shadow-sm overflow-hidden p-1">
              <div className="bg-white rounded-[10px] border border-slate-100 shadow-sm overflow-hidden">
                <div className="p-8 border-b border-slate-50 bg-slate-50/30 flex items-center justify-between">
                  <div className="flex items-center gap-3">
                    <div className="p-2 bg-slate-900 rounded-[10px] text-white">
                      <History size={16} strokeWidth={2.5} />
                    </div>
                    <div>
                      <h3 className="text-[16px] font-black text-slate-900 tracking-tight">
                        Release History
                      </h3>
                      <p className="text-[11px] font-bold text-slate-400 uppercase tracking-widest">
                        All published app versions
                      </p>
                    </div>
                  </div>
                </div>

                <div className="overflow-x-auto">
                  <table className="w-full text-left border-collapse">
                    <thead>
                      <tr className="bg-slate-50/50">
                        <th className="px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-widest">
                          Version
                        </th>
                        <th className="px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-widest">
                          Platform
                        </th>
                        <th className="px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-widest">
                          Status
                        </th>
                        <th className="px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-widest">
                          Release Date
                        </th>
                        <th className="px-8 py-5 text-[10px] font-black text-slate-400 uppercase tracking-widest text-right">
                          Download
                        </th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-50">
                      {(versions || []).length === 0 ? (
                        <tr>
                          <td
                            colSpan={5}
                            className="px-8 py-16 text-center text-[13px] font-black text-slate-300 uppercase tracking-widest"
                          >
                            No versions published yet
                          </td>
                        </tr>
                      ) : (
                        (versions || []).map((v: any, i: number) => (
                          <tr
                            key={i}
                            className="hover:bg-slate-50/50 transition-colors group cursor-pointer"
                          >
                            <td className="px-8 py-6">
                              <div className="flex items-center gap-4">
                                <div className="w-10 h-10 rounded-[10px] bg-slate-900/5 flex items-center justify-center text-slate-400 group-hover:bg-slate-900 group-hover:text-white transition-all">
                                  <Package size={18} strokeWidth={2.5} />
                                </div>
                                <div>
                                  <span className="text-[14px] font-black text-slate-900 block leading-tight">
                                    {v.version}
                                  </span>
                                  <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">
                                    Release
                                  </span>
                                </div>
                              </div>
                            </td>
                            <td className="px-8 py-6">
                              <div className="flex gap-2">
                                {["Android", "iOS"].map((p) => (
                                  <span
                                    key={p}
                                    className="px-2 py-1 bg-slate-100 text-slate-500 rounded-[10px] text-[9px] font-black uppercase tracking-widest"
                                  >
                                    {p}
                                  </span>
                                ))}
                              </div>
                            </td>
                            <td className="px-8 py-6">
                              <div className="flex items-center gap-2">
                                <div
                                  className={cn(
                                    "h-1.5 w-1.5 rounded-full",
                                    i === 0 ? "bg-emerald-500" : "bg-slate-300",
                                  )}
                                />
                                <span
                                  className={cn(
                                    "text-[11px] font-black uppercase tracking-widest",
                                    i === 0
                                      ? "text-emerald-700"
                                      : "text-slate-500",
                                  )}
                                >
                                  {i === 0 ? "Active" : "Archived"}
                                </span>
                              </div>
                            </td>
                            <td className="px-8 py-6 text-[12px] font-bold text-slate-500 tabular-nums">
                              {format(new Date(v.createdAt), "MMM dd, yyyy")}
                            </td>
                            <td className="px-8 py-6 text-right">
                              <a
                                href={v.downloadUrl || "#"}
                                className="h-9 px-4 bg-slate-50 text-slate-400 rounded-[10px] text-[10px] font-black uppercase tracking-widest hover:bg-blue-600 hover:text-white transition-all inline-flex items-center gap-2 ml-auto"
                              >
                                Download <Download size={12} strokeWidth={3} />
                              </a>
                            </td>
                          </tr>
                        ))
                      )}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default function AppVersionsPage() {
  return (
    <Suspense
      fallback={
        <div className="min-h-screen bg-[#f8f9fb] p-6 lg:p-10 flex items-center justify-center text-slate-400">
          Loading page...
        </div>
      }
    >
      <AppVersionsPageInner />
    </Suspense>
  );
}
