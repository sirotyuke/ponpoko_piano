/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  experimental: {
    outputStandalone: true
  },
  reactStrictMode: true,
}

module.exports = nextConfig 