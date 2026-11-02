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
  Database,
  Loader2,
  CheckCircle2,
  Pencil,
  Trash2,
  Activity,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { format } from "date-fns";

import { useSearchParams } from "next/navigation";
import { ReportPageHeader } from "@/components/reports/report-page-header";
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

type AppVersion = {
  id: string;
  version: string;
  minSupportedVersion: string;
  forceUpdate: boolean;
  downloadUrl: string | null;
  releaseNotes: string | null;
  createdAt: string;
};

function VersionSheet({
  trigger,
  title,
  subtitle,
  defaultValues,
  onSubmit,
  isPending,
  open,
  onOpenChange,
}: {
  trigger?: React.ReactNode;
  title: string;
  subtitle: string;
  defaultValues?: Partial<AppVersion>;
  onSubmit: (payload: any) => void;
  isPending: boolean;
  open: boolean;
  onOpenChange: (v: boolean) => void;
}) {
  const [forceUpdate, setForceUpdate] = useState(
    defaultValues?.forceUpdate ?? false
  );

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const fd = new FormData(e.currentTarget);
    onSubmit({
      version: fd.get("version") as string,
      minSupportedVersion: fd.get("minSupportedVersion") as string,
      downloadUrl: fd.get("downloadUrl") as string,
      releaseNotes: fd.get("releaseNotes") as string,
      forceUpdate,
    });
  };

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      {trigger && <SheetTrigger asChild>{trigger}</SheetTrigger>}
      <SheetContent className="w-full sm:w-[600px] sm:max-w-[600px] p-0 overflow-hidden border border-slate-100 bg-white  rounded-xl flex flex-col">
        <div className="px-6 py-4 border-b border-slate-200 flex items-center gap-3 shrink-0">
          <div className="w-9 h-9 rounded-xl bg-blue-50 border border-blue-100 flex items-center justify-center shrink-0">
            <Database className="w-6 h-6 text-white" strokeWidth={2.5} />
          </div>
          <div className="flex flex-col relative z-10 text-left">
            <SheetTitle className="text-[16px] font-semibold text-slate-800 leading-tight">
              {title}
            </SheetTitle>
            <SheetDescription className="text-[12px] text-slate-500 mt-0.5">
              {subtitle}
            </SheetDescription>
          </div>
        </div>

        <form
          id="version-form"
          onSubmit={handleSubmit}
          className="p-8 space-y-6 flex-1 overflow-y-auto custom-scrollbar"
        >
          <div className="grid grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400 ml-1">
                Version
              </Label>
              <Input
                name="version"
                defaultValue={defaultValues?.version}
                className="h-12 px-4 bg-slate-50 border-slate-100 rounded-xl text-[14px] font-bold"
                placeholder="e.g. 1.2.0"
                required
              />
            </div>
            <div className="space-y-2">
              <Label className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400 ml-1">
                Min Supported
              </Label>
              <Input
                name="minSupportedVersion"
                defaultValue={defaultValues?.minSupportedVersion}
                className="h-12 px-4 bg-slate-50 border-slate-100 rounded-xl text-[14px] font-bold"
                placeholder="e.g. 1.0.0"
                required
              />
            </div>
          </div>

          <div className="space-y-2">
            <Label className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400 ml-1">
              Download URL
            </Label>
            <Input
              name="downloadUrl"
              defaultValue={defaultValues?.downloadUrl ?? ""}
              className="h-12 px-4 bg-slate-50 border-slate-100 rounded-xl text-[14px] font-bold"
              placeholder="https://example.com/mizigo.apk"
            />
          </div>

          <div className="space-y-2">
            <Label className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400 ml-1">
              Release Notes
            </Label>
            <textarea
              name="releaseNotes"
              defaultValue={defaultValues?.releaseNotes ?? ""}
              rows={4}
              className="w-full px-4 py-3 bg-slate-50 border border-slate-100 rounded-xl text-[13px] font-medium text-slate-700 resize-none focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-400 transition-all"
              placeholder="What's new in this release..."
            />
          </div>

          <div className="flex items-center justify-between p-4 bg-slate-50 border border-slate-100 rounded-xl">
            <div className="flex flex-col text-left">
              <span className="text-[11px] font-semibold uppercase tracking-[0.05em] text-slate-900">
                Force Update
              </span>
              <span className="text-[9px] font-bold text-slate-400 uppercase tracking-tight mt-0.5">
                Blocks app until user updates
              </span>
            </div>
            <input
              type="checkbox"
              checked={forceUpdate}
              onChange={(e) => setForceUpdate(e.target.checked)}
              className="w-5 h-5 rounded border-slate-300 text-blue-600 focus:ring-blue-500 cursor-pointer"
            />
          </div>
        </form>

        <div className="p-6 bg-slate-50 border-t border-slate-100 flex gap-3">
          <button
            type="button"
            onClick={() => onOpenChange(false)}
            className="flex-1 h-14 rounded-xl bg-white border border-slate-200 text-slate-400 text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-slate-50 transition-all active:scale-[0.98]"
          >
            Cancel
          </button>
          <button
            type="submit"
            form="version-form"
            disabled={isPending}
            className="flex-[1.5] h-14 rounded-xl bg-[#5C0B19] text-white text-[11px] font-semibold uppercase tracking-[0.05em] hover:bg-[#4F0A0C] transition-all  shadow-slate-200 flex items-center justify-center gap-3 active:scale-[0.98]"
          >
            {isPending ? (
              <Loader2 className="w-5 h-5 animate-spin" strokeWidth={3} />
            ) : (
              <>
                <CheckCircle2 size={16} strokeWidth={3} />
                Save Release
              </>
            )}
          </button>
        </div>
      </SheetContent>
    </Sheet>
  );
}

function AppVersionsPageInner() {
  const queryClient = useQueryClient();
  const searchParams = useSearchParams();
  const tab = searchParams.get("tab") || "overview";

  const [openPublish, setOpenPublish] = useState(false);
  const [editingVersion, setEditingVersion] = useState<AppVersion | null>(null);
  const [deletingId, setDeletingId] = useState<string | null>(null);

  const { data: versions, isLoading } = useQuery<AppVersion[]>({
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
      toast.success("Version published successfully");
      setOpenPublish(false);
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to publish version");
    },
  });

  const { mutate: editVersion, isPending: isEditing } = useMutation({
    mutationFn: async ({ id, payload }: { id: string; payload: any }) => {
      const { data } = await api.put(`/app-versions/${id}`, payload);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["app-versions"] });
      toast.success("Version updated");
      setEditingVersion(null);
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to update version");
    },
  });

  const { mutate: deleteVersion, isPending: isDeleting } = useMutation({
    mutationFn: async (id: string) => {
      const { data } = await api.delete(`/app-versions/${id}`);
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["app-versions"] });
      toast.success("Version removed");
      setDeletingId(null);
    },
    onError: (err: any) => {
      toast.error(err.response?.data?.error?.message || "Failed to delete version");
    },
  });

  const latest = versions?.[0];

  if (isLoading) {
    return (
      <div className="flex items-center justify-center min-h-[300px]">
        <div className="w-8 h-8 border-4 border-slate-200 border-t-blue-600 rounded-full animate-spin" />
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-5">
        <ReportPageHeader
          title="App Versions"
          subtitle="Manage platform releases and device deployment"
          iconName="Smartphone"
          action={
            <>
              <button
                onClick={() => setOpenPublish(true)}
                className="h-8 px-3 bg-blue-600 text-white rounded-xl text-[12px] font-semibold flex items-center gap-1.5 hover:bg-blue-700 transition-colors"
              >
                <Plus size={14} strokeWidth={3} />
                Publish New Version
              </button>

              {/* Publish sheet (no trigger — controlled externally) */}
              <VersionSheet
                open={openPublish}
                onOpenChange={setOpenPublish}
                title="Publish App Version"
                subtitle="Deploy a new release to the mobile app ecosystem"
                onSubmit={(payload) => publishVersion(payload)}
                isPending={isPublishing}
              />

              {/* Edit sheet */}
              {editingVersion && (
                <VersionSheet
                  open={!!editingVersion}
                  onOpenChange={(v) => { if (!v) setEditingVersion(null); }}
                  title="Edit Version"
                  subtitle="Update release details"
                  defaultValues={editingVersion}
                  onSubmit={(payload) =>
                    editVersion({ id: editingVersion.id, payload })
                  }
                  isPending={isEditing}
                />
              )}
            </>
          }
          tabs={["Overview", "All"]}
          tabParamName="tab"
          activeTab={tab}
          hideBackArrow={true}
        />

        <div className="mt-2 animate-in fade-in duration-700">
          {tab.toLowerCase() === "overview" && (
            <div className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
                {[
                  {
                    label: "Total Releases",
                    value: String(versions?.length ?? 0),
                    icon: Package,
                    color: "text-blue-600",
                    tag: "All Platforms",
                  },
                  {
                    label: "Latest Version",
                    value: latest?.version || "None",
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
                    className="flex flex-col p-6 bg-white border border-[#E2E2E2] rounded-[20px]  group hover:border-slate-300 transition-all hover: hover:shadow-slate-100/50"
                  >
                    <div className="flex items-center justify-between mb-4">
                      <div
                        className={cn(
                          "w-12 h-12 rounded-xl bg-slate-50 flex items-center justify-center border border-slate-100 transition-all group-hover:bg-[#5C0B19] group-hover:text-white",
                          stat.color
                        )}
                      >
                        <stat.icon size={22} strokeWidth={2.5} />
                      </div>
                      <span className="text-[10px] font-semibold uppercase tracking-[0.05em] px-3 py-1.5 rounded-xl bg-slate-50 text-slate-400 group-hover:bg-blue-50 group-hover:text-blue-600">
                        {stat.tag}
                      </span>
                    </div>
                    <div>
                      <h4 className="text-[20px] font-semibold tracking-tight text-slate-900 leading-none">
                        {stat.value}
                      </h4>
                      <p className="text-[12px] font-semibold text-slate-400 uppercase tracking-[0.05em] mt-3 leading-none">
                        {stat.label}
                      </p>
                    </div>
                  </div>
                ))}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <div className="lg:col-span-1 bg-[#5C0B19] rounded-xl p-8 text-white relative overflow-hidden  flex flex-col justify-between min-h-[360px]">
                  <div className="absolute top-[-100px] right-[-100px] w-80 h-80 bg-blue-500/10 rounded-full blur-[100px]" />
                  <div className="relative z-10">
                    <div className="h-12 w-12 rounded-xl bg-white/10 flex items-center justify-center mb-8 border border-slate-200   shadow-blue-500/10">
                      <Smartphone className="h-6 w-6 text-blue-400" strokeWidth={2.5} />
                    </div>
                    <h3 className="text-[24px] font-semibold tracking-tight leading-none mb-3">
                      Release Management
                    </h3>
                    <p className="text-slate-400 text-[13px] font-bold leading-relaxed opacity-80">
                      Distribute app updates seamlessly. Force updates enforce compliance and ensure all users run a supported version.
                    </p>
                  </div>
                  <div className="relative z-10 space-y-3 mt-6">
                    <div className="px-4 py-3 bg-white/5 rounded-xl border border-white/5 flex items-center justify-between">
                      <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">Latest</span>
                      <span className="text-[14px] font-semibold text-emerald-400 tabular-nums">{latest?.version || "N/A"}</span>
                    </div>
                    <div className="px-4 py-3 bg-white/5 rounded-xl border border-white/5 flex items-center justify-between">
                      <span className="text-[10px] font-semibold uppercase tracking-[0.05em] text-slate-400">Min Supported</span>
                      <span className="text-[14px] font-semibold text-blue-400 tabular-nums">{latest?.minSupportedVersion || "N/A"}</span>
                    </div>
                  </div>
                </div>

                <div className="lg:col-span-2 bg-white rounded-[20px] border border-[#E2E2E2]  p-8 flex flex-col items-center justify-center text-center">
                  <div className="w-16 h-16 rounded-full bg-blue-50 flex items-center justify-center mb-4">
                    <Activity className="w-8 h-8 text-blue-500" />
                  </div>
                  <h4 className="text-[16px] font-semibold text-slate-900 mb-2">Version Adoption Stats</h4>
                  <p className="text-[13px] text-slate-400 max-w-md">
                    Graphical analysis of version adoption across devices will appear here once device telemetry is connected.
                  </p>
                </div>
              </div>
            </div>
          )}

          {tab.toLowerCase() === "all" && (
            <div className="bg-white border border-[#E2E2E2] rounded-[20px] overflow-hidden p-1">
              <div className="bg-white rounded-[20px] border border-[#E2E2E2]  overflow-hidden">
                <div className="p-6 border-b border-slate-50 bg-slate-50/30 flex items-center gap-3">
                  <div className="p-2 bg-[#5C0B19] rounded-xl text-white">
                    <History size={16} strokeWidth={2.5} />
                  </div>
                  <div>
                    <h3 className="text-[16px] font-semibold text-slate-900 tracking-tight">Release History</h3>
                    <p className="text-[11px] font-bold text-slate-400 uppercase tracking-[0.05em]">
                      {versions?.length ?? 0} version{(versions?.length ?? 0) !== 1 ? "s" : ""} published
                    </p>
                  </div>
                </div>

                <div className="overflow-x-auto">
                  <table className="w-full text-left border-collapse">
                    <thead>
                      <tr className="bg-slate-50/50">
                        {["Version", "Min Supported", "Force Update", "Release Notes", "Published", ""].map((h) => (
                          <th key={h} className="px-6 py-4 text-[10px] font-semibold text-slate-400 uppercase tracking-[0.05em] whitespace-nowrap">
                            {h}
                          </th>
                        ))}
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-slate-50">
                      {(versions || []).length === 0 ? (
                        <tr>
                          <td colSpan={6} className="px-8 py-16 text-center text-[13px] font-semibold text-slate-300 uppercase tracking-[0.05em]">
                            No versions published yet
                          </td>
                        </tr>
                      ) : (
                        (versions || []).map((v, i) => (
                          <tr key={v.id} className="hover:bg-slate-50/50 transition-colors group">
                            <td className="px-6 py-5">
                              <div className="flex items-center gap-3">
                                <div className="w-9 h-9 rounded-xl bg-slate-900/5 flex items-center justify-center text-slate-400 group-hover:bg-[#5C0B19] group-hover:text-white transition-all">
                                  <Package size={16} strokeWidth={2.5} />
                                </div>
                                <div>
                                  <span className="text-[14px] font-semibold text-slate-900 block leading-tight">{v.version}</span>
                                  <span className={cn("text-[9px] font-semibold uppercase tracking-[0.05em]", i === 0 ? "text-emerald-600" : "text-slate-400")}>
                                    {i === 0 ? "● Active" : "Archived"}
                                  </span>
                                </div>
                              </div>
                            </td>
                            <td className="px-6 py-5 text-[12px] font-bold text-slate-500 tabular-nums">
                              {v.minSupportedVersion}
                            </td>
                            <td className="px-6 py-5">
                              <span className={cn(
                                "px-2.5 py-1 rounded-xl text-[10px] font-semibold uppercase tracking-[0.05em]",
                                v.forceUpdate
                                  ? "bg-red-50 text-red-600"
                                  : "bg-slate-100 text-slate-400"
                              )}>
                                {v.forceUpdate ? "Required" : "Optional"}
                              </span>
                            </td>
                            <td className="px-6 py-5 max-w-[240px]">
                              <span className="text-[12px] text-slate-500 line-clamp-2 leading-relaxed">
                                {v.releaseNotes || <span className="text-slate-300 italic">—</span>}
                              </span>
                            </td>
                            <td className="px-6 py-5 text-[12px] font-bold text-slate-500 tabular-nums whitespace-nowrap">
                              {format(new Date(v.createdAt), "MMM dd, yyyy")}
                            </td>
                            <td className="px-6 py-5">
                              <div className="flex items-center gap-2 justify-end">
                                {v.downloadUrl && (
                                  <a
                                    href={v.downloadUrl}
                                    className="h-8 w-8 bg-slate-50 text-slate-400 rounded-xl hover:bg-blue-600 hover:text-white transition-all inline-flex items-center justify-center"
                                    title="Download"
                                  >
                                    <Download size={13} strokeWidth={2.5} />
                                  </a>
                                )}
                                <button
                                  onClick={() => setEditingVersion(v)}
                                  className="h-8 w-8 bg-slate-50 text-slate-400 rounded-xl hover:bg-[#5C0B19] hover:text-white transition-all inline-flex items-center justify-center"
                                  title="Edit"
                                >
                                  <Pencil size={13} strokeWidth={2.5} />
                                </button>
                                <button
                                  onClick={() => {
                                    if (confirm(`Delete version ${v.version}?`)) {
                                      setDeletingId(v.id);
                                      deleteVersion(v.id);
                                    }
                                  }}
                                  disabled={isDeleting && deletingId === v.id}
                                  className="h-8 w-8 bg-slate-50 text-slate-400 rounded-xl hover:bg-red-600 hover:text-white transition-all inline-flex items-center justify-center disabled:opacity-40"
                                  title="Delete"
                                >
                                  {isDeleting && deletingId === v.id
                                    ? <Loader2 size={13} className="animate-spin" />
                                    : <Trash2 size={13} strokeWidth={2.5} />
                                  }
                                </button>
                              </div>
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
  );
}

export default function AppVersionsPage() {
  return (
    <Suspense
      fallback={
        <div className="flex items-center justify-center min-h-[300px]">
          Loading page...
        </div>
      }
    >
      <AppVersionsPageInner />
    </Suspense>
  );
}
