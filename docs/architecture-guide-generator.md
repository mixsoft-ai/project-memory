# Architecture Guide Generator

Instructions for AI coding agents to help developers create an `ARCHITECTURE.md` file for their project.

## Purpose

This guide helps AI agents interview developers and/or analyze existing codebases to generate a comprehensive `ARCHITECTURE.md` that serves as the foundational reference for code organization and structure.

---

## CRITICAL RULES (MANDATORY)

> ⚠️ **STOP! DO NOT generate ARCHITECTURE.md in the same session you read this.**
>
> You MUST ask questions first and get developer answers before generating anything.

**DO NOT skip the questionnaire. DO NOT generate ARCHITECTURE.md without developer input.**

Even if you have:
- Project briefs with technical details
- README with context
- Existing code to analyze
- Clear patterns you can infer

**You MUST still:**
1. Ask "Quick or Thorough?" first
2. Run through the questionnaire
3. Get developer confirmation before generating

**Why?** Architecture decisions are opinionated. What you infer may not match what the developer wants. Project briefs describe *what* to build, not *how* to organize code. Only the developer knows their preferences for patterns, conventions, and structure.

**The only exception:** For existing projects with substantial code, you may analyze first, then *validate* your findings with the developer before generating. But you still ask questions—you just pre-fill suggested answers.

### Enforcement Checklist

Before generating ARCHITECTURE.md, verify:
- [ ] Asked "Quick or Thorough?"
- [ ] Completed questionnaire (Q1-Q6 minimum)
- [ ] Got developer answers (not just inferred)
- [ ] Showed draft to developer for confirmation

---

## When to Use This

AI agents should check for `ARCHITECTURE.md` when:
1. Starting work on a new project
2. Developer asks about code organization
3. Developer asks "where should I put this code?"
4. Codebase seems unfamiliar and no architecture docs exist

**If `ARCHITECTURE.md` doesn't exist**, offer to help create one using this guide.

---

## Step 1: Determine Scope

Ask the developer:

> **Quick or Thorough?**
>
> I can help create an ARCHITECTURE.md for this project. Which approach would you prefer?
>
> **Quick** (5-10 min) - Covers essentials for AI agents to understand code organization:
> - Directory structure & folder purposes
> - Architecture pattern (if any)
> - Dependency rules
> - Where to put new code
> - Naming conventions
>
> **Thorough** (15-30 min) - Comprehensive documentation for both AI and human developers:
> - Everything in Quick, plus:
> - System overview & context
> - Architecture diagram (ASCII)
> - Layer responsibilities with rationale
> - Data flow examples
> - Cross-cutting concerns (auth, logging, errors)
> - Testing strategy per layer
> - Extension points & how-to guides
> - Anti-patterns to avoid
> - Tech stack rationale
> - Service boundaries (if multi-service)
> - External dependencies & integrations

---

## Step 2: Gather Information

### For Existing Projects

Before asking questions, analyze the codebase:

**Bash (Linux/macOS):**
```bash
# Understand directory structure
ls -la
find . -type d -name "src" -o -name "lib" -o -name "app" | head -20

# Look for existing docs
cat README.md 2>/dev/null
cat CONTRIBUTING.md 2>/dev/null

# Identify tech stack
cat package.json 2>/dev/null | head -30      # Node.js
cat requirements.txt 2>/dev/null | head -20   # Python
cat go.mod 2>/dev/null | head -10             # Go
cat Cargo.toml 2>/dev/null | head -20         # Rust
cat pom.xml 2>/dev/null | head -30            # Java

# Look for architecture patterns
find . -type d -name "domain" -o -name "application" -o -name "infrastructure"  # Clean Architecture
find . -type d -name "models" -o -name "views" -o -name "controllers"           # MVC
find . -type d -name "handlers" -o -name "services" -o -name "repositories"     # Layered
```

**PowerShell (Windows):**
```powershell
# Understand directory structure
Get-ChildItem
Get-ChildItem -Directory -Recurse | Where-Object { $_.Name -in @("src", "lib", "app") } | Select-Object -First 20

# Look for existing docs
Get-Content README.md -ErrorAction SilentlyContinue
Get-Content CONTRIBUTING.md -ErrorAction SilentlyContinue

# Identify tech stack
Get-Content package.json -ErrorAction SilentlyContinue | Select-Object -First 30
Get-Content requirements.txt -ErrorAction SilentlyContinue | Select-Object -First 20
Get-Content pyproject.toml -ErrorAction SilentlyContinue | Select-Object -First 30

# Look for architecture patterns
Get-ChildItem -Directory -Recurse | Where-Object {
    $_.Name -in @("domain", "application", "infrastructure", "models", "views", "controllers", "handlers", "services", "repositories")
}
```

Then fill gaps with questions.

### For New Projects

**MANDATORY: Ask all questions from the questionnaire below.**

Do NOT:
- Generate ARCHITECTURE.md from project briefs alone
- Assume architecture patterns based on project description
- Skip questions because you think you know the answer
- Infer conventions without confirmation

Project briefs tell you *what* to build. The questionnaire captures *how* the developer wants to organize code. These are different things.

---

## Step 3: Questionnaire

### Quick Mode Questions

#### Q1: Project Type
> What type of project is this?
> - [ ] Web API / Backend service
> - [ ] CLI tool
> - [ ] Library / SDK
> - [ ] Full-stack web app
> - [ ] Mobile app
> - [ ] Desktop app
> - [ ] Data pipeline / ETL
> - [ ] Other: ___

#### Q2: Architecture Pattern
> Do you follow a specific architecture pattern?
> - [ ] Clean Architecture / Hexagonal / Ports & Adapters
> - [ ] MVC (Model-View-Controller)
> - [ ] MVVM (Model-View-ViewModel)
> - [ ] Layered / N-Tier
> - [ ] Microservices
> - [ ] Monolith (no specific pattern)
> - [ ] Event-driven
> - [ ] None / Unsure
> - [ ] Other: ___

#### Q3: Directory Structure
> Describe your main directories and their purposes, OR let me analyze the existing structure.

#### Q4: Dependency Rules
> What are the rules for what code can import/depend on what?
> Examples:
> - "Domain layer cannot import infrastructure"
> - "Controllers can only call services, not repositories directly"
> - "No circular dependencies between modules"

#### Q5: Where to Put New Code
> When adding new code, where does each type go?
> - New API endpoint: ___
> - New business logic: ___
> - New database query: ___
> - New external API integration: ___
> - New utility function: ___

#### Q6: Naming Conventions
> What naming conventions do you follow?
> - Files: (e.g., kebab-case, snake_case, PascalCase)
> - Classes/Types: ___
> - Functions: ___
> - Variables: ___
> - Database tables/columns: ___

---

### Thorough Mode Questions (Additional)

#### Q7: System Overview
> In 2-3 sentences, what does this system do? Who uses it?

#### Q8: Layer Responsibilities
> For each architectural layer, what is its responsibility and what rules govern it?

#### Q9: Data Flow
> Describe how a typical request flows through the system (e.g., HTTP request to database and back).

#### Q10: Cross-Cutting Concerns
> How are these handled?
> - Authentication/Authorization: ___
> - Logging: ___
> - Error handling: ___
> - Validation: ___
> - Configuration: ___

#### Q11: Testing Strategy
> How should each layer/component be tested?
> - Unit tests: ___
> - Integration tests: ___
> - E2E tests: ___

#### Q12: Extension Points
> How do developers add common things?
> - Add a new API endpoint: steps
> - Add a new database table: steps
> - Add a new external integration: steps
> - Add a new background job: steps

#### Q13: Anti-Patterns
> What should developers explicitly NOT do?

#### Q14: Tech Stack Rationale
> Why were key technologies chosen?
> - Language: ___
> - Framework: ___
> - Database: ___
> - Other key tools: ___

#### Q15: Service Boundaries (if multi-service)
> What are the different services/apps and their responsibilities?

#### Q16: External Dependencies
> What external systems does this integrate with?
> - Databases: ___
> - APIs: ___
> - Message queues: ___
> - Other services: ___

---

## Step 4: Generate ARCHITECTURE.md

Based on gathered information, generate the file using templates below.

### Quick Mode Template

```markdown
# Architecture

## Directory Structure

```
project-root/
├── src/                    # [Purpose]
│   ├── folder1/            # [Purpose]
│   ├── folder2/            # [Purpose]
│   └── ...
├── tests/                  # [Purpose]
└── ...
```

## Architecture Pattern

[Pattern name and brief description]

## Dependency Rules

- Rule 1
- Rule 2
- ...

## Where to Put New Code

| Type | Location |
|------|----------|
| API endpoint | `path/to/endpoints/` |
| Business logic | `path/to/logic/` |
| Database query | `path/to/queries/` |
| External integration | `path/to/integrations/` |
| Utility function | `path/to/utils/` |

## Naming Conventions

- **Files**: convention
- **Classes/Types**: convention
- **Functions**: convention
- **Variables**: convention
```

### Thorough Mode Template

```markdown
# Architecture

## System Overview

[2-3 sentence description of what the system does and who uses it]

## Architecture Pattern

[Pattern name]: [Description of the pattern and why it was chosen]

## Directory Structure

```
project-root/
├── src/                    # [Purpose]
│   ├── folder1/            # [Purpose]
│   ├── folder2/            # [Purpose]
│   └── ...
├── tests/                  # [Purpose]
└── ...
```

## Layer Responsibilities

### [Layer 1 Name]
- **Purpose**: What this layer does
- **Contains**: Types of code in this layer
- **Rules**: What this layer can/cannot do

### [Layer 2 Name]
...

## Dependency Rules

```
[ASCII diagram showing allowed dependencies]

Example:
┌─────────────┐
│   Routes    │
└──────┬──────┘
       │ can call
       ▼
┌─────────────┐
│  Use Cases  │
└──────┬──────┘
       │ can call
       ▼
┌─────────────┐
│   Domain    │
└─────────────┘
```

- Rule 1
- Rule 2

## Data Flow

### [Typical Request Type]

```
1. [Entry point] receives request
2. [Component] validates/transforms
3. [Component] executes business logic
4. [Component] persists/retrieves data
5. Response returned
```

## Where to Put New Code

| Type | Location | Notes |
|------|----------|-------|
| API endpoint | `path/` | Additional guidance |
| Business logic | `path/` | Additional guidance |
| Database query | `path/` | Additional guidance |
| External integration | `path/` | Additional guidance |
| Utility function | `path/` | Additional guidance |

## Cross-Cutting Concerns

### Authentication/Authorization
[How it's handled, where the code lives]

### Logging
[Logging strategy and implementation]

### Error Handling
[Error handling patterns]

### Validation
[Where and how validation occurs]

### Configuration
[How configuration is managed]

## Testing Strategy

### Unit Tests
- **What to test**: ...
- **Location**: `tests/unit/`
- **Mocking strategy**: ...

### Integration Tests
- **What to test**: ...
- **Location**: `tests/integration/`

### E2E Tests
- **What to test**: ...
- **Location**: `tests/e2e/`

## How to Add New...

### API Endpoint
1. Step 1
2. Step 2
3. ...

### Database Table/Model
1. Step 1
2. Step 2
3. ...

### External Integration
1. Step 1
2. Step 2
3. ...

## Anti-Patterns to Avoid

- ❌ **Don't**: [Anti-pattern description]
  - ✅ **Instead**: [Correct approach]

- ❌ **Don't**: [Anti-pattern description]
  - ✅ **Instead**: [Correct approach]

## Tech Stack

| Category | Technology | Rationale |
|----------|------------|-----------|
| Language | X | Why chosen |
| Framework | X | Why chosen |
| Database | X | Why chosen |
| ... | ... | ... |

## Service Boundaries

*(If multi-service architecture)*

| Service | Responsibility | Communication |
|---------|---------------|---------------|
| Service A | What it does | How it communicates |
| Service B | What it does | How it communicates |

## External Dependencies

| System | Purpose | Notes |
|--------|---------|-------|
| Database X | Primary data store | Connection details in config |
| API Y | [Purpose] | Rate limits, auth method |
| ... | ... | ... |
```

---

## Step 5: Validate and Refine

After generating, ask:

> I've created an ARCHITECTURE.md based on our discussion. Please review it:
>
> 1. Is anything inaccurate?
> 2. Is anything missing that would help AI agents understand how to work in this codebase?
> 3. Are the "where to put new code" guidelines clear enough?

Make adjustments based on feedback.

---

## Step 6: Suggest Next Steps

After creating ARCHITECTURE.md:

> Your ARCHITECTURE.md is ready! Suggested next steps:
>
> 1. **Add to version control** - Commit this file so all developers benefit
> 2. **Reference in AI config** - Add to CLAUDE.md, .cursorrules, etc.:
>    ```markdown
>    See [ARCHITECTURE.md](./ARCHITECTURE.md) for code organization guidelines.
>    ```
> 3. **Create initial ADR** - Document why you chose this architecture:
>    ```bash
>    cp docs/decisions/000-template.md docs/decisions/001-architecture-choice.md
>    ```
> 4. **Set up project memory** - See [project-memory.md](./project-memory.md)

---

## Tips for AI Agents

1. **Always ask first** - Never generate without developer input, even if you think you know
2. **For existing projects: infer then validate** - Analyze code, then confirm with developer
3. **For new projects: ask everything** - No code to analyze = must ask all questions
4. **Be concise** - Don't overwhelm with too many questions at once
5. **Provide examples** - When asking about conventions, show options clearly
6. **Validate assumptions** - "I see you're using Clean Architecture based on the folder structure. Is that correct?"
7. **Iterate** - Start with Quick mode, offer to expand later
8. **Keep it maintainable** - A shorter, accurate doc is better than comprehensive but outdated

### Common Mistakes to Avoid

❌ **Wrong**: "I see the project brief mentions a backend API, so I'll create ARCHITECTURE.md with a standard layered structure."

✅ **Right**: "I notice there's no ARCHITECTURE.md. Would you like me to help create one? First question: Quick or Thorough?"

❌ **Wrong**: Generating ARCHITECTURE.md silently based on inferred patterns.

✅ **Right**: "Based on the folder structure, it looks like you're using Clean Architecture. Is that correct? Let me ask a few more questions to document this properly."
