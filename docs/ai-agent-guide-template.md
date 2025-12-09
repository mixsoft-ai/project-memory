# AI Agent Guide (Template)

**Part of Project Memory - automated by AI, confirmed by developers.**

Instructions for AI coding agents working on this codebase. Copy this to your project root as `AI-AGENT-GUIDE.md`.

Works with any AI tool:
- CLI tools: Claude Code, OpenAI Codex, Gemini CLI, OpenCode CLI
- Terminal agents: Warp AI
- IDE extensions: GitHub Copilot, Codeium, Continue
- AI IDEs: Cursor, Windsurf, Antigravity

---

## CRITICAL: Platform Detection (FIRST STEP)

**Run this before any other commands:**

```bash
# Detect platform
uname -s 2>/dev/null || echo "Windows"
```

- `Linux` or `Darwin` → Use **bash** commands
- `Windows` or error → Use **PowerShell** commands

Store this mentally for the entire session.

**Windows Quoting Warning (bash-based AI tools):**

Some AI tools run bash internally. When calling PowerShell from bash, use single quotes:
```bash
# WRONG - double quotes get mangled
powershell -Command "Test-Path \"$env:USERPROFILE\path\""

# CORRECT - single quotes pass through intact
powershell -Command 'Test-Path "$env:USERPROFILE\path"'
```

---

## CRITICAL: Date/Time Awareness

**LLMs have knowledge cutoffs. Do NOT assume dates from training data.**

When you need current date/time:

**Bash (Linux/macOS):**
```bash
date +%Y-%m-%d
date "+%Y-%m-%d %H:%M:%S"
```

**PowerShell (Windows):**
```powershell
Get-Date -Format "yyyy-MM-dd"
Get-Date -Format "yyyy-MM-dd HH:mm:ss"
```

**Always verify the current date when:**
- Writing timestamps in files
- Creating dated documents (session logs, etc.)
- Searching for recent information
- Referencing "current" or "latest" versions

**Do NOT rely on your training data for the current date.** Your knowledge cutoff may be months or years old.

---

## Session Start (MANDATORY)

At the beginning of each session:

### 1. Detect Platform
```bash
uname -s 2>/dev/null || echo "Windows"
```

### 2. Check Current Date

**Bash:** `date +%Y-%m-%d`
**PowerShell:** `Get-Date -Format "yyyy-MM-dd"`

### 3. Read ARCHITECTURE.md
Understand code organization before making changes.

### 4. Read Cross-Session Tracking Files

**Bash:**
```bash
cat docs/workflow/prompt-patterns.md
ls docs/session-logs/ | tail -5
cat docs/session-logs/[most-recent].md
```

**PowerShell:**
```powershell
Get-Content docs/workflow/prompt-patterns.md
Get-ChildItem docs/session-logs | Select-Object -Last 5
Get-Content docs/session-logs/[most-recent].md
```

### 5. Search Project Memory for Task Context

**Bash:** `grep -r "keyword" docs/`
**PowerShell:** `Select-String -Path "docs\**\*" -Pattern "keyword"`

### 6. Report Relevant Findings
Before coding, inform developer of:
- Past decisions that apply to current task
- Failures to avoid
- Quirks to handle
- Patterns approaching automation threshold

### 7. Verify Tool Extensions (First Session Only)
If tool-specific extensions are available, verify they're installed.
See `docs/workflow/tool-extensions/` for your AI tool's guide.

---

## During Coding

### Research Before Code (MANDATORY)

**If guessing any name/value → STOP and search first**

**Bash:**
```bash
grep -r "table_name" docs/database/
grep -r "table_name" src/
grep -r "keyword" docs/decisions/
grep -r "keyword" docs/failures/
grep -r "field_name" docs/data-quirks/
```

**PowerShell:**
```powershell
Select-String -Path "docs\database\*" -Pattern "table_name"
Select-String -Path "src\**\*" -Pattern "table_name" -Recurse
Select-String -Path "docs\decisions\*" -Pattern "keyword"
Select-String -Path "docs\failures\*" -Pattern "keyword"
Select-String -Path "docs\data-quirks\*" -Pattern "field_name"
```

### Proactive Documentation

**Offer to document when you detect:**

| Trigger | Action |
|---------|--------|
| Decision made | "Save as ADR?" + draft |
| Long debugging | "Save as failure log?" + draft |
| **Mistake made / instruction not followed** | "Save as failure log?" + draft |
| **User corrects AI behavior** | "Save as failure log?" + draft |
| Quirk found | "Save as data quirk?" + draft |
| Schema learned | "Save as schema doc?" + draft |
| Integration figured out | "Save as integration doc?" + draft |

**BEFORE creating any dated file:** Run `date +%Y-%m-%d` (bash) or `Get-Date -Format "yyyy-MM-dd"` (PowerShell) first. Never use training data knowledge cutoff year.

**Draft the document. Developer just confirms/edits.**

### Documentation Priority

**Project Memory (`docs/`) is the PRIMARY location for all learnings.**
Tool-specific configs (CLAUDE.md, .cursorrules, etc.) are SECONDARY.

When documenting a learning:
1. **FIRST:** Create doc in appropriate `docs/` folder
2. **THEN:** Update tool-specific config if needed

**Never update only tool config without also updating Project Memory.**

### User Correction Pattern

When user corrects your behavior or points out a mistake:
1. Acknowledge the mistake
2. Run date command to get current date
3. Create failure doc in `docs/failures/YYYY-MM-DD-description.md`
4. Update relevant instructions to prevent recurrence

### Track Repeated Patterns

Mentally note when developer:
- Types similar prompts multiple times
- Follows same multi-step workflow
- Always needs same context before certain tasks

---

## Session End

### Offer to Update Tracking Files

```
This session is ending. Want me to:

1. Update prompt-patterns.md with repeated prompts from today?
2. Create a session log for future context?
```

### If Updating prompt-patterns.md

Add/update rows for patterns noticed:
```markdown
| Pattern | Count | Last Used | Sessions | Status |
|---------|-------|-----------|----------|--------|
| "[pattern]" | [count] | [today's date] | [sessions] | Pending |
```

### If Creating Session Log

Create `docs/session-logs/YYYY-MM-DD.md`:
```markdown
# Session Log: [actual date from date command]

## Summary
[What was worked on]

## Key Decisions Made
[Any ADRs created]

## Patterns Noticed
[Repeated prompts/workflows]

## Context for Next Session
[Important context for continuing]

## Open Items
- [ ] [Incomplete items]
```

---

## Automation Suggestions

### When Pattern Count >= 3

```
I notice "[pattern]" has been used [count] times across [sessions] sessions.

Want me to help create a [slash command / sub-agent / hook] for this?
```

See `docs/workflow/automation-patterns.md` for detection rules.
See `docs/workflow/tool-extensions/` for tool-specific implementation guides.

---

## Cross-Project Learning

### When Implementing Common Patterns

```
This looks like a common pattern. Want me to:
1. Search GitHub for similar implementations?
2. Check how [specific repo] handles this?
3. Look for best practices online?

I'll document the pattern in project memory after.
```

### Using GitHub CLI

```bash
# Search GitHub
gh search code "pattern" --language=[lang] --limit=10

# Clone reference repo
gh repo clone owner/repo /tmp/reference

# Search within repo
grep -r "pattern" /tmp/reference/src/
```

---

## Creating ARCHITECTURE.md

**MUST follow questionnaire - DO NOT generate without developer input.**

See `docs/workflow/architecture-guide-generator.md`.

1. Ask "Quick or Thorough?"
2. Run through questionnaire
3. Generate based on answers
4. Validate with developer

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
| Workflow guides | `docs/workflow/` |
| Prompt patterns | `docs/workflow/prompt-patterns.md` |
| Session logs | `docs/session-logs/` |
| Tool extensions | `docs/workflow/tool-extensions/` |

---

## Quick Reference

**Platform detection:**
```bash
uname -s 2>/dev/null || echo "Windows"
```

**Get current date:**
- Bash: `date +%Y-%m-%d`
- PowerShell: `Get-Date -Format "yyyy-MM-dd"`

**Search project memory:**
- Bash: `grep -r "keyword" docs/`
- PowerShell: `Select-String -Path "docs\**\*" -Pattern "keyword"`

**Check prompt patterns:**
- Bash: `cat docs/workflow/prompt-patterns.md`
- PowerShell: `Get-Content docs/workflow/prompt-patterns.md`

**Read recent session log:**
- Bash: `ls docs/session-logs/ | tail -1 | xargs -I {} cat docs/session-logs/{}`
- PowerShell: `Get-Content (Get-ChildItem docs/session-logs | Select-Object -Last 1).FullName`

---

## Key Behaviors Summary

1. **Detect platform** - Run detection first, use appropriate commands
2. **Check date before dated files** - Run date command, never assume from training data
3. **Read ARCHITECTURE.md** - Understand code organization
4. **Read tracking files** - prompt-patterns.md, recent session logs
5. **Search before coding** - Don't guess names/values
6. **Proactively document** - Offer to save decisions, failures, quirks
7. **Project Memory first** - Create in `docs/` BEFORE updating tool config
8. **User correction = failure doc** - When corrected, document in `docs/failures/`
9. **Track patterns** - Note repeated prompts/workflows
10. **Update at session end** - Offer to update tracking files
11. **Suggest automation** - When patterns reach threshold
