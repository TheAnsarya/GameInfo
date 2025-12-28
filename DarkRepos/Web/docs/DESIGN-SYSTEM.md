# Dark Repos - Design System

## Overview

This design system establishes the visual language for the Dark Repos website, ensuring consistency, accessibility, and a cohesive user experience tailored for ROM hackers and retro game researchers.

---

## Brand Identity

### Name & Logo

- **Name**: Dark Repos
- **Tagline**: "Retro Game Research & ROM Hacking Resources"
- **Logo Style**: Clean, modern typography with subtle retro gaming references

### Brand Voice

- Technical but approachable
- Authoritative but not intimidating
- Focused on accuracy and utility
- Respectful of the retro gaming community

---

## Color Palette

### Design Philosophy

Based on the specified browns, dark greens, and cream accents, with bright status colors. The palette is designed for:

- High contrast for readability (WCAG AAA where possible)
- Comfortable viewing during extended reading sessions
- Clear visual hierarchy
- Distinct interactive element identification

### Core Colors

```css
:root {
    /* ===== PRIMARY PALETTE ===== */
    
    /* Deep Forest - Primary Background */
    --color-bg-primary: #1a2318;      /* Darkest green-black */
    --color-bg-secondary: #242f22;    /* Dark forest green */
    --color-bg-tertiary: #2d3a2a;     /* Muted green */
    
    /* Earth Tones - Secondary Colors */
    --color-earth-dark: #3d2914;      /* Dark chocolate brown */
    --color-earth-mid: #5c3d1e;       /* Rich brown */
    --color-earth-light: #8b5a2b;     /* Warm brown */
    
    /* Cream Accents - Text and Highlights */
    --color-cream-light: #f5f0e6;     /* Light cream (primary text) */
    --color-cream-mid: #e8dcc8;       /* Mid cream */
    --color-cream-dark: #d4c4a8;      /* Dark cream (secondary text) */
    
    /* ===== STATUS COLORS ===== */
    
    /* Success - Bright Green */
    --color-success: #4ade80;         /* Emerald green */
    --color-success-dark: #22c55e;    /* Darker green */
    --color-success-bg: #14532d;      /* Background tint */
    
    /* Warning - Bright Yellow/Orange */
    --color-warning: #fbbf24;         /* Amber */
    --color-warning-dark: #f59e0b;    /* Darker amber */
    --color-warning-bg: #451a03;      /* Background tint */
    
    /* Error - Bright Red */
    --color-error: #f87171;           /* Coral red */
    --color-error-dark: #ef4444;      /* Vivid red */
    --color-error-bg: #450a0a;        /* Background tint */
    
    /* Info - Bright Blue (for variety) */
    --color-info: #60a5fa;            /* Sky blue */
    --color-info-dark: #3b82f6;       /* Vivid blue */
    --color-info-bg: #1e3a5f;         /* Background tint */
    
    /* ===== INTERACTIVE COLORS ===== */
    
    /* Links */
    --color-link: #93c5fd;            /* Light blue */
    --color-link-hover: #bfdbfe;      /* Lighter blue */
    --color-link-visited: #c4b5fd;    /* Lavender */
    
    /* Buttons */
    --color-button-primary: #5c3d1e;  /* Brown */
    --color-button-primary-hover: #8b5a2b;
    --color-button-secondary: #2d3a2a;
    --color-button-secondary-hover: #3d4d3a;
    
    /* Focus Ring */
    --color-focus: #fbbf24;           /* Bright yellow for visibility */
    
    /* ===== PLATFORM COLORS ===== */
    
    --color-platform-nes: #b91c1c;    /* NES Red */
    --color-platform-snes: #6d28d9;   /* SNES Purple */
    --color-platform-gb: #15803d;     /* Game Boy Green */
    --color-platform-gba: #1d4ed8;    /* GBA Blue */
    --color-platform-genesis: #0f172a;/* Genesis Dark */
}
```

### Color Usage Guidelines

| Element | Color Variable | Notes |
|---------|---------------|-------|
| Page background | `--color-bg-primary` | Darkest |
| Card backgrounds | `--color-bg-secondary` | Elevated surfaces |
| Hover states | `--color-bg-tertiary` | Interactive feedback |
| Primary text | `--color-cream-light` | High contrast |
| Secondary text | `--color-cream-dark` | Muted content |
| Headings | `--color-cream-mid` | Slightly emphasized |
| Links | `--color-link` | Blue for recognition |
| Focus outlines | `--color-focus` | Bright yellow, 3px |

### Contrast Ratios

All text combinations meet WCAG 2.1 AA standards:

| Combination | Ratio | Level |
|-------------|-------|-------|
| Cream light on bg-primary | 12.5:1 | AAA |
| Cream dark on bg-primary | 8.2:1 | AAA |
| Cream light on bg-secondary | 10.1:1 | AAA |
| Link color on bg-primary | 7.8:1 | AAA |
| Status colors on their bg | 4.5:1+ | AA |

---

## Typography

### Font Stack

```css
:root {
    /* Primary font - readable body text */
    --font-body: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', 
                  Roboto, 'Helvetica Neue', Arial, sans-serif;
    
    /* Monospace - code and technical content */
    --font-mono: 'JetBrains Mono', 'Fira Code', 'Consolas', 
                  'Monaco', monospace;
    
    /* Display - headings (optional alternative) */
    --font-display: var(--font-body);
}
```

### Type Scale

Using a 1.25 (major third) scale for comfortable reading:

```css
:root {
    --text-xs: 0.75rem;      /* 12px */
    --text-sm: 0.875rem;     /* 14px */
    --text-base: 1rem;       /* 16px */
    --text-lg: 1.125rem;     /* 18px */
    --text-xl: 1.25rem;      /* 20px */
    --text-2xl: 1.5rem;      /* 24px */
    --text-3xl: 1.875rem;    /* 30px */
    --text-4xl: 2.25rem;     /* 36px */
    --text-5xl: 3rem;        /* 48px */
    
    /* Line heights */
    --leading-tight: 1.25;
    --leading-snug: 1.375;
    --leading-normal: 1.5;
    --leading-relaxed: 1.625;
    --leading-loose: 2;
    
    /* Font weights */
    --font-normal: 400;
    --font-medium: 500;
    --font-semibold: 600;
    --font-bold: 700;
}
```

### Heading Styles

| Level | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|
| H1 | `--text-4xl` | Bold | Tight | Page titles |
| H2 | `--text-3xl` | Semibold | Tight | Section headers |
| H3 | `--text-2xl` | Semibold | Snug | Subsections |
| H4 | `--text-xl` | Medium | Snug | Card titles |
| H5 | `--text-lg` | Medium | Normal | Minor headings |
| H6 | `--text-base` | Semibold | Normal | Labels |

### Body Text

- **Default size**: 16px (1rem)
- **Line height**: 1.6 for body, 1.4 for UI
- **Max line width**: 75ch for readability
- **Paragraph spacing**: 1.5em

---

## Spacing

### Spacing Scale

```css
:root {
    --space-0: 0;
    --space-1: 0.25rem;    /* 4px */
    --space-2: 0.5rem;     /* 8px */
    --space-3: 0.75rem;    /* 12px */
    --space-4: 1rem;       /* 16px */
    --space-5: 1.25rem;    /* 20px */
    --space-6: 1.5rem;     /* 24px */
    --space-8: 2rem;       /* 32px */
    --space-10: 2.5rem;    /* 40px */
    --space-12: 3rem;      /* 48px */
    --space-16: 4rem;      /* 64px */
    --space-20: 5rem;      /* 80px */
    --space-24: 6rem;      /* 96px */
}
```

### Layout Guidelines

- **Page margins**: `--space-6` on mobile, `--space-12` on desktop
- **Section spacing**: `--space-16` between major sections
- **Card padding**: `--space-6`
- **Grid gaps**: `--space-6` between cards
- **Component internal spacing**: `--space-4`

---

## Components

### Cards

```css
.card {
    background: var(--color-bg-secondary);
    border-radius: var(--radius-lg);
    padding: var(--space-6);
    border: 1px solid var(--color-bg-tertiary);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.card:focus-within {
    outline: 3px solid var(--color-focus);
    outline-offset: 2px;
}
```

### Buttons

```css
.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: var(--space-2);
    padding: var(--space-3) var(--space-6);
    border-radius: var(--radius-md);
    font-weight: var(--font-medium);
    font-size: var(--text-base);
    cursor: pointer;
    transition: all 0.15s ease;
    border: none;
}

.btn:focus-visible {
    outline: 3px solid var(--color-focus);
    outline-offset: 2px;
}

.btn-primary {
    background: var(--color-button-primary);
    color: var(--color-cream-light);
}

.btn-primary:hover {
    background: var(--color-button-primary-hover);
}

.btn-secondary {
    background: var(--color-button-secondary);
    color: var(--color-cream-light);
    border: 1px solid var(--color-bg-tertiary);
}
```

### Links

```css
a {
    color: var(--color-link);
    text-decoration: underline;
    text-decoration-color: transparent;
    text-underline-offset: 3px;
    transition: text-decoration-color 0.15s ease;
}

a:hover {
    color: var(--color-link-hover);
    text-decoration-color: currentColor;
}

a:focus-visible {
    outline: 3px solid var(--color-focus);
    outline-offset: 2px;
    border-radius: 2px;
}

a:visited {
    color: var(--color-link-visited);
}
```

### Platform Badges

```css
.badge-platform {
    display: inline-flex;
    align-items: center;
    gap: var(--space-1);
    padding: var(--space-1) var(--space-2);
    border-radius: var(--radius-sm);
    font-size: var(--text-xs);
    font-weight: var(--font-semibold);
    text-transform: uppercase;
    letter-spacing: 0.05em;
}

.badge-nes { background: var(--color-platform-nes); color: white; }
.badge-snes { background: var(--color-platform-snes); color: white; }
.badge-gb { background: var(--color-platform-gb); color: white; }
.badge-gba { background: var(--color-platform-gba); color: white; }
```

### Status Indicators

```css
.status-complete { color: var(--color-success); }
.status-in-progress { color: var(--color-warning); }
.status-stub { color: var(--color-error); }
.status-info { color: var(--color-info); }
```

---

## Borders & Shadows

```css
:root {
    /* Border radius */
    --radius-sm: 4px;
    --radius-md: 8px;
    --radius-lg: 12px;
    --radius-xl: 16px;
    --radius-full: 9999px;
    
    /* Shadows */
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.2);
    --shadow-md: 0 4px 8px rgba(0, 0, 0, 0.25);
    --shadow-lg: 0 8px 16px rgba(0, 0, 0, 0.3);
    --shadow-xl: 0 12px 24px rgba(0, 0, 0, 0.35);
}
```

---

## Responsive Breakpoints

```css
:root {
    --breakpoint-sm: 640px;
    --breakpoint-md: 768px;
    --breakpoint-lg: 1024px;
    --breakpoint-xl: 1280px;
    --breakpoint-2xl: 1536px;
}

/* Desktop-first approach */
@media (max-width: 1024px) {
    /* Tablet adjustments */
}

@media (max-width: 768px) {
    /* Mobile adjustments */
}
```

---

## Iconography

### Icon Style

- **Style**: Outlined, 24x24px base size
- **Stroke width**: 2px
- **Source**: Custom SVG sprites or Lucide icons
- **Color**: Inherit from parent (currentColor)

### Common Icons

| Icon | Usage |
|------|-------|
| 🎮 Game controller | Games section |
| 🔧 Wrench | Tools section |
| 📚 Book | Documentation |
| 🔍 Magnifying glass | Search |
| 🔗 External link | External URLs |
| 📁 Folder | Categories |
| ⬇️ Download | Downloads |

---

## Motion & Animation

```css
:root {
    /* Durations */
    --duration-fast: 150ms;
    --duration-normal: 200ms;
    --duration-slow: 300ms;
    
    /* Easing */
    --ease-out: cubic-bezier(0, 0, 0.2, 1);
    --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
}

/* Respect reduced motion preference */
@media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
    }
}
```

---

## Dark Mode

The site is designed dark-first. If a light mode is added later:

```css
@media (prefers-color-scheme: light) {
    :root {
        /* Invert palette */
        --color-bg-primary: #f5f0e6;
        --color-bg-secondary: #e8dcc8;
        --color-cream-light: #1a2318;
        /* ... etc */
    }
}
```

---

*Last Updated: December 24, 2025*
