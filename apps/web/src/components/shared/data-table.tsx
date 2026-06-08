"use client";

import { useState, useMemo } from "react";
import {
  ChevronLeft,
  ChevronRight,
  Search,
  Plus,
  MoreVertical,
  ArrowUpDown,
} from "lucide-react";
import { cn } from "@/lib/utils";

interface Column<T> {
  header: string;
  accessor: keyof T | ((item: T) => React.ReactNode);
  sortable?: boolean;
  align?: "left" | "right";
}

interface DataTableProps<T> {
  data: T[];
  columns: Column<T>[];
  title?: string;
  onCreate?: () => void;
  onSearch?: (query: string) => void;
  isLoading?: boolean;
  emptyMessage?: string;
  searchPlaceholder?: string;
  searchKey?: string;
  hideActions?: boolean;
  hideInternalSearch?: boolean;
  onRowClick?: (item: T) => void;
}

export function DataTable<T>({
  data,
  columns,
  title,
  onCreate,
  onSearch,
  isLoading,
  emptyMessage = "No records found.",
  searchPlaceholder = "Search...",
  searchKey,
  hideActions,
  hideInternalSearch,
  onRowClick,
}: DataTableProps<T>) {
  const [search, setSearch] = useState("");
  const [currentPage, setCurrentPage] = useState(1);
  const [pageSize, setPageSize] = useState(10);

  const filteredData = useMemo(() => {
    let result = data;
    if (search && searchKey) {
      result = data.filter((item: any) => {
        const val = item[searchKey];
        return val?.toString().toLowerCase().includes(search.toLowerCase());
      });
    }
    return result;
  }, [data, search, searchKey]);

  const totalPages = Math.ceil(filteredData.length / pageSize);
  const paginatedData = filteredData.slice(
    (currentPage - 1) * pageSize,
    currentPage * pageSize,
  );

  return (
    <div className="bg-white overflow-hidden flex flex-col animate-in fade-in duration-500">
      {/* Header — only rendered when there's something to show */}
      {(!hideInternalSearch && (onSearch || searchKey)) || onCreate || title ? (
        <div className="px-6 py-4 flex flex-col sm:flex-row sm:items-center justify-between gap-3 border-b border-slate-100">
          {title && (
            <div>
              <h3 className="text-[15px] font-black text-slate-900 tracking-tight">
                {title}
              </h3>
              <p className="text-[10px] text-slate-400 font-black uppercase tracking-widest mt-0.5">
                {filteredData.length} entries
              </p>
            </div>
          )}

          <div className="flex items-center gap-2 ml-auto">
            {/* Search Box */}
            {!hideInternalSearch && (onSearch || searchKey) && (
              <div className="relative group">
                <Search
                  className="absolute left-3.5 top-1/2 -translate-y-1/2 h-3.5 w-3.5 text-slate-400 group-focus-within:text-blue-600 transition-colors"
                  strokeWidth={3}
                />
                <input
                  type="text"
                  placeholder={searchPlaceholder}
                  className="pl-10 pr-4 h-9 w-full sm:w-64 bg-slate-50 border border-slate-200 rounded-[10px] text-[12px] font-semibold focus:outline-none focus:ring-2 focus:ring-blue-500/10 focus:border-blue-400 transition-all placeholder:text-slate-300"
                  value={search}
                  onChange={(e) => {
                    setSearch(e.target.value);
                    setCurrentPage(1);
                    if (onSearch) onSearch(e.target.value);
                  }}
                />
              </div>
            )}

            {/* Add New Record */}
            {onCreate && (
              <button
                onClick={onCreate}
                className="h-9 px-5 bg-slate-900 hover:bg-blue-600 text-white text-[10px] font-black uppercase tracking-widest rounded-[10px] flex items-center gap-2 transition-all active:scale-95"
              >
                <Plus className="h-3.5 w-3.5" strokeWidth={3} />
                Add New
              </button>
            )}
          </div>
        </div>
      ) : null}

      {/* Table */}
      <div className="overflow-x-auto">
        <table className="w-full text-left border-collapse min-w-[800px]">
          <thead>
            <tr className="bg-slate-900">
              {columns.map((col, idx) => (
                <th
                  key={idx}
                  className={cn(
                    "px-6 py-5 text-[10px] font-black text-white/60 uppercase tracking-widest border-b border-slate-800",
                    col.align === "right" && "text-right",
                  )}
                >
                  <div
                    className={cn(
                      "flex items-center gap-2",
                      col.align === "right" && "justify-end",
                    )}
                  >
                    {col.header}
                    {col.sortable && (
                      <ArrowUpDown className="h-3 w-3 opacity-50" />
                    )}
                  </div>
                </th>
              ))}
              {!hideActions && (
                <th className="px-6 py-5 text-[10px] font-black text-white/60 uppercase tracking-widest border-b border-slate-800 text-right">
                  Options
                </th>
              )}
            </tr>
          </thead>

          <tbody className="divide-y divide-slate-50">
            {isLoading ? (
              Array.from({ length: 5 }).map((_, i) => (
                <tr key={i} className="animate-pulse">
                  {columns.map((_, j) => (
                    <td key={j} className="px-6 py-6">
                      <div className="h-10 bg-slate-100 rounded-[10px]" />
                    </td>
                  ))}
                  {!hideActions && (
                    <td className="px-6 py-6">
                      <div className="h-10 w-12 bg-slate-100 rounded-[10px] ml-auto" />
                    </td>
                  )}
                </tr>
              ))
            ) : paginatedData.length === 0 ? (
              <tr>
                <td
                  colSpan={columns.length + (hideActions ? 0 : 1)}
                  className="px-6 py-20 text-center"
                >
                  <div className="flex flex-col items-center gap-4">
                    <div className="w-16 h-16 rounded-[10px] bg-slate-50 flex items-center justify-center border border-slate-100">
                      <Search className="h-8 w-8 text-slate-200" />
                    </div>
                    <div>
                      <p className="text-[13px] font-bold text-slate-900">
                        {emptyMessage}
                      </p>
                      <p className="text-[11px] text-slate-400 mt-1">
                        Try a different search or filters.
                      </p>
                    </div>
                  </div>
                </td>
              </tr>
            ) : (
              paginatedData.map((item, rowIdx) => (
                <tr
                  key={rowIdx}
                  onClick={() => onRowClick?.(item)}
                  className={cn(
                    "group hover:bg-slate-50/70 transition-colors duration-150 border-b border-slate-50 last:border-0",
                    onRowClick && "cursor-pointer",
                  )}
                >
                  {columns.map((col, colIdx) => (
                    <td
                      key={colIdx}
                      className={cn(
                        "px-6 py-[18px]",
                        col.align === "right" && "text-right",
                      )}
                    >
                      {typeof col.accessor === "function"
                        ? col.accessor(item)
                        : (item[col.accessor as keyof T] as React.ReactNode)}
                    </td>
                  ))}
                  {!hideActions && (
                    <td className="px-6 py-[18px] text-right">
                      <div className="flex items-center justify-end gap-1 opacity-0 group-hover:opacity-100 transition-all">
                        <button className="h-9 w-9 flex items-center justify-center hover:bg-slate-900 hover:text-white rounded-[10px] border border-slate-100 bg-white shadow-sm">
                          <MoreVertical className="h-4 w-4 text-slate-400" />
                        </button>
                      </div>
                    </td>
                  )}
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>

      {/* Footer */}
      <div className="px-6 py-5 border-t border-slate-100 bg-slate-50/10 flex flex-col sm:flex-row items-center justify-between gap-4">
        <div className="flex flex-col sm:flex-row items-center gap-4 sm:gap-6 w-full sm:w-auto text-center sm:text-left">
          <span className="text-[10px] text-slate-400 font-bold uppercase tracking-widest">
            Showing {(currentPage - 1) * pageSize + 1} to{" "}
            {Math.min(currentPage * pageSize, filteredData.length)} of{" "}
            {filteredData.length} entries
          </span>

          <div className="flex items-center justify-center gap-2">
            <span className="text-[10px] text-slate-400 font-bold uppercase tracking-widest">
              Show
            </span>
            <select
              value={pageSize}
              onChange={(e) => {
                setPageSize(Number(e.target.value));
                setCurrentPage(1);
              }}
              className="h-8 px-2 bg-white border border-slate-200 rounded-[6px] text-[11px] font-bold outline-none focus:ring-2 focus:ring-blue-500/10 transition-all"
            >
              {[10, 20, 30, 40, 50].map((size) => (
                <option key={size} value={size}>
                  {size}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex items-center justify-center gap-1.5 w-full sm:w-auto">
          <button
            disabled={currentPage === 1}
            onClick={() => setCurrentPage((prev) => Math.max(1, prev - 1))}
            className="h-9 w-9 flex items-center justify-center rounded-[10px] border border-slate-200 bg-white hover:bg-slate-50 disabled:opacity-30 transition-all shadow-sm"
          >
            <ChevronLeft className="h-4 w-4 text-slate-600" strokeWidth={3} />
          </button>

          <div className="flex items-center bg-white border border-slate-200 rounded-[10px] px-3 py-1.5 shadow-sm">
            <span className="text-[11px] font-bold text-slate-900">
              Page {currentPage} of {totalPages || 1}
            </span>
          </div>

          <button
            disabled={currentPage === totalPages || totalPages === 0}
            onClick={() =>
              setCurrentPage((prev) => Math.min(totalPages, prev + 1))
            }
            className="h-9 w-9 flex items-center justify-center rounded-[10px] border border-slate-200 bg-white hover:bg-slate-50 disabled:opacity-30 transition-all shadow-sm"
          >
            <ChevronRight className="h-4 w-4 text-slate-600" strokeWidth={3} />
          </button>
        </div>
      </div>
    </div>
  );
}
