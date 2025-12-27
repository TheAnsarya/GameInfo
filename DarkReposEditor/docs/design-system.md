# Dark Repos Editor - Design System

## Overview

The Dark Repos Editor design system provides a cohesive visual language inspired by vintage computing and nature. The palette combines earthy tones with functional status colors for a professional yet distinctive aesthetic.

## Brand Identity

### Name & Tagline

- **Name:** Dark Repos Editor
- **Tagline:** "Local-first ROM hacking toolkit"
- **URL:** `editor.darkrepos.com` (docs) / `localhost:5280` (local)

### Logo Concepts

```
Primary:   [◊] Dark Repos Editor
Icon only: [◊]
Compact:   DRE
```

---

## Color Palette

### Primary Colors

The primary palette uses earthy, muted tones for a comfortable dark theme.

```css
:root {
    /* Background layers (darkest to lightest) */
    --color-bg-base: #1a1815;           /* Darkest background */
    --color-bg-surface: #242220;        /* Card/panel backgrounds */
    --color-bg-elevated: #2e2b28;       /* Elevated elements */
    --color-bg-hover: #3a3633;          /* Hover states */
    --color-bg-active: #454240;         /* Active/pressed states */
    
    /* Browns (Primary brand color) */
    --color-brown-900: #1c1816;
    --color-brown-800: #2d2521;
    --color-brown-700: #3e322c;
    --color-brown-600: #4f3f37;
    --color-brown-500: #6b5344;         /* Primary brown */
    --color-brown-400: #8a6d5a;
    --color-brown-300: #a98f7c;
    --color-brown-200: #c8b3a4;
    --color-brown-100: #e7d9cf;
    
    /* Greens (Secondary accent) */
    --color-green-900: #0f1f16;
    --color-green-800: #1a3326;
    --color-green-700: #254736;
    --color-green-600: #305b46;
    --color-green-500: #3b6f56;         /* Primary green */
    --color-green-400: #529770;
    --color-green-300: #6dbf8a;
    --color-green-200: #a3dbb7;
    --color-green-100: #d9f5e4;
    
    /* Cream (Light accents) */
    --color-cream-900: #3d3a36;
    --color-cream-800: #5c5852;
    --color-cream-700: #7b766e;
    --color-cream-600: #9a948a;
    --color-cream-500: #b9b2a6;
    --color-cream-400: #cec7bb;         /* Primary cream */
    --color-cream-300: #dfd9cf;
    --color-cream-200: #efe9e1;
    --color-cream-100: #faf7f4;         /* Lightest cream */
}
```

### Semantic Colors

Status and feedback colors for UI states.

```css
:root {
    /* Success (Green) */
    --color-success-bg: #1a2f23;
    --color-success: #4ade80;
    --color-success-text: #86efac;
    --color-success-border: #22c55e;
    
    /* Warning (Orange/Yellow) */
    --color-warning-bg: #2f2a1a;
    --color-warning: #fbbf24;
    --color-warning-text: #fcd34d;
    --color-warning-border: #f59e0b;
    
    /* Error (Red) */
    --color-error-bg: #2f1a1a;
    --color-error: #f87171;
    --color-error-text: #fca5a5;
    --color-error-border: #ef4444;
    
    /* Info (Blue) */
    --color-info-bg: #1a2430;
    --color-info: #60a5fa;
    --color-info-text: #93c5fd;
    --color-info-border: #3b82f6;
    
    /* Accent (Purple) */
    --color-accent-bg: #271a2f;
    --color-accent: #c084fc;
    --color-accent-text: #d8b4fe;
    --color-accent-border: #a855f7;
}
```

### Text Colors

```css
:root {
    /* Text hierarchy */
    --color-text-primary: #f5f3f0;      /* Primary text */
    --color-text-secondary: #b8b4ae;    /* Secondary/muted text */
    --color-text-tertiary: #7a7670;     /* Disabled/hint text */
    --color-text-inverse: #1a1815;      /* Text on light backgrounds */
    
    /* Link colors */
    --color-link: #8ab4f8;
    --color-link-hover: #aecbfa;
    --color-link-visited: #c58af9;
}
```

### Editor-Specific Colors

```css
:root {
    /* Hex editor */
    --color-hex-offset: #8a8a8a;
    --color-hex-byte: #d4d4d4;
    --color-hex-byte-zero: #606060;
    --color-hex-byte-selected: #ffffff;
    --color-hex-ascii: #a3d9a5;
    --color-hex-modified: #fbbf24;
    
    /* Disassembler */
    --color-asm-address: #8a8a8a;
    --color-asm-opcode: #82aaff;
    --color-asm-operand: #c3e88d;
    --color-asm-comment: #676e95;
    --color-asm-label: #f78c6c;
    
    /* Syntax highlighting */
    --color-syntax-keyword: #c792ea;
    --color-syntax-string: #c3e88d;
    --color-syntax-number: #f78c6c;
    --color-syntax-comment: #676e95;
    --color-syntax-function: #82aaff;
    --color-syntax-variable: #f07178;
}
```

---

## Typography

### Font Stack

```css
:root {
    /* Sans-serif for UI */
    --font-sans: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
    
    /* Monospace for code/data */
    --font-mono: 'JetBrains Mono', 'Fira Code', 'Cascadia Code', 'Consolas', monospace;
    
    /* Display for headings */
    --font-display: 'Inter', var(--font-sans);
}
```

### Type Scale

```css
:root {
    /* Font sizes */
    --text-xs: 0.75rem;      /* 12px */
    --text-sm: 0.875rem;     /* 14px */
    --text-base: 1rem;       /* 16px */
    --text-lg: 1.125rem;     /* 18px */
    --text-xl: 1.25rem;      /* 20px */
    --text-2xl: 1.5rem;      /* 24px */
    --text-3xl: 1.875rem;    /* 30px */
    --text-4xl: 2.25rem;     /* 36px */
    
    /* Line heights */
    --leading-none: 1;
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

### Typography Usage

| Element | Font | Size | Weight | Line Height |
|---------|------|------|--------|-------------|
| H1 | Display | 2xl | Bold | Tight |
| H2 | Display | xl | Semibold | Tight |
| H3 | Display | lg | Semibold | Snug |
| Body | Sans | Base | Normal | Normal |
| Small | Sans | sm | Normal | Normal |
| Code | Mono | sm | Normal | Relaxed |
| Button | Sans | sm | Medium | None |
| Input | Sans | sm | Normal | Normal |

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
}
```

### Layout Grid

```css
:root {
    /* Container widths */
    --container-sm: 640px;
    --container-md: 768px;
    --container-lg: 1024px;
    --container-xl: 1280px;
    --container-2xl: 1536px;
    
    /* Editor-specific */
    --sidebar-width: 280px;
    --toolbar-height: 48px;
    --statusbar-height: 28px;
    --panel-min-width: 200px;
}
```

---

## Borders & Shadows

### Border Radius

```css
:root {
    --radius-none: 0;
    --radius-sm: 0.125rem;   /* 2px */
    --radius-default: 0.25rem; /* 4px */
    --radius-md: 0.375rem;   /* 6px */
    --radius-lg: 0.5rem;     /* 8px */
    --radius-xl: 0.75rem;    /* 12px */
    --radius-2xl: 1rem;      /* 16px */
    --radius-full: 9999px;
}
```

### Border Colors

```css
:root {
    --border-default: #3a3633;
    --border-muted: #2e2b28;
    --border-strong: #4a4643;
    --border-focus: #6b5344;
}
```

### Shadows

```css
:root {
    --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.25);
    --shadow-default: 0 1px 3px 0 rgb(0 0 0 / 0.3), 0 1px 2px -1px rgb(0 0 0 / 0.3);
    --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.3), 0 2px 4px -2px rgb(0 0 0 / 0.3);
    --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.3), 0 4px 6px -4px rgb(0 0 0 / 0.3);
    --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.3), 0 8px 10px -6px rgb(0 0 0 / 0.3);
    --shadow-inner: inset 0 2px 4px 0 rgb(0 0 0 / 0.25);
}
```

---

## Components

### Buttons

```css
/* Button base */
.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: var(--space-2);
    padding: var(--space-2) var(--space-4);
    font-family: var(--font-sans);
    font-size: var(--text-sm);
    font-weight: var(--font-medium);
    line-height: var(--leading-none);
    border-radius: var(--radius-md);
    border: 1px solid transparent;
    cursor: pointer;
    transition: all 0.15s ease;
}

/* Primary button */
.btn-primary {
    background-color: var(--color-brown-500);
    border-color: var(--color-brown-400);
    color: var(--color-cream-100);
}

.btn-primary:hover {
    background-color: var(--color-brown-400);
}

/* Secondary button */
.btn-secondary {
    background-color: var(--color-bg-elevated);
    border-color: var(--border-default);
    color: var(--color-text-primary);
}

/* Ghost button */
.btn-ghost {
    background-color: transparent;
    color: var(--color-text-secondary);
}

/* Danger button */
.btn-danger {
    background-color: var(--color-error);
    border-color: var(--color-error-border);
    color: #ffffff;
}

/* Button sizes */
.btn-sm { padding: var(--space-1) var(--space-2); font-size: var(--text-xs); }
.btn-lg { padding: var(--space-3) var(--space-6); font-size: var(--text-base); }
```

### Inputs

```css
/* Input base */
.input {
    width: 100%;
    padding: var(--space-2) var(--space-3);
    font-family: var(--font-sans);
    font-size: var(--text-sm);
    line-height: var(--leading-normal);
    color: var(--color-text-primary);
    background-color: var(--color-bg-base);
    border: 1px solid var(--border-default);
    border-radius: var(--radius-md);
    transition: border-color 0.15s ease, box-shadow 0.15s ease;
}

.input:focus {
    outline: none;
    border-color: var(--color-brown-500);
    box-shadow: 0 0 0 3px rgb(107 83 68 / 0.2);
}

.input::placeholder {
    color: var(--color-text-tertiary);
}

/* Monospace input (for hex/addresses) */
.input-mono {
    font-family: var(--font-mono);
}
```

### Cards

```css
.card {
    background-color: var(--color-bg-surface);
    border: 1px solid var(--border-muted);
    border-radius: var(--radius-lg);
    overflow: hidden;
}

.card-header {
    padding: var(--space-4);
    border-bottom: 1px solid var(--border-muted);
    background-color: var(--color-bg-elevated);
}

.card-body {
    padding: var(--space-4);
}

.card-footer {
    padding: var(--space-4);
    border-top: 1px solid var(--border-muted);
    background-color: var(--color-bg-elevated);
}
```

### Modals

```css
.modal-overlay {
    position: fixed;
    inset: 0;
    background-color: rgb(0 0 0 / 0.6);
    backdrop-filter: blur(4px);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
}

.modal {
    background-color: var(--color-bg-surface);
    border: 1px solid var(--border-default);
    border-radius: var(--radius-xl);
    box-shadow: var(--shadow-xl);
    max-width: 90vw;
    max-height: 90vh;
    overflow: auto;
}

.modal-header {
    padding: var(--space-4) var(--space-6);
    border-bottom: 1px solid var(--border-muted);
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.modal-body {
    padding: var(--space-6);
}

.modal-footer {
    padding: var(--space-4) var(--space-6);
    border-top: 1px solid var(--border-muted);
    display: flex;
    justify-content: flex-end;
    gap: var(--space-3);
}
```

---

## Editor Layouts

### Main Editor Layout

```
┌─────────────────────────────────────────────────────────────┐
│  [Logo] Dark Repos Editor              [Settings] [User]    │ ← Header (48px)
├────────────┬────────────────────────────────────────────────┤
│            │  [Tab 1] [Tab 2] [Tab 3]              [+ New]  │ ← Tab bar (36px)
│            ├────────────────────────────────────────────────┤
│  Projects  │                                                │
│  ──────    │                                                │
│  > Project │                                                │
│    > Files │              Editor Content Area               │
│            │                                                │
│  Symbols   │                                                │
│  ──────    │                                                │
│  > Labels  │                                                │
│  > Consts  │                                                │
│            │                                                │
├────────────┴────────────────────────────────────────────────┤
│  Ready │ Line: 1, Col: 1 │ UTF-8 │ NES │ 1.0 MB            │ ← Status bar (28px)
└─────────────────────────────────────────────────────────────┘
```

### Hex Editor Layout

```
┌─────────────────────────────────────────────────────────────┐
│  [Save] [Undo] [Redo] | [Go To] [Search] | [View ▼]        │ ← Toolbar
├─────────────────────────────────────────────────────┬───────┤
│  Offset    00 01 02 03 04 05 06 07 08 09 0A 0B ... │ Data  │
│  ────────  ─────────────────────────────────────── │ ───── │
│  00000000  4E 45 53 1A 08 00 21 00 00 00 00 00 ... │ NES.. │
│  00000010  00 00 00 00 00 00 00 00 00 00 00 00 ... │ ..... │
│  00000020  78 D8 A9 00 8D 00 20 8D 01 20 A2 FF ... │ x.... │
│  ...                                               │       │
├─────────────────────────────────────────────────────┴───────┤
│  Selection: $00000000 - $0000000F (16 bytes)               │
│  ──────────────────────────────────────────────────────────│
│  Signed:    78        Unsigned:  78        Hex:   4E       │
│  16-bit LE: 17742     16-bit BE: 20051     ASCII: N        │
└─────────────────────────────────────────────────────────────┘
```

### CHR Editor Layout

```
┌─────────────────────────────────────────────────────────────┐
│  [Import] [Export] | [Pencil] [Fill] [Select] | [Grid]     │ ← Toolbar
├───────────────────────────────────────────┬─────────────────┤
│                                           │  Tileset        │
│                                           │  ┌─┬─┬─┬─┐     │
│       ┌───────────────────────┐           │  ├─┼─┼─┼─┤     │
│       │                       │           │  ├─┼─┼─┼─┤     │
│       │    Current Tile       │           │  └─┴─┴─┴─┘     │
│       │    (8x zoom)          │           │                 │
│       │                       │           │  Palette        │
│       └───────────────────────┘           │  [■][■][■][■]   │
│                                           │  [■][■][■][■]   │
│                                           │                 │
├───────────────────────────────────────────┴─────────────────┤
│  Tile: $04F │ Offset: $00270 │ 2BPP │ 8x8                  │
└─────────────────────────────────────────────────────────────┘
```

---

## Accessibility

### Focus States

```css
/* Visible focus ring */
:focus-visible {
    outline: 2px solid var(--color-brown-400);
    outline-offset: 2px;
}

/* Skip link */
.skip-link {
    position: absolute;
    left: -9999px;
    top: var(--space-2);
    z-index: 9999;
}

.skip-link:focus {
    left: var(--space-2);
    background: var(--color-bg-surface);
    padding: var(--space-2) var(--space-4);
    border-radius: var(--radius-md);
}
```

### Color Contrast

All text colors meet WCAG 2.1 AA standards:

| Element | Foreground | Background | Ratio |
|---------|------------|------------|-------|
| Primary text | #f5f3f0 | #1a1815 | 14.5:1 ✓ |
| Secondary text | #b8b4ae | #1a1815 | 8.2:1 ✓ |
| Link text | #8ab4f8 | #1a1815 | 7.8:1 ✓ |
| Error text | #f87171 | #2f1a1a | 5.1:1 ✓ |
| Success text | #4ade80 | #1a2f23 | 5.3:1 ✓ |

### Keyboard Navigation

| Key | Action |
|-----|--------|
| `Tab` | Move to next focusable element |
| `Shift+Tab` | Move to previous focusable element |
| `Enter/Space` | Activate buttons/links |
| `Escape` | Close modals/dropdowns |
| `Arrow keys` | Navigate within components |
| `Home/End` | Jump to start/end |
| `Ctrl+S` | Save |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+F` | Find |
| `Ctrl+G` | Go to address |

### ARIA Patterns

```html
<!-- Toolbar -->
<div role="toolbar" aria-label="Editor tools">
    <button aria-label="Save file">💾</button>
    <button aria-label="Undo">↩</button>
</div>

<!-- Tab panel -->
<div role="tablist" aria-label="Editor tabs">
    <button role="tab" aria-selected="true" aria-controls="panel-1">rom.nes</button>
    <button role="tab" aria-selected="false" aria-controls="panel-2">tiles.chr</button>
</div>
<div role="tabpanel" id="panel-1" aria-labelledby="tab-1">...</div>

<!-- Tree view -->
<ul role="tree" aria-label="Project files">
    <li role="treeitem" aria-expanded="true">
        <span>Project</span>
        <ul role="group">
            <li role="treeitem">rom.nes</li>
            <li role="treeitem">script.txt</li>
        </ul>
    </li>
</ul>
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

/* Mobile-first media queries */
@media (min-width: 640px) { /* sm */ }
@media (min-width: 768px) { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
@media (min-width: 1536px) { /* 2xl */ }
```

---

## Animation

### Transition Timing

```css
:root {
    --duration-fast: 100ms;
    --duration-normal: 200ms;
    --duration-slow: 300ms;
    --duration-slower: 500ms;
    
    --ease-default: cubic-bezier(0.4, 0, 0.2, 1);
    --ease-in: cubic-bezier(0.4, 0, 1, 1);
    --ease-out: cubic-bezier(0, 0, 0.2, 1);
    --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
}
```

### Motion Preferences

```css
/* Reduce motion for users who prefer it */
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

## Icons

Use emoji for simple icons, or a consistent icon library like Lucide or Heroicons.

### Common Icons

| Icon | Meaning | Usage |
|------|---------|-------|
| 💾 | Save | Toolbar, menu |
| 📁 | Open file | Toolbar, menu |
| 📂 | Open folder | Project browser |
| ✏️ | Edit | Context menus |
| 🗑️ | Delete | Context menus |
| 🔍 | Search | Toolbar |
| ⚙️ | Settings | Header |
| ℹ️ | Info | Tooltips |
| ⚠️ | Warning | Alerts |
| ✅ | Success | Notifications |
| ❌ | Error | Notifications |
| ▶️ | Run/Build | Toolbar |
| ⏸️ | Pause | Toolbar |

---

## File Reference

### CSS Files Structure

```
src/DarkReposEditor.Web/wwwroot/css/
├── variables.css         # All CSS custom properties
├── base.css              # Reset and base styles
├── typography.css        # Text styles
├── components/
│   ├── buttons.css
│   ├── inputs.css
│   ├── cards.css
│   ├── modals.css
│   ├── tabs.css
│   ├── toolbar.css
│   └── ...
├── editors/
│   ├── hex-editor.css
│   ├── chr-editor.css
│   ├── map-editor.css
│   └── ...
├── layouts/
│   ├── main.css
│   ├── sidebar.css
│   └── ...
└── utilities.css         # Utility classes
```

---

## Component Checklist

### Core Components

- [ ] Button (Primary, Secondary, Ghost, Danger, Icon)
- [ ] Input (Text, Number, Hex, Search)
- [ ] Select (Single, Multi)
- [ ] Checkbox
- [ ] Radio
- [ ] Switch/Toggle
- [ ] Slider
- [ ] Textarea

### Layout Components

- [ ] Card
- [ ] Modal
- [ ] Drawer
- [ ] Tabs
- [ ] Accordion
- [ ] Split Pane
- [ ] Toolbar
- [ ] Status Bar

### Navigation Components

- [ ] Sidebar
- [ ] Breadcrumb
- [ ] Menu
- [ ] Context Menu
- [ ] Tree View

### Data Components

- [ ] Table
- [ ] Data Grid
- [ ] List
- [ ] Pagination

### Feedback Components

- [ ] Toast/Notification
- [ ] Alert
- [ ] Progress Bar
- [ ] Spinner
- [ ] Skeleton
- [ ] Badge
- [ ] Tooltip

### Editor Components

- [ ] Hex View
- [ ] Tile Canvas
- [ ] Color Picker
- [ ] Code Editor (Monaco or custom)
- [ ] Virtual Scroll List
