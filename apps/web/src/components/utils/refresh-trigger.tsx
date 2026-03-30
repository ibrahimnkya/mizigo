'use client'

import { useRouter } from 'next/navigation'
import { useEffect } from 'react'

/**
 * A small utility component that triggers a periodic refresh of the current page.
 * This is useful for keeping dashboards and lists "in sync" without full page reloads
 * or complex WebSocket setups.
 */
export function RefreshTrigger({ interval = 30000 }: { interval?: number }) {
    const router = useRouter()
    
    useEffect(() => {
        // Set up the interval
        const timer = setInterval(() => {
            // router.refresh() triggers a server-side re-evaluation of the current data hooks
            // while maintaining client-side state.
            router.refresh()
        }, interval)
        
        // Clean up on unmount
        return () => clearInterval(timer)
    }, [router, interval])
    
    // This component doesn't render anything
    return null
}
