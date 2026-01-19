# 🐛 Issues Log

> **Purpose:** Track all issues found during manual testing  
> **Last Updated:** [Update this date]

---

## Quick Add Template

Copy this when you find a new issue:

```markdown
### Issue #[NUMBER]

**Repository:** [repo name]  
**Severity:** 🔴 Critical / 🟠 High / 🟡 Medium / 🟢 Low  
**Status:** 🆕 New  
**Found:** [date]  
**Test Section:** [reference to test document section]

**Summary:** [one line description]

**Steps to Reproduce:**
1. 
2. 
3. 

**Expected Result:**


**Actual Result:**


**Screenshots/Logs:**


**Environment:**
- OS: Windows 11
- .NET: 10.0
- Commit: [hash]

**Notes:**

---
```

---

## Active Issues

### Issue #1

**Repository:** [Example]  
**Severity:** 🟡 Medium  
**Status:** 🆕 New  
**Found:** [date]  
**Test Section:** PANSY-TESTING.md Section 3.2

**Summary:** [Description of issue]

**Steps to Reproduce:**
1. Step 1
2. Step 2
3. Step 3

**Expected Result:**
What should happen

**Actual Result:**
What actually happened

**Screenshots/Logs:**
```
Error message or log output
```

**Environment:**
- OS: Windows 11
- .NET: 10.0.100
- Commit: abc123

**Notes:**
Any additional observations

---

## Resolved Issues

(Move issues here when fixed)

---

## Issue Statistics

| Status | Count |
|--------|-------|
| 🆕 New | 0 |
| 🔍 Investigating | 0 |
| 🛠️ In Progress | 0 |
| ✅ Fixed | 0 |
| ❌ Won't Fix | 0 |
| **Total** | **0** |

---

## Issues by Severity

| Severity | Open | Closed |
|----------|------|--------|
| 🔴 Critical | 0 | 0 |
| 🟠 High | 0 | 0 |
| 🟡 Medium | 0 | 0 |
| 🟢 Low | 0 | 0 |

---

## Issues by Repository

| Repository | Open | Closed |
|------------|------|--------|
| Pansy | 0 | 0 |
| Peony | 0 | 0 |
| Poppy | 0 | 0 |
| Mesen2 | 0 | 0 |
| bps-patch | 0 | 0 |
| DW4-info | 0 | 0 |
| FFMQ-info | 0 | 0 |
| GameInfo | 0 | 0 |

---

## Creating GitHub Issues

For significant issues, create GitHub issues:

### When to Create GitHub Issue:
- 🔴 Critical - Always
- 🟠 High - Always
- 🟡 Medium - Usually
- 🟢 Low - If time permits

### GitHub Issue Template:

```markdown
## Description
[Clear description of the issue]

## Steps to Reproduce
1. 
2. 
3. 

## Expected Behavior
[What should happen]

## Actual Behavior
[What actually happens]

## Environment
- OS: 
- .NET Version: 
- Commit/Version: 

## Screenshots/Logs
[If applicable]

## Additional Context
[Any other relevant information]
```

### GitHub Issue Labels to Use:
- `bug` - Something isn't working
- `enhancement` - New feature or request
- `documentation` - Documentation issue
- `testing` - Testing related
- `priority:critical` / `priority:high` / `priority:medium` / `priority:low`

---

## Issue Workflow

```
┌─────────┐     ┌──────────────┐     ┌─────────────┐     ┌────────┐
│   New   │ ──► │ Investigating│ ──► │ In Progress │ ──► │ Fixed  │
└─────────┘     └──────────────┘     └─────────────┘     └────────┘
     │                                      │
     │                                      ▼
     │                               ┌────────────┐
     └──────────────────────────────►│ Won't Fix  │
                                     └────────────┘
```

1. **New** - Just discovered
2. **Investigating** - Looking into root cause
3. **In Progress** - Fix being developed
4. **Fixed** - Fix complete and verified
5. **Won't Fix** - Decided not to address (with reason)

---

## Daily Issue Review

At end of each testing day:

1. [ ] Review all new issues found today
2. [ ] Assign severity levels
3. [ ] Create GitHub issues for High/Critical
4. [ ] Update issue statistics
5. [ ] Note any patterns or related issues
