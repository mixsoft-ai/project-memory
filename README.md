# Project Memory

**Your project's long-term memory - automated by AI, confirmed by developers.**

> *AI drafts. You confirm. Knowledge compounds.*

## What Is This?

Project Memory is a documentation system designed for AI-assisted development. It captures:

- **Decisions** - Why approach A over B
- **Failures** - Mistakes and lessons learned
- **Quirks** - Non-obvious behaviors discovered
- **Context** - Background knowledge for effective work
- **Patterns** - Repeated prompts/workflows to automate

### The Key Insight

Developers won't write documentation manually. But they'll click "confirm" on an AI-drafted doc.

**AI detects → AI drafts → Developer confirms → Knowledge compounds**

## Quick Start

```bash
# Clone and copy to your project
git clone https://github.com/mixsoft-ai/project-memory.git
cp -r project-memory/template/* your-project/

# Or use the init script
./project-memory/scripts/init.sh /path/to/your-project
```

See [docs/getting-started.md](docs/getting-started.md) for full setup.

## How It Works

```
┌─────────────────────────────────────────────────────────┐
│                   SESSION START                         │
├─────────────────────────────────────────────────────────┤
│  AI reads project memory for context                    │
│  AI reads recent session logs                           │
│  AI reports relevant findings before coding             │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    DURING CODING                        │
├─────────────────────────────────────────────────────────┤
│  AI detects documentation triggers:                     │
│  - Decision made? → Draft ADR                           │
│  - Mistake/failure? → Draft failure log                 │
│  - Quirk found? → Draft data quirk doc                  │
│                                                         │
│  AI asks: "Want me to save this to project memory?"     │
│  Developer: Confirms, edits, or skips                   │
└─────────────────────────────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────┐
│                    SESSION END                          │
├─────────────────────────────────────────────────────────┤
│  AI offers to:                                          │
│  - Update prompt patterns with today's repeated prompts │
│  - Create session log for future context                │
└─────────────────────────────────────────────────────────┘
```

## Tool-Agnostic Design

Project Memory works with ANY AI coding tool:

| Tool | Integration |
|------|-------------|
| Claude Code | [project-memory-plugin](https://github.com/mixsoft-ai/project-memory-plugin) |
| Cursor | `.cursorrules` + docs/ |
| GitHub Copilot | AGENTS.md + docs/ |
| Windsurf | AGENTS.md + docs/ |
| Any AI tool | AI-AGENT-GUIDE.md + docs/ |

The actual knowledge lives in `docs/` - tool configs just teach the AI how to use it.

## Directory Structure

```
your-project/
├── AI-AGENT-GUIDE.md           # Instructions for AI tools
├── ARCHITECTURE.md             # Code organization (optional)
│
└── docs/
    ├── decisions/              # ADRs - architectural decisions
    ├── failures/               # Past mistakes and lessons
    ├── data-quirks/            # Non-obvious data behaviors
    ├── database/               # Schema documentation
    ├── integrations/           # External API docs
    ├── reference/              # Config reference
    ├── session-logs/           # Daily session summaries
    │
    └── workflow/               # Project Memory system files
        ├── project-memory.md
        ├── prompt-patterns.md
        └── automation-patterns.md
```

## Key Principles

1. **AI drafts, developer confirms** - Minimal effort for developer
2. **Proactive detection** - AI offers to document at the right moment
3. **Tool-agnostic** - Works with any AI coding tool
4. **Search before coding** - AI checks project memory automatically
5. **Cross-session tracking** - Pattern tracking persists between sessions
6. **Progressive automation** - Repeated patterns become automations

## Documentation

| Doc | Purpose |
|-----|---------|
| [Getting Started](docs/getting-started.md) | Setup instructions |
| [Project Memory Guide](docs/workflow/project-memory.md) | Full system guide |
| [AI Agent Guide Template](docs/ai-agent-guide-template.md) | Template for AI tools |
| [Architecture Generator](docs/workflow/architecture-guide-generator.md) | Create ARCHITECTURE.md |
| [Automation Patterns](docs/workflow/automation-patterns.md) | Detect and automate |

## Claude Code Users

For enhanced automation (slash commands, skills, hooks), install the companion plugin:

```bash
/plugin install project-memory@mixsoft
```

See [project-memory-plugin](https://github.com/mixsoft-ai/project-memory-plugin).

## Contributing

Contributions welcome! Areas of interest:
- Tool-specific integrations (Cursor, Copilot, etc.)
- Additional templates
- Automation improvements
- Documentation

## License

MIT
