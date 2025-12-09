# Prompt Patterns

Track repeated prompts and commands across sessions to identify automation opportunities.

**AI Tools:** Update this file when you notice repeated patterns. Read it at session start.

---

## Tracked Patterns

| Pattern | Count | Last Used | Sessions | Status |
|---------|-------|-----------|----------|--------|
| | | | | |

## How to Use This File

### At Session Start

AI tools should:
1. Read this file
2. Note patterns approaching threshold (count >= 3)
3. Be ready to suggest automation when threshold hit

### During Session

AI tools should mentally track:
- Repeated prompts from developer
- Repeated workflows
- Repeated context lookups

### At Session End

AI tools should offer:
```
Want me to update the prompt patterns file with what we repeated today?
```

If developer agrees, add/update rows in the table above.

### When Pattern Count >= 3

AI tools should:
```
I notice "[pattern]" has been used [count] times across [sessions] sessions.
Want me to help create a [slash command / sub-agent / hook] for this?
```

If developer agrees:
1. Create the automation (see automation-patterns.md)
2. Update Status column to "Automated"
3. Note where automation was created

---

## Pattern Categories

### Prompts to Automate

Patterns that should become slash commands:

| Pattern | Count | Suggested Command |
|---------|-------|-------------------|
| | | |

### Workflows to Automate

Multi-step patterns that should become sub-agents:

| Workflow | Count | Suggested Agent |
|----------|-------|-----------------|
| | | |

### Context to Auto-Inject

Patterns that should become hooks:

| Context Need | Count | Suggested Hook |
|--------------|-------|----------------|
| | | |

---

## Resolved Patterns

Patterns that have been automated or documented:

| Pattern | Resolution | Location |
|---------|------------|----------|
| | | |

---

## Notes

- Threshold for automation suggestion: 3+ occurrences
- Cross-session tracking requires AI to read this file at session start
- Developer can manually add patterns they notice
- AI should ask before updating this file
