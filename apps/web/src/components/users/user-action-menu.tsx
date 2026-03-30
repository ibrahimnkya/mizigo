"use client";

import { useState } from "react";
import { MoreHorizontal, Eye, Edit2, Shield, Calendar, Mail, MapPin, Flag, Trash2 } from "lucide-react";
import { cn } from "@repo/ui/utils";
import { 
    DropdownMenu, 
    DropdownMenuContent, 
    DropdownMenuItem, 
    DropdownMenuTrigger 
} from "@repo/ui/dropdown-menu";
import { 
    Dialog, 
    DialogContent, 
    DialogHeader, 
    DialogTitle,
    DialogDescription,
    DialogFooter
} from "@repo/ui/dialog";
import { 
    Tooltip,
    TooltipContent,
    TooltipProvider,
    TooltipTrigger,
} from "@repo/ui/tooltip";
import { Button } from "@repo/ui/button";

export function UserActionMenu({ user, currentUserRole }: { user: any, currentUserRole?: string }) {
    const [viewOpen, setViewOpen] = useState(false);
    const [editOpen, setEditOpen] = useState(false);
    const [deleteOpen, setDeleteOpen] = useState(false);
    const [deleting, setDeleting] = useState(false);
    
    const handleDelete = async () => {
        setDeleting(true);
        try {
            const res = await fetch(`/api/users/${user.id}`, {
                method: 'DELETE'
            });
            if (!res.ok) throw new Error('Failed to delete user');
            setDeleteOpen(false);
            window.location.reload();
        } catch (error) {
            console.error(error);
            alert('Error deleting user');
        } finally {
            setDeleting(false);
        }
    };
    
    // Only SUPER_ADMIN or ADMIN can edit, and ADMIN can't edit SUPER_ADMIN
    const canEdit = currentUserRole === 'SUPER_ADMIN' || 
                    (currentUserRole === 'ADMIN' && user.role?.name !== 'SUPER_ADMIN' && user.role?.name !== 'ADMIN');

    return (
        <TooltipProvider delayDuration={0}>
            <div className="flex items-center gap-1.5 px-2">
                {/* VIEW ACTION */}
                <Tooltip>
                    <TooltipTrigger asChild>
                        <button 
                            onClick={() => setViewOpen(true)}
                            className="w-9 h-9 rounded-xl flex items-center justify-center bg-white border border-slate-100 text-slate-400 hover:text-blue-600 hover:bg-blue-50 hover:border-blue-100 transition-all active:scale-90 shadow-sm"
                        >
                            <Eye size={16} strokeWidth={2.5} />
                        </button>
                    </TooltipTrigger>
                    <TooltipContent side="top" className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-lg shadow-xl">
                        View Details
                    </TooltipContent>
                </Tooltip>

                {/* EDIT ACTION */}
                {canEdit && (
                    <Tooltip>
                        <TooltipTrigger asChild>
                            <button 
                                onClick={() => setEditOpen(true)}
                                className="w-9 h-9 rounded-xl flex items-center justify-center bg-white border border-slate-100 text-slate-400 hover:text-blue-600 hover:bg-blue-50 hover:border-blue-100 transition-all active:scale-90 shadow-sm"
                            >
                                <Edit2 size={16} strokeWidth={2.5} />
                            </button>
                        </TooltipTrigger>
                        <TooltipContent side="top" className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-lg shadow-xl">
                            Edit Member
                        </TooltipContent>
                    </Tooltip>
                )}

                {/* DELETE/ARCHIVE ACTION */}
                {canEdit && (
                    <Tooltip>
                        <TooltipTrigger asChild>
                            <button 
                                onClick={() => setDeleteOpen(true)}
                                className={cn(
                                    "w-9 h-9 rounded-xl flex items-center justify-center bg-white border border-slate-100 transition-all active:scale-90 shadow-sm",
                                    user.role?.name === 'AGENT' 
                                        ? "text-slate-400 hover:text-amber-600 hover:bg-amber-50 hover:border-amber-100" 
                                        : "text-slate-400 hover:text-rose-600 hover:bg-rose-50 hover:border-rose-100"
                                )}
                            >
                                <Trash2 size={16} strokeWidth={2.5} />
                            </button>
                        </TooltipTrigger>
                        <TooltipContent side="top" className="bg-slate-900 text-white border-none font-bold text-[11px] px-3 py-1.5 rounded-lg shadow-xl">
                            {user.role?.name === 'AGENT' ? 'Archive Agent' : 'Delete Account'}
                        </TooltipContent>
                    </Tooltip>
                )}
            </div>

            {/* VIEW MODAL */}
            <Dialog open={viewOpen} onOpenChange={setViewOpen}>
                <DialogContent className="sm:max-w-[480px] p-0 overflow-hidden bg-slate-50 border-slate-200 shadow-2xl rounded-2xl">
                    <div className="bg-white p-8 border-b border-slate-100 flex flex-col items-center gap-5 relative overflow-hidden">
                        {/* Decorative background */}
                        <div className="absolute -top-10 -right-10 w-40 h-40 bg-blue-50 rounded-full blur-3xl opacity-50" />
                        
                        <div className="w-20 h-20 rounded-[24px] bg-blue-600 text-white flex items-center justify-center text-3xl font-black shadow-xl shadow-blue-200 relative z-10 border-4 border-white">
                            {user.name?.charAt(0).toUpperCase() || '?'}
                        </div>
                        <div className="text-center relative z-10">
                            <h2 className="text-xl font-extrabold text-slate-900 tracking-tight">{user.name}</h2>
                            <p className="text-[14px] text-slate-500 font-medium mt-0.5">{user.email || 'No email provided'}</p>
                        </div>
                        <div className="flex gap-2 relative z-10">
                            <span className="inline-flex items-center gap-1.5 px-4 py-1.5 bg-blue-50 text-blue-700 text-[11px] font-black rounded-xl tracking-wider uppercase border border-blue-100 shadow-sm">
                                <Shield size={12} strokeWidth={2.5} />
                                {user.role?.name || 'USER'}
                            </span>
                            {user.isFirstLogin && (
                                <span className="inline-flex items-center gap-1.5 px-4 py-1.5 bg-amber-50 text-amber-700 text-[11px] font-black rounded-xl tracking-wider uppercase border border-amber-100 shadow-sm">
                                    Pending Setup
                                </span>
                            )}
                        </div>
                    </div>
                    
                    <div className="p-6 gap-6 flex flex-col">
                        <div className="grid grid-cols-2 gap-4">
                            <div className="bg-white p-4 rounded-xl border border-slate-100 shadow-sm flex flex-col gap-1.5">
                                <span className="text-[10px] uppercase tracking-widest font-extrabold text-slate-400 flex items-center gap-1.5">
                                    <Mail size={12} /> Email
                                </span>
                                <span className="text-[13px] font-medium text-slate-800 break-all">{user.email || '—'}</span>
                            </div>
                            <div className="bg-white p-4 rounded-xl border border-slate-100 shadow-sm flex flex-col gap-1.5">
                                <span className="text-[10px] uppercase tracking-widest font-extrabold text-slate-400 flex items-center gap-1.5">
                                    <Flag size={12} /> Phone
                                </span>
                                <span className="text-[13px] font-medium text-slate-800">{user.phone || '—'}</span>
                            </div>
                            <div className="bg-white p-4 rounded-xl border border-slate-100 shadow-sm flex flex-col gap-1.5">
                                <span className="text-[10px] uppercase tracking-widest font-extrabold text-slate-400 flex items-center gap-1.5">
                                    <Calendar size={12} /> Joined
                                </span>
                                <span className="text-[13px] font-medium text-slate-800">
                                    {new Date(user.createdAt).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })}
                                </span>
                            </div>
                            <div className="bg-white p-4 rounded-xl border border-slate-100 shadow-sm flex flex-col gap-1.5">
                                <span className="text-[10px] uppercase tracking-widest font-extrabold text-slate-400 flex items-center gap-1.5">
                                    <MapPin size={12} /> Station
                                </span>
                                <span className="text-[13px] font-bold text-slate-800">{user.station?.name || 'All Stations / None'}</span>
                            </div>
                        </div>
                    </div>
                </DialogContent>
            </Dialog>

            {/* DELETE CONFIRMATION */}
            <Dialog open={deleteOpen} onOpenChange={setDeleteOpen}>
                <DialogContent className="sm:max-w-[400px] p-0 overflow-hidden bg-white rounded-[24px] shadow-2xl border-none">
                    <div className="p-8 flex flex-col items-center text-center gap-4">
                        <div className="w-16 h-16 rounded-full bg-rose-50 text-rose-600 flex items-center justify-center mb-2">
                            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
                        </div>
                        <div>
                            <DialogTitle className="text-xl font-black text-slate-900 tracking-tight">
                                {user.role?.name === 'AGENT' ? 'Confirm Agent Archive' : 'Confirm Account Deletion'}
                            </DialogTitle>
                            <DialogDescription className="text-slate-500 font-medium text-[14px] mt-2">
                                {user.role?.name === 'AGENT' 
                                    ? `Are you sure you want to archive agent ` 
                                    : `Are you sure you want to delete profile `}
                                <span className="font-bold text-slate-900">"{user.name}"</span>? 
                                {user.role?.name === 'AGENT' 
                                    ? " Archiving will hide them from active lists but preserve their history." 
                                    : " This will archive their records and revoke all access immediately."}
                            </DialogDescription>
                        </div>
                    </div>
                    <div className="p-6 bg-slate-50 flex flex-col gap-3">
                        <Button 
                            onClick={handleDelete}
                            disabled={deleting}
                            className={cn(
                                "w-full h-12 text-white font-bold rounded-xl shadow-lg transition-all active:scale-95",
                                user.role?.name === 'AGENT' 
                                    ? "bg-amber-600 hover:bg-amber-700 shadow-amber-100" 
                                    : "bg-rose-600 hover:bg-rose-700 shadow-rose-100"
                            )}
                        >
                            {deleting ? 'Processing...' : (user.role?.name === 'AGENT' ? 'Yes, Archive Agent' : 'Yes, Delete Account')}
                        </Button>
                        <Button 
                            variant="ghost" 
                            onClick={() => setDeleteOpen(false)}
                            className="w-full h-12 text-slate-500 hover:text-slate-900 font-bold rounded-xl transition-all"
                        >
                            Cancel
                        </Button>
                    </div>
                </DialogContent>
            </Dialog>
        </TooltipProvider>
    );
}
