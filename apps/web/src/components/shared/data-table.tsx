"use client";

import { useEffect, useState, useMemo } from "react";
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
  // New filters/search → back to the first page (and never past the last one).
  useEffect(() => {
    setCurrentPage(1);
  }, [data.length, search]);
  useEffect(() => {
    if (totalPages > 0 && currentPage > totalPages) setCurrentPage(totalPages);
  }, [totalPages, currentPage]);
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
              <h3 className="text-[15px] font-semibold text-slate-900 tracking-tight">
                {title}
              </h3>
              <p className="text-[10px] text-slate-400 font-semibold uppercase tracking-[0.05em] mt-0.5">
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
                  className="pl-10 pr-4 h-9 w-full sm:w-64 bg-slate-50 border border-slate-200 rounded-xl text-[12px] font-semibold focus:outline-none focus:ring-2 focus:ring-orange-500/10 focus:border-blue-400 transition-all placeholder:text-slate-300"
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
                className="h-10 px-5 bg-[#5C0B19] hover:bg-[#4F0A0C] text-white text-[13px] font-semibold rounded-full flex items-center gap-2 transition-all active:scale-95"
              >
                <Plus className="h-3.5 w-3.5" strokeWidth={3} />
                Add New
              </button>
            )}
          </div>
        </div>
      ) : null}

      {/* Phones: each row as a card (first column as the title, the rest as label/value) */}
      <div className="md:hidden">
        {isLoading ? (
          <div className="space-y-3 p-4">
            {[1, 2, 3].map((n) => (
              <div key={n} className="h-28 animate-pulse rounded-[20px] bg-slate-100" />
            ))}
          </div>
        ) : paginatedData.length === 0 ? (
          <p className="px-6 py-12 text-center text-[14px] text-slate-400">{emptyMessage}</p>
        ) : (
          <ul className="space-y-3 p-4">
            {paginatedData.map((item, rowIdx) => {
              const render = (col: Column<T>) =>
                typeof col.accessor === "function" ? col.accessor(item) : (item[col.accessor as keyof T] as React.ReactNode);
              const [first, ...rest] = columns;
              const fields = rest.filter((c) => c.header);
              const actions = rest.filter((c) => !c.header);
              return (
                <li
                  key={rowIdx}
                  onClick={() => onRowClick?.(item)}
                  className={cn(
                    "rounded-[20px] border border-[#E2E2E2] bg-white p-4",
                    onRowClick && "cursor-pointer active:bg-orange-50/40",
                  )}
                >
                  {first && <div className="min-w-0">{render(first)}</div>}
                  {fields.length > 0 && (
                    <dl className="mt-3 divide-y divide-slate-100 border-t border-slate-100">
                      {fields.map((col, i) => (
                        <div key={i} className="flex items-start justify-between gap-3 py-2">
                          <dt className="shrink-0 text-[12px] text-slate-500">{col.header}</dt>
                          <dd className="min-w-0 text-right text-[13px] [&>*]:ml-auto">{render(col)}</dd>
                        </div>
                      ))}
                    </dl>
                  )}
                  {actions.length > 0 && (
                    <div className="mt-3 flex flex-wrap justify-end gap-2 border-t border-slate-100 pt-3" onClick={(e) => e.stopPropagation()}>
                      {actions.map((col, i) => (
                        <div key={i}>{render(col)}</div>
                      ))}
                    </div>
                  )}
                </li>
              );
            })}
          </ul>
        )}
      </div>

      {/* Table (tablet and up) */}
      <div className="hidden overflow-x-auto md:block">
        <table className="w-full text-left border-collapse min-w-[800px]">
          <thead>
            <tr className="bg-[#F7F5F4]">
              {columns.map((col, idx) => (
                <th
                  key={idx}
                  className={cn(
                    "px-6 py-3.5 text-[12px] font-semibold text-slate-500 border-b border-[#E2E2E2]",
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
                <th className="px-6 py-3.5 text-[12px] font-semibold text-slate-500 border-b border-[#E2E2E2] text-right">
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
                      <div className="h-10 bg-slate-100 rounded-xl" />
                    </td>
                  ))}
                  {!hideActions && (
                    <td className="px-6 py-6">
                      <div className="h-10 w-12 bg-slate-100 rounded-xl ml-auto" />
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
                    <div className="w-16 h-16 rounded-full bg-orange-50 flex items-center justify-center">
                      <Search className="h-7 w-7 text-orange-500" />
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
                    "group hover:bg-orange-50/40 transition-colors duration-150 border-b border-slate-100 last:border-0",
                    onRowClick && "cursor-pointer",
                  )}
                >
                  {columns.map((col, colIdx) => (
                    <td
                      key={colIdx}
                      className={cn(
                        "px-6 py-4",
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
                        <button className="h-9 w-9 flex items-center justify-center hover:bg-[#5C0B19] hover:text-white rounded-xl border border-slate-100 bg-white ">
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

      {/* Footer: count, page size and page numbers */}
      {(filteredData.length > 0 || isLoading) && (
        <div className="flex flex-col items-center justify-between gap-3 border-t border-slate-100 px-5 py-3.5 sm:flex-row">
          <div className="flex items-center gap-4 text-[13px] text-slate-500">
            <span>
              {filteredData.length === 0
                ? "No results"
                : `Showing ${(currentPage - 1) * pageSize + 1}–${Math.min(currentPage * pageSize, filteredData.length)} of ${filteredData.length.toLocaleString("en-US")}`}
            </span>
            <label className="flex items-center gap-2">
              Rows
              <select
                value={pageSize}
                onChange={(e) => {
                  setPageSize(Number(e.target.value));
                  setCurrentPage(1);
                }}
                className="h-8 cursor-pointer rounded-full border border-[#E2E2E2] bg-white px-2.5 text-[13px] font-medium text-slate-700 outline-none focus:border-orange-500"
              >
                {[10, 20, 50, 100].map((size) => (
                  <option key={size} value={size}>
                    {size}
                  </option>
                ))}
              </select>
            </label>
          </div>

          {totalPages > 1 && (
            <nav aria-label="Pagination" className="flex items-center gap-1">
              <button
                disabled={currentPage === 1}
                onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                aria-label="Previous page"
                className="flex h-9 w-9 items-center justify-center rounded-full border border-[#E2E2E2] bg-white text-slate-600 transition hover:border-orange-200 hover:bg-orange-50 disabled:pointer-events-none disabled:opacity-30"
              >
                <ChevronLeft className="h-4 w-4" />
              </button>
              {pageList(currentPage, totalPages).map((p, i) =>
                p === "…" ? (
                  <span key={`gap-${i}`} className="w-7 text-center text-[13px] text-slate-400">
                    …
                  </span>
                ) : (
                  <button
                    key={p}
                    onClick={() => setCurrentPage(p)}
                    aria-current={p === currentPage ? "page" : undefined}
                    className={cn(
                      "h-9 min-w-9 rounded-full px-3 text-[13px] font-semibold tabular-nums transition",
                      p === currentPage
                        ? "bg-orange-500 text-white"
                        : "text-slate-600 hover:bg-orange-50 hover:text-orange-600",
                    )}
                  >
                    {p}
                  </button>
                ),
              )}
              <button
                disabled={currentPage === totalPages}
                onClick={() => setCurrentPage((p) => Math.min(totalPages, p + 1))}
                aria-label="Next page"
                className="flex h-9 w-9 items-center justify-center rounded-full border border-[#E2E2E2] bg-white text-slate-600 transition hover:border-orange-200 hover:bg-orange-50 disabled:pointer-events-none disabled:opacity-30"
              >
                <ChevronRight className="h-4 w-4" />
              </button>
            </nav>
          )}
        </div>
      )}
    </div>
  );
}

/** Page numbers with gaps, e.g. 1 … 4 5 6 … 12 */
function pageList(current: number, total: number): (number | "…")[] {
  if (total <= 7) return Array.from({ length: total }, (_, i) => i + 1);
  const pages = new Set([1, total, current - 1, current, current + 1]);
  const sorted = [...pages].filter((p) => p >= 1 && p <= total).sort((a, b) => a - b);
  const out: (number | "…")[] = [];
  sorted.forEach((p, i) => {
    if (i && p - (sorted[i - 1] as number) > 1) out.push("…");
    out.push(p);
  });
  return out;
}
