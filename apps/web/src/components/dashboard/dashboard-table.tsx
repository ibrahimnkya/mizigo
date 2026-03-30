export function DashboardTable() {
    return (
        <div className="relative w-full overflow-auto">
            <table className="w-full caption-bottom text-sm">
                <thead className="[&_tr]:border-b">
                    <tr className="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                        <th className="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">
                            ID
                        </th>
                        <th className="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">
                            From
                        </th>
                        <th className="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">
                            To
                        </th>
                        <th className="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">
                            Status
                        </th>
                        <th className="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0">
                            Actions
                        </th>
                    </tr>
                </thead>
                <tbody className="[&_tr:last-child]:border-0">
                    <tr className="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                        <td className="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                            INV-001
                        </td>
                        <td className="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                            Dar es Salaam
                        </td>
                        <td className="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                            Arusha
                        </td>
                        <td className="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                            <span className="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-yellow-100 text-yellow-800 hover:bg-yellow-100/80">Pending</span>
                        </td>
                        <td className="p-4 align-middle [&:has([role=checkbox])]:pr-0">
                            <button className="text-blue-600 hover:text-blue-800 font-medium text-sm">View Details</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    );
}
