"use client";

import { useForm, UseFormReturn } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { cn } from "@/lib/utils";
import { Loader2, AlertCircle } from "lucide-react";

export type FieldConfig = {
  name: string;
  label: string;
  type:
    | "text"
    | "email"
    | "password"
    | "number"
    | "tel"
    | "select"
    | "checkbox"
    | "textarea";
  placeholder?: string;
  options?: { label: string; value: string }[];
  description?: string;
  required?: boolean;
};

interface FormBuilderProps {
  schema: z.ZodObject<any>;
  fields: FieldConfig[];
  onSubmit: (data: any) => Promise<void>;
  submitLabel?: string;
  isLoading?: boolean;
  defaultValues?: any;
}

export function FormBuilder({
  schema,
  fields,
  onSubmit,
  submitLabel = "Save Changes",
  isLoading = false,
  defaultValues,
}: FormBuilderProps) {
  const form = useForm({
    resolver: zodResolver(schema),
    defaultValues,
  });

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = form;

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {fields.map((field) => {
          const error = errors[field.name];

          return (
            <div
              key={field.name}
              className={cn(
                "flex flex-col gap-2",
                field.type === "textarea" ? "md:col-span-2" : "",
              )}
            >
              <label
                htmlFor={field.name}
                className="text-[11px] font-extrabold uppercase tracking-[0.12em] text-slate-400"
              >
                {field.label}{" "}
                {field.required && <span className="text-red-500">*</span>}
              </label>

              {field.type === "select" ? (
                <div className="relative">
                  <select
                    id={field.name}
                    {...register(field.name)}
                    className="w-full h-11 px-4 pr-10 bg-slate-50 border border-slate-200 rounded-[10px] text-sm text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all shadow-sm appearance-none cursor-pointer"
                  >
                    <option value="">Select option...</option>
                    {field.options?.map((opt) => (
                      <option key={opt.value} value={opt.value}>
                        {opt.label}
                      </option>
                    ))}
                  </select>
                  <div className="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-slate-400">
                    <svg
                      width="12"
                      height="12"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="3"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                    >
                      <polyline points="6 9 12 15 18 9" />
                    </svg>
                  </div>
                </div>
              ) : field.type === "textarea" ? (
                <textarea
                  id={field.name}
                  rows={4}
                  {...register(field.name)}
                  placeholder={field.placeholder}
                  className="p-4 bg-slate-50 border border-slate-200 rounded-[10px] text-sm text-slate-800 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all shadow-sm resize-none"
                />
              ) : (
                <input
                  id={field.name}
                  type={field.type}
                  {...register(field.name)}
                  placeholder={field.placeholder}
                  className="h-11 px-4 bg-slate-50 border border-slate-200 rounded-[10px] text-sm text-slate-800 placeholder:text-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all shadow-sm"
                />
              )}

              {field.description && (
                <p className="text-[10px] text-slate-400 font-medium">
                  {field.description}
                </p>
              )}

              {error && (
                <div className="flex items-center gap-1.5 px-3 py-1 bg-rose-50 border border-rose-100/50 rounded-[10px]">
                  <AlertCircle className="h-3 w-3 text-rose-500" />
                  <p className="text-[10px] text-rose-600 font-bold">
                    {error.message as string}
                  </p>
                </div>
              )}
            </div>
          );
        })}
      </div>

      <div className="pt-6 border-t border-slate-100 flex justify-end">
        <button
          type="submit"
          disabled={isLoading}
          className="h-11 px-8 bg-blue-600 hover:bg-blue-500 disabled:opacity-50 text-white text-sm font-bold rounded-[10px] flex items-center justify-center gap-2 transition-all shadow-xl shadow-blue-600/20 active:scale-95"
        >
          {isLoading ? (
            <>
              <Loader2 className="h-4 w-4 animate-spin" />
              Processing...
            </>
          ) : (
            submitLabel
          )}
        </button>
      </div>
    </form>
  );
}
