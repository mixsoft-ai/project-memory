# Getting Started with Project Memory

**Your project's long-term memory - automated by AI, confirmed by developers.**

> *AI drafts. You confirm. Knowledge compounds.*

---

You have workflow files in `./docs/workflow/`:

| File | Purpose |
|------|---------|
| `project-memory.md` | Main system guide |
| `architecture-guide-generator.md` | Create ARCHITECTURE.md via questionnaire |
| `automation-patterns.md` | Detect repeated prompts → suggest automation |
| `prompt-patterns.md` | Track patterns across sessions |
| `ai-agent-guide-template.md` | Template for AI-AGENT-GUIDE.md |
| `tool-extensions/` | Tool-specific automation guides |

Session logs are stored in `./docs/session-logs/`.

---

## What Is Project Memory?

**Your project's long-term memory - automated by AI, confirmed by developers.**

- AI detects when to document (decisions, failures, quirks)
- AI drafts the documentation
- Developer confirms/edits (10 seconds)
- Knowledge persists for future sessions

---

## For AI Coding Tools (CRITICAL)

### Platform Detection (FIRST STEP)

**Run this before any other commands:**

```bash
# Detect platform
uname -s 2>/dev/null || echo "Windows"
```

- `Linux` or `Darwin` → Use **bash** commands
- `Windows` or error → Use **PowerShell** commands

### Date/Time Awareness

**LLMs have knowledge cutoffs. NEVER assume dates from training data.**

**Bash:**
```bash
date +%Y-%m-%d
```

**PowerShell:**
```powershell
Get-Date -Format "yyyy-MM-dd"
```

### Session Start (MANDATORY)

1. **Detect platform:** Run platform detection command above
2. **Check current date:** Use appropriate date command
3. **Read ARCHITECTURE.md:** Understand code organization
4. **Read cross-session files:**
   - `docs/workflow/prompt-patterns.md`
   - Recent files in `docs/session-logs/`
5. **Search project memory for task context:**
   - Bash: `grep -r "keyword" docs/`
   - PowerShell: `Select-String -Path "docs\**\*" -Pattern "keyword"`

### During Coding

**Proactively offer to document:**

| Trigger | Action |
|---------|--------|
| Decision made | Draft ADR, ask to save |
| Long debugging | Draft failure log, ask to save |
| **Mistake made / instruction not followed** | Draft failure log, ask to save |
| **User corrects AI behavior** | Draft failure log, ask to save |
| Non-obvious behavior | Draft data quirk doc, ask to save |
| Same prompt 3+ times | Suggest automation |

**BEFORE creating any dated file:** Run date command first. Never use training data year.

### Documentation Priority

**Project Memory (`docs/`) is PRIMARY.** Tool configs are SECONDARY.

1. **FIRST:** Create doc in `docs/` folder
2. **THEN:** Update tool config if needed

**Never update only tool config without also updating Project Memory.**

### User Correction Pattern

When user corrects your behavior:
1. Acknowledge mistake
2. Run date command
3. Create `docs/failures/YYYY-MM-DD-description.md`
4. Update instructions to prevent recurrence

### Session End

Offer to update:
- `docs/workflow/prompt-patterns.md` with repeated prompts
- `docs/session-logs/YYYY-MM-DD.md` with session summary

### Creating ARCHITECTURE.md

**MUST follow questionnaire - DO NOT generate without developer input.**

---

## Directory Structure

```
project-root/
├── ARCHITECTURE.md              # Code organization (create via questionnaire)
├── AI-AGENT-GUIDE.md            # Instructions for AI tools
│
└── docs/
    ├── decisions/               # ADRs
    ├── failures/                # Failure logs
    ├── data-quirks/             # Data quirk docs
    ├── database/                # Schema docs
    ├── integrations/            # External API docs
    ├── reference/               # Config docs
    ├── session-logs/            # Daily session summaries
    │   └── YYYY-MM-DD.md
    │
    └── workflow/                # Development workflow
        ├── project-memory.md
        ├── architecture-guide-generator.md
        ├── automation-patterns.md
        ├── prompt-patterns.md
        ├── ai-agent-guide-template.md
        └── getting-started.md
```

---

## Setup Steps

### 0. Detect Platform (FIRST STEP)

**Run this at the start of every session to determine which commands to use:**

```bash
# Detect platform
uname -s 2>/dev/null || echo "Windows"
```

**Results:**
- `Linux` or `Darwin` → Use **bash** commands
- `Windows` or error → Use **PowerShell** commands

**AI agents MUST:**
1. Run platform detection before suggesting any commands
2. Use the appropriate command syntax throughout the session
3. Store result mentally for the session duration

---

### 1. Create Directory Structure

**Bash (Linux/macOS):**
```bash
mkdir -p docs/{decisions,failures,data-quirks,database,integrations,reference}
mkdir -p docs/session-logs
```

**PowerShell (Windows):**
```powershell
$dirs = @(
    "docs/decisions",
    "docs/failures",
    "docs/data-quirks",
    "docs/database",
    "docs/integrations",
    "docs/reference",
    "docs/session-logs"
)
$dirs | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ }
```

### 2. Copy Workflow Files

Copy all files from `docs/workflow/` to your project.

### 3. Create AI-AGENT-GUIDE.md

Copy `docs/workflow/ai-agent-guide-template.md` to project root as `AI-AGENT-GUIDE.md`.

### 4. Add ADR Template

**Bash (Linux/macOS):**
```bash
cat > docs/decisions/000-template.md << 'EOF'
# ADR-XXX: Title

## Status
Accepted | Superseded | Deprecated

## Context
What situation required a decision?

## Problem
What specific problem needed solving?

## Decision
What was chosen and why?

## Consequences
- Positive outcomes
- Negative tradeoffs

## Alternatives Considered
What else was evaluated? Why rejected?
EOF
```

**PowerShell (Windows):**
```powershell
@"
# ADR-XXX: Title

## Status
Accepted | Superseded | Deprecated

## Context
What situation required a decision?

## Problem
What specific problem needed solving?

## Decision
What was chosen and why?

## Consequences
- Positive outcomes
- Negative tradeoffs

## Alternatives Considered
What else was evaluated? Why rejected?
"@ | Out-File -FilePath "docs/decisions/000-template.md" -Encoding utf8
```

### 5. Create Tool-Specific Config

**CLAUDE.md:**
```markdown
## Project Memory
See [AI-AGENT-GUIDE.md](./AI-AGENT-GUIDE.md) for automated documentation workflow.
See [ARCHITECTURE.md](./ARCHITECTURE.md) for code organization.

When creating ARCHITECTURE.md, follow docs/workflow/architecture-guide-generator.md. DO NOT skip questionnaire.
```

**GEMINI.md:**
```markdown
## Project Memory
See [AI-AGENT-GUIDE.md](./AI-AGENT-GUIDE.md) for automated documentation workflow.
See [ARCHITECTURE.md](./ARCHITECTURE.md) for code organization.

When creating ARCHITECTURE.md, follow docs/workflow/architecture-guide-generator.md. DO NOT skip questionnaire.
```

**.cursorrules:**
```
See AI-AGENT-GUIDE.md for automated documentation workflow.
See ARCHITECTURE.md for code organization.
When creating ARCHITECTURE.md, follow docs/workflow/architecture-guide-generator.md. DO NOT skip questionnaire.
```

### 6. Create ARCHITECTURE.md

Ask your AI tool:
> "Help me create ARCHITECTURE.md using docs/workflow/architecture-guide-generator.md"

### 7. Install Tool-Specific Extensions

Tool extensions enable **automatic** Project Memory behaviors (auto-search before coding, auto-suggest documentation, auto-create slash commands from patterns).

| Tool | Extension Guide | Recommended |
|------|-----------------|-------------|
| Claude Code | `docs/workflow/tool-extensions/claude-code/` | Yes |
| Cursor | Coming soon (contributions welcome) | - |
| Other tools | Coming soon (contributions welcome) | - |

**If using Claude Code, install the Project Memory skill and commands:**

```
See: docs/workflow/tool-extensions/claude-code/README.md
```

**What gets installed:**

| Component | Location | Purpose |
|-----------|----------|---------|
| Project Memory Skill | `~/.claude/skills/project-memory/` | Auto-activates "search before code" behavior |
| Slash Commands | `~/.claude/commands/` | `/session-start`, `/session-end`, `/document-decision`, etc. |

**Why user scope (`~/.claude/`)?**
These are generic behaviors that work with ANY project using Project Memory. Install once, works everywhere.

**Skip this step only if:**
- Using a different AI tool (Cursor, Copilot, etc.) — wait for tool-specific guide
- Prefer fully manual workflow over automation

---

## Quick Reference

| I need to... | Location |
|--------------|----------|
| Understand the system | `docs/workflow/project-memory.md` |
| Create ARCHITECTURE.md | `docs/workflow/architecture-guide-generator.md` |
| Track repeated prompts | `docs/workflow/prompt-patterns.md` |
| See automation options | `docs/workflow/automation-patterns.md` |
| AI-AGENT-GUIDE template | `docs/workflow/ai-agent-guide-template.md` |
| Session logs | `docs/session-logs/` |
| Tool-specific extensions | `docs/workflow/tool-extensions/` |
| This getting started guide | `docs/workflow/getting-started.md` |

---

## Setup Completion Checklist

**AI agents: Verify ALL items before considering setup complete.**

### Directory Structure
- [ ] `docs/decisions/` exists
- [ ] `docs/failures/` exists
- [ ] `docs/data-quirks/` exists
- [ ] `docs/database/` exists
- [ ] `docs/integrations/` exists
- [ ] `docs/reference/` exists
- [ ] `docs/session-logs/` exists

### Templates & Workflow Files
- [ ] `docs/decisions/000-template.md` exists (ADR template)
- [ ] `docs/workflow/project-memory.md` exists
- [ ] `docs/workflow/architecture-guide-generator.md` exists
- [ ] `docs/workflow/automation-patterns.md` exists
- [ ] `docs/workflow/prompt-patterns.md` exists
- [ ] `docs/workflow/ai-agent-guide-template.md` exists

### Core Documentation
- [ ] `AI-AGENT-GUIDE.md` created from template (in project root)
- [ ] `ARCHITECTURE.md` created **via questionnaire** (NOT auto-generated)
- [ ] Tool config file created (CLAUDE.md, GEMINI.md, or .cursorrules)

### Tool Config File Includes
- [ ] Reference to AI-AGENT-GUIDE.md
- [ ] Reference to ARCHITECTURE.md
- [ ] Session start/end workflow instructions
- [ ] Platform-specific commands or detection step

### AI-AGENT-GUIDE.md Includes (compare against template)
- [ ] Platform detection section
- [ ] Date/Time awareness section
- [ ] Session start steps (including reading ARCHITECTURE.md)
- [ ] Research before code section
- [ ] Proactive documentation triggers
- [ ] Session end workflow
- [ ] Reference to architecture-guide-generator.md

### Tool Extensions (If Applicable)
- [ ] Tool-specific extensions installed per guide in `docs/workflow/tool-extensions/`

See your tool's extension guide for verification steps:
- Claude Code: `docs/workflow/tool-extensions/claude-code/README.md`
- Other tools: Coming soon

### Validation Command

**Bash:**
```bash
# Quick verification
ls -la docs/decisions/000-template.md docs/workflow/*.md AI-AGENT-GUIDE.md ARCHITECTURE.md 2>/dev/null
```

**PowerShell:**
```powershell
# Quick verification
@("docs/decisions/000-template.md", "AI-AGENT-GUIDE.md", "ARCHITECTURE.md") +
(Get-ChildItem "docs/workflow/*.md").FullName | ForEach-Object {
    if (Test-Path $_) { "✓ $_" } else { "✗ MISSING: $_" }
}
```

---

## The System Works Because...

**Old way:** Developer writes docs → Never happens

**New way:**
1. AI detects opportunity
2. AI drafts document
3. Developer says "yes" (10 seconds)
4. AI tracks patterns across sessions
5. AI suggests automation when patterns repeat

**Developer effort: Confirm or edit. That's it.**
