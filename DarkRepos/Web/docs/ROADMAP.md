# Dark Repos Website - Development Roadmap

## Project Vision

Create a modern, accessible website that serves as the central hub for all GameInfo project resources, making retro game research and ROM hacking tools easily discoverable and usable.

---

## Phase 1: Foundation (Sprint 1-2)
**Target: Weeks 1-4**
**Status**: ✅ Complete

### Milestone 1.1: Project Setup
- [x] Initialize .NET 10 Blazor Interactive WebAssembly project
- [x] Configure project structure and folder organization
- [x] Set up build pipeline and CI/CD configuration
- [x] Configure SQLite database with EF Core 9.0
- [x] Implement base layout and navigation structure

### Milestone 1.2: Design System Implementation
- [x] Define color palette (browns, dark greens, cream accents)
- [x] Create typography scale with readable fonts
- [x] Build core CSS custom properties (variables)
- [x] Create base component library (25+ components)
- [x] Implement responsive breakpoints

### Milestone 1.3: Accessibility Foundation
- [x] Configure ARIA landmark regions
- [x] Implement keyboard navigation system
- [x] Add skip links and focus management
- [x] Set up screen reader testing workflow
- [x] Create accessibility testing checklist

**Deliverables:**
- ✅ Working Blazor project skeleton
- ✅ Design system CSS with custom properties
- ✅ 25+ reusable Blazor components
- ✅ Accessibility audit baseline

---

## Phase 2: Core Content (Sprint 3-4)
**Target: Weeks 5-8**
**Status**: ✅ Complete

### Milestone 2.1: Content Pipeline
- [x] Build Markdown parser for documentation files (Markdig)
- [x] Create JSON schema for game metadata
- [x] Implement content caching layer (ContentCacheService)
- [x] Build content indexer for search functionality (FTS5)
- [x] Create content validation utilities

### Milestone 2.2: Games Catalog
- [x] Build Games listing page with platform filters
- [x] Create Game detail page template
- [x] Implement platform categorization (NES, SNES, GBA, etc.)
- [x] Add links to wiki pages (games.darkrepos.com)
- [x] Display game metadata (developer, publisher, region)

### Milestone 2.3: Home Page
- [x] Design hero section with project overview
- [x] Create featured games showcase
- [x] Build recent updates/activity section
- [x] Add quick links to main sections (platform navigation)
- [x] Implement call-to-action areas

**Deliverables:**
- ✅ Content ingestion pipeline with services
- ✅ Functional games catalog with filtering
- ✅ Complete home page with all sections

---

## Phase 3: Tools & Documentation (Sprint 5-6)
**Target: Weeks 9-12**
**Status**: � In Progress

### Milestone 3.1: Tools Section
- [x] Build tools catalog page
- [x] Create tool detail page template
- [x] Categorize tools (Graphics, Text, ROM, Analysis, etc.)
- [ ] Add download links and GitHub references
- [ ] Include usage documentation

### Milestone 3.2: Documentation Hub
- [x] Create documentation landing page
- [x] Build documentation category navigation
- [x] Implement breadcrumb navigation
- [x] Add table of contents for long pages
- [x] Create code block styling with syntax highlighting

### Milestone 3.3: Search Functionality
- [x] Design search interface (SearchBox, SearchModal)
- [x] Implement full-text search with SQLite FTS5
- [x] Create search results page
- [ ] Add search suggestions/autocomplete
- [ ] Implement search filters by category

**Deliverables:**
- ✅ Tools catalog pages
- ✅ Documentation hub with markdown rendering
- ✅ Working search system with FTS5

---

## Phase 4: Polish & Integration (Sprint 7-8)
**Target: Weeks 13-16**
**Status**: � In Progress

### Milestone 4.1: Wiki Integration
- [x] Add prominent wiki links throughout site
- [x] Create wiki navigation component (WikiResourceStatus)
- [x] Build "View on Wiki" buttons for game pages
- [ ] Add wiki contribution guide links
- [ ] Fetch and render wikitext content

### Milestone 4.2: Resource Downloads
- [ ] Create downloads/resources section
- [ ] Link to GitHub releases and assets
- [ ] Add file type icons and metadata
- [ ] Implement organized download categories

### Milestone 4.3: Community Links
- [ ] Add Discord invite integration
- [ ] Create contribution guide page
- [ ] Build "How to Contribute" section
- [x] Add GitHub repository links

**Deliverables:**
- ✅ Wiki links integrated
- 🔄 Downloads section (in progress)
- 🔄 Community engagement features (in progress)

---

## Phase 5: Launch Preparation (Sprint 9-10)
**Target: Weeks 17-20**
**Status**: 🔴 Not Started

### Milestone 5.1: Performance Optimization
- [ ] Implement lazy loading for images
- [ ] Optimize bundle size
- [ ] Add caching strategies
- [ ] Performance audit with Lighthouse
- [ ] Load time optimization

### Milestone 5.2: Accessibility Audit
- [ ] Complete WCAG 2.1 AA compliance check
- [ ] Screen reader testing (NVDA, VoiceOver)
- [ ] Keyboard-only navigation testing
- [ ] Color contrast verification
- [ ] Fix any accessibility issues

### Milestone 5.3: Deployment
- [ ] Configure production hosting
- [ ] Set up domain and SSL
- [ ] Configure CDN if needed
- [ ] Create deployment documentation
- [ ] Launch website

**Deliverables:**
- Performance-optimized site
- Accessibility-compliant site
- Live website at darkrepos.com

---

## Future Enhancements (Post-Launch)

### Phase 6: Advanced Features
- [ ] Interactive disassembly viewer
- [ ] ROM map visualization
- [ ] API for programmatic access
- [ ] Advanced search filters
- [ ] User preferences (dark mode toggle)

### Phase 7: Community Features
- [ ] Progress tracking for documentation
- [ ] Contribution leaderboards
- [ ] RSS/Atom feeds for updates
- [ ] Newsletter integration

---

## Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| Page Load Time | < 2 seconds | Lighthouse |
| Accessibility Score | 100 | Lighthouse |
| Mobile Usability | 100 | Lighthouse |
| SEO Score | 95+ | Lighthouse |
| WCAG Compliance | AA | Manual audit |
| Games Listed | All GameInfo games | Content check |
| Tools Documented | All CLI + GUI tools | Content check |

---

## Risk Assessment

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| Content sync complexity | Medium | Medium | Automate with build pipeline |
| Hosting costs | Low | Low | Use static hosting options |
| Accessibility compliance | High | Medium | Early and continuous testing |
| Mobile compatibility | Medium | Low | Desktop-first with responsive fallbacks |
| Search performance | Medium | Low | SQLite FTS5 is efficient for this scale |

---

## Timeline Summary

```
Week 1-4:   Phase 1 - Foundation
Week 5-8:   Phase 2 - Core Content
Week 9-12:  Phase 3 - Tools & Documentation
Week 13-16: Phase 4 - Polish & Integration
Week 17-20: Phase 5 - Launch
Post-Launch: Continuous improvement
```

---

## Review Schedule

- **Weekly**: Progress check on current sprint
- **Bi-weekly**: Milestone review and planning
- **Monthly**: Roadmap adjustment and reprioritization
- **Pre-launch**: Full audit and sign-off

---

*Last Updated: December 26, 2025*
