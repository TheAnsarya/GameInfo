# Dark Repos - Accessibility Guide

## Commitment

Dark Repos is committed to ensuring digital accessibility for people with disabilities. We are continually improving the user experience for everyone and applying the relevant accessibility standards.

---

## Standards Compliance

### Target Standards

| Standard | Level | Status |
|----------|-------|--------|
| WCAG 2.1 | AA | Required |
| WCAG 2.1 | AAA | Target (where feasible) |
| Section 508 | Full | Required |
| ARIA 1.2 | Full | Required |

---

## Implementation Guidelines

### 1. Semantic HTML

**DO:**
```html
<header role="banner">
    <nav role="navigation" aria-label="Main navigation">
        <ul>
            <li><a href="/games">Games</a></li>
        </ul>
    </nav>
</header>

<main id="main-content" role="main">
    <article>
        <h1>Page Title</h1>
        <section aria-labelledby="section-heading">
            <h2 id="section-heading">Section</h2>
        </section>
    </article>
</main>

<footer role="contentinfo">
    <!-- Footer content -->
</footer>
```

**DON'T:**
```html
<div class="header">
    <div class="nav">
        <div class="nav-item">Games</div>
    </div>
</div>
```

### 2. Skip Links

Every page must include skip links:

```html
<body>
    <a href="#main-content" class="skip-link">
        Skip to main content
    </a>
    <a href="#navigation" class="skip-link">
        Skip to navigation
    </a>
    <!-- Rest of page -->
</body>
```

```css
.skip-link {
    position: absolute;
    top: -40px;
    left: 0;
    background: var(--color-focus);
    color: var(--color-bg-primary);
    padding: 8px 16px;
    z-index: 100;
    font-weight: bold;
}

.skip-link:focus {
    top: 0;
}
```

### 3. Focus Management

#### Visible Focus Indicators

```css
/* All focusable elements */
a:focus-visible,
button:focus-visible,
input:focus-visible,
select:focus-visible,
textarea:focus-visible,
[tabindex]:focus-visible {
    outline: 3px solid var(--color-focus);
    outline-offset: 2px;
}

/* Remove default outline only when custom is applied */
:focus:not(:focus-visible) {
    outline: none;
}
```

#### Focus Order

- Tab order must follow visual order
- Use `tabindex="0"` for custom interactive elements
- Never use `tabindex` greater than 0
- Use `tabindex="-1"` for programmatic focus only

#### Focus Restoration

After navigation or modal close:
```csharp
// In Blazor component
protected override async Task OnAfterRenderAsync(bool firstRender)
{
    if (firstRender)
    {
        await JS.InvokeVoidAsync("focusElement", "main-content");
    }
}
```

### 4. Keyboard Navigation

#### Required Keyboard Support

| Element | Keys | Action |
|---------|------|--------|
| Links | Enter | Activate |
| Buttons | Enter, Space | Activate |
| Checkboxes | Space | Toggle |
| Radio buttons | Arrow keys | Select |
| Dropdown | Arrow keys, Enter | Navigate, Select |
| Modal | Escape | Close |
| Menu | Arrow keys, Enter, Escape | Navigate, Select, Close |
| Tabs | Arrow keys | Switch tabs |
| Accordion | Enter, Space | Toggle |

#### Implementation Example

```csharp
// Blazor component with keyboard handling
@code {
    private void HandleKeyDown(KeyboardEventArgs e)
    {
        switch (e.Key)
        {
            case "Enter":
            case " ":
                Activate();
                break;
            case "Escape":
                Close();
                break;
            case "ArrowDown":
                MoveNext();
                break;
            case "ArrowUp":
                MovePrevious();
                break;
        }
    }
}
```

### 5. Color and Contrast

#### Minimum Contrast Ratios

| Content Type | Ratio | WCAG Level |
|--------------|-------|------------|
| Normal text | 4.5:1 | AA |
| Large text (18px+) | 3:1 | AA |
| UI components | 3:1 | AA |
| Enhanced text | 7:1 | AAA |

#### Color Independence

Never convey information by color alone:

**DO:**
```html
<span class="status-complete">
    <svg aria-hidden="true"><!-- checkmark icon --></svg>
    Complete
</span>
```

**DON'T:**
```html
<span style="color: green;">●</span> <!-- Color only -->
```

### 6. Images and Media

#### Alternative Text

```html
<!-- Informative image -->
<img 
    src="dragon-warrior-cover.jpg" 
    alt="Dragon Warrior NES box art showing a knight facing a dragon">

<!-- Decorative image -->
<img src="decorative-border.png" alt="" role="presentation">

<!-- Complex image with description -->
<figure>
    <img 
        src="memory-map.png" 
        alt="NES memory map diagram"
        aria-describedby="memory-map-desc">
    <figcaption id="memory-map-desc">
        Complete NES memory layout showing CPU address space from 
        $0000-$FFFF, including RAM, PPU registers, APU, and cartridge space.
    </figcaption>
</figure>
```

#### Icons

```html
<!-- Icon with visible label -->
<button>
    <svg aria-hidden="true"><!-- icon --></svg>
    <span>Download</span>
</button>

<!-- Icon-only button -->
<button aria-label="Download tool">
    <svg aria-hidden="true"><!-- icon --></svg>
</button>
```

### 7. Forms and Inputs

```html
<form>
    <div class="field">
        <label for="search-input">
            Search games and tools
        </label>
        <input 
            type="search" 
            id="search-input"
            name="q"
            aria-describedby="search-hint"
            autocomplete="off">
        <span id="search-hint" class="hint">
            Try searching for game names, platforms, or tool types
        </span>
    </div>
    
    <div class="field">
        <fieldset>
            <legend>Filter by platform</legend>
            <label>
                <input type="checkbox" name="platform" value="nes">
                NES
            </label>
            <label>
                <input type="checkbox" name="platform" value="snes">
                SNES
            </label>
        </fieldset>
    </div>
    
    <button type="submit">Search</button>
</form>
```

### 8. Tables

```html
<table>
    <caption>ROM Map - Memory Addresses</caption>
    <thead>
        <tr>
            <th scope="col">Address</th>
            <th scope="col">Size</th>
            <th scope="col">Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>$0000-$07FF</td>
            <td>2 KB</td>
            <td>RAM</td>
        </tr>
    </tbody>
</table>
```

### 9. Error Handling

```html
<!-- Error summary -->
<div role="alert" aria-live="assertive">
    <h2>Search Error</h2>
    <p>We couldn't complete your search. Please try again.</p>
</div>

<!-- Field-level error -->
<div class="field field--error">
    <label for="email">Email</label>
    <input 
        type="email" 
        id="email" 
        aria-invalid="true"
        aria-describedby="email-error">
    <span id="email-error" class="error" role="alert">
        Please enter a valid email address
    </span>
</div>
```

### 10. Dynamic Content

#### Live Regions

```html
<!-- Polite updates (search results) -->
<div aria-live="polite" aria-atomic="true">
    <span class="sr-only">Found 24 results</span>
</div>

<!-- Assertive updates (errors) -->
<div role="alert" aria-live="assertive">
    Error loading content
</div>

<!-- Status updates -->
<div role="status" aria-live="polite">
    Loading...
</div>
```

#### Loading States

```html
<button aria-busy="true" disabled>
    <span class="spinner" aria-hidden="true"></span>
    Loading...
</button>

<div aria-busy="true" aria-describedby="loading-msg">
    <span id="loading-msg" class="sr-only">Loading content</span>
    <!-- Content placeholder -->
</div>
```

---

## Screen Reader Only Content

```css
/* Visually hidden but accessible */
.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
}

/* Focusable when reached via keyboard */
.sr-only-focusable:focus {
    position: static;
    width: auto;
    height: auto;
    padding: inherit;
    margin: 0;
    overflow: visible;
    clip: auto;
    white-space: normal;
}
```

---

## Testing Checklist

### Automated Testing

- [ ] Run axe-core or similar tool
- [ ] Check with Lighthouse accessibility audit
- [ ] Validate HTML for semantic correctness
- [ ] Check color contrast with contrast checker

### Manual Testing

- [ ] Navigate entire site with keyboard only
- [ ] Test with screen reader (NVDA on Windows, VoiceOver on macOS)
- [ ] Check focus visibility on all interactive elements
- [ ] Verify skip links work correctly
- [ ] Test at 200% zoom level
- [ ] Test with reduced motion preference
- [ ] Test with high contrast mode

### Screen Reader Testing

| Screen Reader | Browser | Platform |
|---------------|---------|----------|
| NVDA | Firefox, Chrome | Windows |
| JAWS | Chrome, Edge | Windows |
| VoiceOver | Safari | macOS, iOS |
| TalkBack | Chrome | Android |

---

## Common ARIA Patterns

### Expandable Content

```html
<button 
    aria-expanded="false" 
    aria-controls="details-panel"
    onclick="togglePanel()">
    Show Details
</button>
<div id="details-panel" hidden>
    <!-- Expandable content -->
</div>
```

### Tabs

```html
<div role="tablist" aria-label="Game information">
    <button 
        role="tab" 
        aria-selected="true" 
        aria-controls="panel-overview"
        id="tab-overview">
        Overview
    </button>
    <button 
        role="tab" 
        aria-selected="false" 
        aria-controls="panel-rommap"
        id="tab-rommap"
        tabindex="-1">
        ROM Map
    </button>
</div>
<div 
    role="tabpanel" 
    id="panel-overview" 
    aria-labelledby="tab-overview">
    <!-- Panel content -->
</div>
<div 
    role="tabpanel" 
    id="panel-rommap" 
    aria-labelledby="tab-rommap"
    hidden>
    <!-- Panel content -->
</div>
```

### Modal Dialog

```html
<div 
    role="dialog" 
    aria-modal="true" 
    aria-labelledby="dialog-title"
    aria-describedby="dialog-desc">
    <h2 id="dialog-title">Confirm Action</h2>
    <p id="dialog-desc">Are you sure you want to proceed?</p>
    <button>Confirm</button>
    <button>Cancel</button>
</div>
```

---

## Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
        animation-duration: 0.01ms !important;
        animation-iteration-count: 1 !important;
        transition-duration: 0.01ms !important;
        scroll-behavior: auto !important;
    }
}
```

---

## Resources

- [WCAG 2.1 Quick Reference](https://www.w3.org/WAI/WCAG21/quickref/)
- [ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/)
- [MDN Accessibility Guide](https://developer.mozilla.org/en-US/docs/Web/Accessibility)
- [a11y Project Checklist](https://www.a11yproject.com/checklist/)

---

*Last Updated: December 24, 2025*
