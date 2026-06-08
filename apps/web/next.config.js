/** @type {import('next').NextConfig} */
const nextConfig = {
    images: {
        remotePatterns: [
            {
                protocol: 'https',
                hostname: 'images.unsplash.com',
            },
        ],
    },
    async redirects() {
        return [
            {
                source: '/operator/receive',
                destination: '/operator/operations?tab=receive',
                permanent: true,
            },
            {
                source: '/operator/dispatch',
                destination: '/operator/operations?tab=dispatch',
                permanent: true,
            },
            {
                source: '/operator/deliver',
                destination: '/operator/operations?tab=deliver',
                permanent: true,
            },
            {
                source: '/operator/tracking',
                destination: '/operator/operations?tab=track',
                permanent: true,
            },
        ];
    },
};

export default nextConfig;
