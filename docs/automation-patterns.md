# Automation Patterns

Track repeated prompts and commands to identify automation opportunities.

## The Concept

When you find yourself (or your AI tool finds itself) doing the same thing repeatedly, it's a signal to automate:

| Repetition | Automation |
|------------|------------|
| Same prompt 3+ times | → Slash command |
| Same multi-step workflow | → Sub-agent or script |
| Same context always needed | → Hook (auto-inject) |

**AI coding tools should track these patterns and suggest automations to the developer.**

---

## Cross-Session Pattern Tracking

LLMs don't remember between sessions. Use these files to persist pattern tracking:

- **`prompt-patterns.md`** - Tracks repeated prompts across sessions
- **`session-logs/`** - Daily summaries with patterns noticed

**AI behavior:**
1. **Session start:** Read `prompt-patterns.md` for patterns approaching threshold
2. **During session:** Track repeated prompts mentally
3. **Session end:** Offer to update `prompt-patterns.md`
4. **When count >= 3:** Auto-create slash command (Claude Code) or suggest automation (other tools)

See [prompt-patterns.md](./prompt-patterns.md) for the tracking file.

---

## For AI Coding Tools: Detection Rules

### 1. Repeated Prompts → Suggest Slash Command

**Detect when:**
- Developer types similar prompt 3+ times
- Prompt follows a pattern with variable parts

**Examples:**
- "Run tests, fix any failures, run again" (repeated)
- "Check for TypeScript errors and fix them" (repeated)
- "Review this code for security issues" (repeated)

**Action:**
```
I notice you've asked me to "[prompt pattern]" several times.

Want me to help you create a slash command for this?
That way you can just type `/command-name` instead of the full prompt.

Here's what I'd suggest:
- Command name: /test-and-fix
- What it does: [description]
- Where to save: [tool-specific location]
```

### 2. Repeated Multi-Step Workflows → Suggest Sub-Agent

**Detect when:**
- Same sequence of steps repeated
- Workflow requires specialized knowledge
- Task could run semi-autonomously

**Examples:**
- "Analyze PR, check for issues, suggest improvements" (code review workflow)
- "Check database schema, write migration, test it" (migration workflow)
- "Find similar code in codebase, adapt pattern, test" (pattern application)

**Action:**
```
This workflow has multiple steps that we keep repeating:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Want me to help you create a sub-agent for this?
The agent would handle this workflow automatically when triggered.

Suggested agent:
- Name: code-reviewer / migration-helper / pattern-applier
- Trigger: [when to use]
- Steps it automates: [list]
```

### 3. Repeated Context Needs → Suggest Hook

**Detect when:**
- Same context/files always needed before certain actions
- Developer keeps saying "remember to check X first"
- Certain constraints should always apply

**Examples:**
- "Always check the schema docs before writing queries"
- "Always run linter before committing"
- "Always check for similar implementations first"

**Action:**
```
I notice we always need to [context/action] before [task].

Want me to help you create a hook for this?
The hook would automatically [action] whenever you [trigger].

Suggested hook:
- Trigger: Before [action type]
- Auto-action: [what to do automatically]
- Tool config location: [where to set up]
```

---

## Tracking Format

AI tools should maintain awareness of repeated patterns. When suggesting automation:

```markdown
## Detected Pattern

**Pattern type:** Repeated prompt | Multi-step workflow | Context need
**Occurrences:** [number of times detected]
**Pattern:** [the repeated element]

## Suggested Automation

**Type:** Slash command | Sub-agent | Hook
**Name:** [suggested name]
**Description:** [what it does]

## Implementation (Tool-Specific)

[Instructions for the specific AI tool being used]
```

---

## Tool-Specific Implementation

Each AI coding tool has its own way to implement automations. See tool-specific guides:

| Tool | Guide |
|------|-------|
| Claude Code | [tool-extensions/claude-code/](./tool-extensions/claude-code/) |
| Cursor | Coming soon (contributions welcome) |
| GitHub Copilot | Coming soon (contributions welcome) |
| Other tools | [Contribute a guide](./tool-extensions/) |

### Generic (Any Tool)

If no tool-specific guide exists, document workflows in your AI agent config file:

```markdown
## Automated Workflows

### /test-and-fix
Run tests, fix failures, repeat until passing.

### Code Review Checklist
Before approving any code:
1. Check for security issues
2. Verify error handling
3. Check for performance concerns
4. Ensure tests exist
```

---

## Examples of Automatable Patterns

### Development Workflows

| Pattern | Automation Type | Suggested Name |
|---------|-----------------|----------------|
| "Run tests, fix failures, repeat" | Slash command | `/test-fix-loop` |
| "Check types, fix errors" | Slash command | `/typecheck` |
| "Lint and format code" | Slash command | `/lint` |
| "Build and check for errors" | Slash command | `/build-check` |

### Code Quality

| Pattern | Automation Type | Suggested Name |
|---------|-----------------|----------------|
| "Review for security issues" | Sub-agent | `security-reviewer` |
| "Check for performance issues" | Sub-agent | `perf-analyzer` |
| "Ensure consistent code style" | Hook | `pre-commit-lint` |

### Documentation

| Pattern | Automation Type | Suggested Name |
|---------|-----------------|----------------|
| "Document this function" | Slash command | `/doc-function` |
| "Update README with changes" | Slash command | `/update-readme` |
| "Generate API docs" | Slash command | `/gen-api-docs` |

### Database

| Pattern | Automation Type | Suggested Name |
|---------|-----------------|----------------|
| "Check schema before query" | Hook | `pre-query-schema-check` |
| "Generate migration" | Slash command | `/gen-migration` |
| "Validate query syntax" | Slash command | `/validate-sql` |

### Git/GitHub

| Pattern | Automation Type | Suggested Name |
|---------|-----------------|----------------|
| "Create PR with description" | Slash command | `/create-pr` |
| "Summarize changes for commit" | Slash command | `/commit-msg` |
| "Check CI status" | Slash command | `/ci-status` |

---

## Progressive Automation

The journey from manual to automated:

```
Level 0: Manual
└── Developer types full prompt every time

Level 1: Documented
└── Prompt saved in project memory / AGENTS.md
└── Developer copies and pastes

Level 2: Slash Command
└── Developer types /command-name
└── Prompt runs automatically

Level 3: Hook
└── Action runs automatically on trigger
└── No developer intervention needed

Level 4: Sub-Agent
└── Complex workflow runs autonomously
└── Developer reviews results
```

**AI tools should help developers progress through these levels.**

---

## For Developers: Recognizing Patterns

Ask yourself (or let your AI tool detect):

1. **"I keep typing this..."** → Slash command
2. **"I always do these steps together..."** → Sub-agent or script
3. **"I always forget to check X before Y..."** → Hook
4. **"I wish the AI would just know to..."** → Add to AI-AGENT-GUIDE.md

---

## Suggesting Automation (AI Tool Behavior)

When AI detects a pattern, it should:

1. **Acknowledge the pattern:**
   > "I notice we've done this 3 times now..."

2. **Suggest specific automation:**
   > "Want me to help create a slash command for this?"

3. **Provide implementation:**
   > "Here's the command file to create: [contents]"

4. **Offer to create it:**
   > "Want me to create this file now?"

5. **Document in project memory:**
   > "I'll add this to docs/automation-patterns.md for reference."

**The developer just confirms. AI does the work.**

---

## Maintaining This File

This file can track automation opportunities identified but not yet implemented:

### Identified Patterns (Not Yet Automated)

| Pattern | Type | Priority | Notes |
|---------|------|----------|-------|
| Example: "run tests and fix" | Slash cmd | High | Used 5x this week |

### Implemented Automations

| Automation | Type | Location | Created |
|------------|------|----------|---------|
| Example: /test-fix | Slash cmd | .claude/commands/test-fix.md | 2025-12-01 |

---

## Key Principle

**Automation should emerge from actual usage patterns, not speculation.**

Don't pre-create automations. Let the AI detect what's actually repeated, then suggest automating it. This ensures automations are useful and used.
