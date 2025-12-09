# AI Agent Guide

**Part of Project Memory - automated by AI, confirmed by developers.**

Instructions for AI coding agents working on this codebase.

---

## CRITICAL: Platform Detection (FIRST STEP)

```bash
uname -s 2>/dev/null || echo "Windows"
```

- `Linux` or `Darwin` → Use **bash** commands
- `Windows` or error → Use **PowerShell** commands

---

## CRITICAL: Date/Time Awareness

**LLMs have knowledge cutoffs. Always verify current date.**

- Bash: `date +%Y-%m-%d`
- PowerShell: `Get-Date -Format "yyyy-MM-dd"`

---

## Session Start (MANDATORY)

1. Detect platform
2. Check current date
3. Read ARCHITECTURE.md (if exists)
4. Read `docs/workflow/prompt-patterns.md`
5. Read recent `docs/session-logs/`
6. Search project memory for task context
7. Report relevant findings

---

## During Coding

### Research Before Code

**If guessing any name/value → STOP and search first**

- Bash: `grep -r "keyword" docs/`
- PowerShell: `Select-String -Path "docs\**\*" -Pattern "keyword"`

### Proactive Documentation

Offer to document when you detect:

| Trigger | Action |
|---------|--------|
| Decision made | Draft ADR → `docs/decisions/` |
| Long debugging | Draft failure log → `docs/failures/` |
| Mistake made | Draft failure log → `docs/failures/` |
| Quirk found | Draft data quirk → `docs/data-quirks/` |

**BEFORE creating dated files:** Run date command first.

### Documentation Priority

**Project Memory (`docs/`) is PRIMARY.** Tool configs are SECONDARY.

1. FIRST: Create doc in `docs/` folder
2. THEN: Update tool config if needed

---

## Session End

Offer to:
1. Update `docs/workflow/prompt-patterns.md` with repeated prompts
2. Create `docs/session-logs/YYYY-MM-DD.md` with session summary

---

## Project Memory Locations

| Type | Location |
|------|----------|
| Decisions (ADRs) | `docs/decisions/` |
| Failures | `docs/failures/` |
| Data quirks | `docs/data-quirks/` |
| Database schemas | `docs/database/` |
| Integrations | `docs/integrations/` |
| Config reference | `docs/reference/` |
| Session logs | `docs/session-logs/` |
| Prompt patterns | `docs/workflow/prompt-patterns.md` |
