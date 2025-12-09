# Project Memory

**Your project's long-term memory - automated by AI, confirmed by developers.**

> *AI drafts. You confirm. Knowledge compounds.*

See the full guide at: https://github.com/mixsoft/project-memory

## Quick Reference

### For AI Tools

1. **Session start:** Read prompt-patterns.md and recent session logs
2. **During coding:** Search docs/ before guessing, offer to document triggers
3. **Session end:** Offer to update tracking files

### Documentation Triggers

| Trigger | Location |
|---------|----------|
| Decision made | `docs/decisions/` |
| Failure/mistake | `docs/failures/` |
| Data quirk | `docs/data-quirks/` |
| Schema learned | `docs/database/` |
| Integration | `docs/integrations/` |

### Directory Structure

```
docs/
├── decisions/        # ADRs
├── failures/         # Lessons learned
├── data-quirks/      # Non-obvious behaviors
├── database/         # Schema docs
├── integrations/     # External APIs
├── reference/        # Config docs
├── session-logs/     # Session summaries
└── workflow/         # System guides
```
