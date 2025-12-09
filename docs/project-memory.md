# Project Memory

**Your project's long-term memory - automated by AI, confirmed by developers.**

> *AI drafts. You confirm. Knowledge compounds.*

## What Is Project Memory?

**Project Memory** captures what your project needs to remember:

- **Decisions** - Why we chose approach A over B
- **Failures** - Mistakes we made and learned from
- **Quirks** - Non-obvious behaviors we discovered
- **Context** - Background knowledge for effective work
- **Patterns** - Repeated prompts/workflows to automate

### The Key Insight

**Developers are busy. They won't write documentation manually.**

But with AI coding tools, they don't have to. The AI:
1. Detects when something should be documented
2. Drafts the documentation
3. Asks developer to confirm/edit
4. Saves to project memory

**Developer effort: Review and confirm. That's it.**

### Who Benefits?

| Audience | How They Benefit |
|----------|------------------|
| **You in 6 months** | Remember why you made that decision |
| **New team member** | Onboard without asking "why is it like this?" |
| **Developer B** | Learn from Developer A's mistakes |
| **AI coding tools** | Get context before writing code |

---

## How It Works (Automation-First)

### For AI Coding Tools: Auto-Document Triggers

**You MUST proactively offer to document when you detect these situations:**

#### 1. Decision Made → Offer ADR

**Detect when:**
- Developer chose between 2+ approaches
- Selected a library/framework over alternatives
- Changed architecture or patterns
- Decided NOT to do something (and why)

**Action:**
```
I notice we just decided to [decision].
Want me to document this in project memory so we remember why?

[Draft ADR for developer to review]
```

#### 2. Mistake or Failure → Offer Failure Log

**Detect when:**
- Multiple failed attempts before solution
- Incorrect assumption caused wasted time
- Approach failed and had to pivot
- **Mistake made / instruction not followed**
- **User corrects AI behavior**

**Action:**
```
[Acknowledge the mistake]
Want me to document this in project memory so we don't hit it again?

[Draft failure log for developer to review]
```

#### 3. Non-Obvious Behavior Found → Offer Data Quirk

**Detect when:**
- Data didn't behave as expected
- NULL/empty values in unexpected places
- Timezone/format inconsistencies
- Retention/purge policies discovered

**Action:**
```
This behavior wasn't obvious.
Want me to document this quirk so future queries handle it correctly?

[Draft data quirk doc for developer to review]
```

#### BEFORE Creating Any Dated File

**Run date check command FIRST:**
- Bash: `date +%Y-%m-%d`
- PowerShell: `Get-Date -Format "yyyy-MM-dd"`

**Never use training data knowledge cutoff year.** AI models have stale date knowledge.

#### 4. Schema Discovered → Offer Schema Doc

**Detect when:**
- Queried a table for the first time
- Discovered field types/meanings
- Found relationships between tables

**Action:**
```
I learned about this table structure.
Want me to document the schema for future reference?

[Draft schema doc for developer to review]
```

#### 5. Integration Connected → Offer Integration Doc

**Detect when:**
- Connected to external API
- Discovered authentication patterns
- Found rate limits or quirks

**Action:**
```
We figured out how to integrate with [service].
Want me to document this for future reference?

[Draft integration doc for developer to review]
```

### Platform Detection (FIRST STEP)

**AI agents MUST detect platform before running any commands:**

```bash
# Detect platform
uname -s 2>/dev/null || echo "Windows"
```

- `Linux` or `Darwin` → Use **bash** commands
- `Windows` or error → Use **PowerShell** commands

### The Workflow

```
┌─────────────────────────────────────────────────────────┐
│                   SESSION START                         │
├─────────────────────────────────────────────────────────┤
│  AI detects platform (bash vs PowerShell)               │
│  AI reads:                                              │
│  - ARCHITECTURE.md (code organization)                  │
│  - docs/workflow/prompt-patterns.md (cross-session)     │
│  - docs/session-logs/ (recent context)                  │
│  - Searches project memory for task-relevant context    │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    DURING CODING                        │
├─────────────────────────────────────────────────────────┤
│  AI detects documentation triggers:                     │
│  - Decision made? → Draft ADR                           │
│  - Mistake/failure? → Draft failure log                 │
│  - User corrects AI? → Draft failure log                │
│  - Quirk found? → Draft data quirk doc                  │
│  - Repeated prompt? → Track in prompt-patterns.md       │
│                                                         │
│  AI asks: "Want me to save this to project memory?"     │
│  Developer: Confirms, edits, or skips                   │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    SESSION END                          │
├─────────────────────────────────────────────────────────┤
│  AI offers:                                             │
│  - "Update prompt-patterns.md with today's patterns?"   │
│  - "Create session log for future context?"             │
│                                                         │
│  Next session benefits from captured knowledge          │
└─────────────────────────────────────────────────────────┘
```

---

## Directory Structure

```
project-root/
├── ARCHITECTURE.md              # HOW code is structured
├── AI-AGENT-GUIDE.md            # Instructions for AI tools
│
└── docs/
    ├── decisions/               # ADRs - why we chose what we chose
    │   ├── 000-template.md
    │   └── 001-decision-name.md
    ├── failures/                # Past mistakes and lessons learned
    │   └── 001-failure-name.md
    ├── data-quirks/             # Non-obvious data behaviors
    │   └── 001-quirk-name.md
    ├── database/                # Schema docs
    │   └── table_name.md
    ├── integrations/            # External API/service docs
    │   └── service-name.md
    ├── reference/               # Config, env vars, constants
    │   └── config.md
    ├── session-logs/            # Session summaries by date
    │   └── YYYY-MM-DD.md
    │
    └── workflow/                # Development workflow docs
        ├── project-memory.md        # This file - system guide
        ├── architecture-guide-generator.md  # ARCHITECTURE.md creation
        ├── automation-patterns.md   # Automation detection guide
        └── prompt-patterns.md       # Cross-session pattern tracking
```

---

## Cross-Session Pattern Tracking

LLMs don't remember between sessions. We solve this with explicit tracking files.

### prompt-patterns.md

Tracks repeated prompts across sessions:

```markdown
| Pattern | Count | Last Used | Sessions | Status |
|---------|-------|-----------|----------|--------|
| "run tests, fix failures" | 5 | 2025-12-04 | 3 | Pending |
```

**AI behavior:**
- **Session start:** Read prompt-patterns.md
- **During session:** Track repeated prompts mentally
- **Session end:** Offer to update the file
- **When count >= 3:** Suggest automation

### session-logs/

Daily session summaries for context continuity:

```markdown
# Session Log: YYYY-MM-DD

## Summary
What was worked on this session.

## Key Decisions Made
Decisions that were documented as ADRs.

## Patterns Noticed
Repeated prompts/workflows observed.

## Context for Next Session
Important context for continuing work.
```

**AI behavior:**
- **Session start:** Read recent session logs for context
- **Session end:** Offer to create session log

---

## Document Templates

### ADR (Architectural Decision Record)

Location: `docs/decisions/NNN-decision-name.md`

```markdown
# ADR-NNN: Title

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
```

### Failure Log

Location: `docs/failures/NNN-failure-name.md`

```markdown
# Failure: Title

## What Happened
Brief description of the failure.

## Root Cause
Why it happened.

## Impact
Time wasted, bugs introduced, etc.

## Lesson Learned
Key takeaway.

## Prevention
How to avoid in future.
```

### Data Quirk

Location: `docs/data-quirks/NNN-quirk-name.md`

```markdown
# Data Quirk: Title

## Behavior
What the non-obvious behavior is.

## Why It Matters
Impact on queries/logic.

## Detection
How to identify when this affects you.

## Correct Pattern
Code/query examples that handle it properly.
```

### Schema Doc

Location: `docs/database/table-name.md`

```markdown
# Table: table_name

## Description
What this table contains.

## Key Fields
| Field | Type | Description |
|-------|------|-------------|
| id | STRING | Primary key |

## Sample Query
```sql
SELECT field1, field2 FROM table WHERE condition
```

## Known Quirks
- Link to relevant data-quirk doc if exists
```

### Integration Doc

Location: `docs/integrations/service-name.md`

```markdown
# Integration: Service Name

## Purpose
What this integration does.

## Authentication
How to authenticate (API keys, OAuth, etc.)

## Key Endpoints
| Endpoint | Purpose |
|----------|---------|
| GET /api/resource | Fetches resources |

## Rate Limits
Any throttling or limits to be aware of.

## Quirks
Non-obvious behaviors discovered.

## Error Handling
Common errors and how to handle them.
```

### Session Log

Location: `docs/session-logs/YYYY-MM-DD.md`

```markdown
# Session Log: YYYY-MM-DD

## Summary
Brief description of what was worked on.

## Key Decisions Made
- [Decision 1] → ADR-NNN
- [Decision 2] → ADR-NNN

## Patterns Noticed
| Pattern | Occurrences | Notes |
|---------|-------------|-------|
| "prompt pattern" | N | Notes |

## Files Created/Modified
- `path/to/file.md` - Description

## Context for Next Session
Important context for continuing this work.

## Open Items
- [ ] Item not yet completed
```

---

## Cross-Project Learning

AI coding tools should help developers learn from other projects.

### When to Suggest Cross-Project Lookup

**Detect when:**
- Developer is implementing a common pattern (auth, caching, pagination, etc.)
- Similar problem was likely solved in open source
- Developer mentions "like we did in [other project]"

**Action:**
```
This looks like a common pattern. Want me to:
1. Search GitHub for similar implementations?
2. Check how [specific repo] handles this?
3. Look for best practices online?

I'll document the pattern in project memory after we figure it out.
```

### Using GitHub CLI for Lookups

```bash
# Search GitHub for implementations
gh search code "pattern OR keyword" --language=python --limit=10

# Clone specific repo to reference
gh repo clone owner/repo /tmp/reference-repo

# Search within cloned repo
grep -r "pattern" /tmp/reference-repo/src/
```

**After finding useful pattern:**
```
Found a good approach in [repo]. Want me to:
1. Adapt it for our codebase?
2. Document the pattern in project memory for future reference?
```

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
2. Run `date +%Y-%m-%d` (or PowerShell equivalent)
3. Create failure doc in `docs/failures/YYYY-MM-DD-description.md`
4. Update relevant instructions to prevent recurrence

This pattern ensures lessons are captured, not just acknowledged and forgotten.

---

## Automation Patterns

See [automation-patterns.md](./automation-patterns.md) for:
- Tracking repeated prompts/commands
- Suggesting slash commands, sub-agents, or hooks

---

## AI Agent Integration

### The AI-AGENT-GUIDE.md File

Create at project root using [ai-agent-guide-template.md](./ai-agent-guide-template.md).

Key behaviors:
1. **Platform detection** - Determine bash vs PowerShell
2. **Date/time awareness** - Check actual date, don't assume from training
3. **Session start** - Read ARCHITECTURE.md, prompt-patterns.md, recent session logs
4. **During coding** - Proactively offer to document triggers
5. **Session end** - Offer to update tracking files

### Tool-Specific Config Files

Each tool has a config file that references `AI-AGENT-GUIDE.md`:

| Tool | Config File |
|------|-------------|
| Claude Code | `CLAUDE.md` |
| Gemini CLI | `GEMINI.md` |
| Cursor | `.cursorrules` |
| Multiple tools | `AGENTS.md` |

### Tool-Specific Extensions

For advanced automation (slash commands, skills, subagents), see:

| Tool | Extension Guide |
|------|-----------------|
| Claude Code | [tool-extensions/claude-code/](./tool-extensions/claude-code/) |
| Other tools | Coming soon (contributions welcome) |

---

## Architecture Documentation

Architecture docs are separate from project memory.

| Project Memory | ARCHITECTURE.md |
|----------------|-----------------|
| Grows over time (automated) | Defined upfront |
| Captures discoveries | Describes intentional design |
| AI drafts, developer confirms | Created via questionnaire |

See [architecture-guide-generator.md](./architecture-guide-generator.md) for creating `ARCHITECTURE.md`.

---

## Setup Instructions

### 0. Detect Platform (FIRST STEP)

```bash
uname -s 2>/dev/null || echo "Windows"
```

### 1. Create Directory Structure

**Bash (Linux/macOS):**
```bash
mkdir -p docs/{decisions,failures,data-quirks,database,integrations,reference,session-logs}
```

**PowerShell (Windows):**
```powershell
$dirs = @(
    "docs/decisions", "docs/failures", "docs/data-quirks",
    "docs/database", "docs/integrations", "docs/reference", "docs/session-logs"
)
$dirs | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ }
```

### 2. Add ADR Template

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

### 3. Copy Workflow Files

Copy these files to `docs/workflow/`:
- `project-memory.md` (this file)
- `architecture-guide-generator.md`
- `automation-patterns.md`
- `prompt-patterns.md`

### 4. Create AI-AGENT-GUIDE.md

Copy template from below to project root.

### 5. Create Tool-Specific Config

- Claude Code → `CLAUDE.md`
- Gemini CLI → `GEMINI.md`
- Cursor → `.cursorrules`
- Multiple tools → `AGENTS.md`

---

## Key Principles

1. **AI drafts, developer confirms** - Minimal effort for developer
2. **Proactive detection** - AI offers to document at the right moment
3. **Tool-agnostic** - Works with any AI coding tool
4. **Search before coding** - AI checks project memory automatically
5. **Cross-session tracking** - Pattern tracking persists between sessions
6. **Cross-project learning** - AI suggests lookups and documents patterns
7. **Progressive automation** - Repeated patterns become slash commands/agents

---

## Summary

**Old way:** Developer manually writes docs (never happens)

**New way:**
1. AI detects documentation opportunity
2. AI drafts the document
3. Developer confirms/edits (10 seconds)
4. Knowledge saved to project memory
5. Future sessions benefit automatically

**The system works because developers only have to say "yes" or "change this".**
