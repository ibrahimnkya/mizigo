import type { Config } from "tailwindcss";

const config = {
  darkMode: ["class"],
  content: [
    "./pages/**/*.{ts,tsx}",
    "./components/**/*.{ts,tsx}",
    "./app/**/*.{ts,tsx}",
    "./src/**/*.{ts,tsx}",
    "../../packages/ui/src/**/*.{ts,tsx}",
  ],
  prefix: "",
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        // MiziGO brand: maroon #5C0B19 (mapped onto blue/indigo so existing
        // screens pick it up) and orange #F78A1F, with warm neutrals as slate.
        brand: {
          DEFAULT: "#5C0B19",
          deep: "#4F0A0C",
          nav: "#612224",
          line: "#651422",
        },
        orange: {
          50: "#FFF5EB", 100: "#FEE7CF", 200: "#FDCB9C", 300: "#FBAF69",
          400: "#F99C43", 500: "#F78A1F", 600: "#DD720B", 700: "#B25A08",
          800: "#86440A", 900: "#5E300A", 950: "#341A05", DEFAULT: "#F78A1F",
        },
        blue: {
          50: "#FBF1F2", 100: "#F5DFE2", 200: "#E8B9C0", 300: "#CF7C89",
          400: "#A63A4C", 500: "#7A1225", 600: "#5C0B19", 700: "#4C0914",
          800: "#3D0710", 900: "#2E050C", 950: "#1C0307",
        },
        indigo: {
          50: "#FBF1F2", 100: "#F5DFE2", 200: "#E8B9C0", 300: "#CF7C89",
          400: "#A63A4C", 500: "#7A1225", 600: "#651422", 700: "#4F0A0C",
          800: "#3D0710", 900: "#2E050C", 950: "#1C0307",
        },
        slate: {
          50: "#FAF8F7", 100: "#F3EFEE", 200: "#E6E0DE", 300: "#CFC6C3",
          400: "#A2958F", 500: "#786A65", 600: "#5B4E4A", 700: "#45393A",
          800: "#2F2426", 900: "#1E1416", 950: "#120A0C",
        },
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      fontFamily: {
        sans: ["var(--font-outfit)", "ui-sans-serif", "system-ui", "sans-serif"],
      },
      backgroundImage: {
        "side-image": "url('/side.png')",
        bridge: "url('/brand/station_header.png')",
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      boxShadow: {
        premium: "0 12px 32px -16px rgba(92, 11, 25, 0.25)",
        glass: "0 8px 32px 0 rgba(92, 11, 25, 0.08)",
      },
      backdropBlur: {
        glass: "32px",
      },
      keyframes: {
        "accordion-down": {
          from: { height: "0" },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: "0" },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
} satisfies Config;

export default config;
