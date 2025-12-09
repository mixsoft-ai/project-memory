#!/bin/bash
# Initialize Project Memory in a project

set -e

# Get target directory
TARGET="${1:-.}"

# Resolve to absolute path
TARGET=$(cd "$TARGET" && pwd)

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../template"

echo "Initializing Project Memory in: $TARGET"

# Create directory structure
mkdir -p "$TARGET/docs/decisions"
mkdir -p "$TARGET/docs/failures"
mkdir -p "$TARGET/docs/data-quirks"
mkdir -p "$TARGET/docs/database"
mkdir -p "$TARGET/docs/integrations"
mkdir -p "$TARGET/docs/reference"
mkdir -p "$TARGET/docs/session-logs"
mkdir -p "$TARGET/docs/workflow"

# Copy template files
cp "$TEMPLATE_DIR/AI-AGENT-GUIDE.md" "$TARGET/" 2>/dev/null || true
cp "$TEMPLATE_DIR/docs/decisions/000-template.md" "$TARGET/docs/decisions/" 2>/dev/null || true
cp "$TEMPLATE_DIR/docs/workflow/project-memory.md" "$TARGET/docs/workflow/" 2>/dev/null || true
cp "$TEMPLATE_DIR/docs/workflow/prompt-patterns.md" "$TARGET/docs/workflow/" 2>/dev/null || true

# Create .gitkeep files for empty directories
touch "$TARGET/docs/failures/.gitkeep"
touch "$TARGET/docs/data-quirks/.gitkeep"
touch "$TARGET/docs/database/.gitkeep"
touch "$TARGET/docs/integrations/.gitkeep"
touch "$TARGET/docs/reference/.gitkeep"
touch "$TARGET/docs/session-logs/.gitkeep"

echo ""
echo "Project Memory initialized!"
echo ""
echo "Created structure:"
echo "  $TARGET/"
echo "  ├── AI-AGENT-GUIDE.md"
echo "  └── docs/"
echo "      ├── decisions/"
echo "      ├── failures/"
echo "      ├── data-quirks/"
echo "      ├── database/"
echo "      ├── integrations/"
echo "      ├── reference/"
echo "      ├── session-logs/"
echo "      └── workflow/"
echo ""
echo "Next steps:"
echo "  1. Edit AI-AGENT-GUIDE.md for your project"
echo "  2. Start documenting decisions, failures, and quirks"
echo "  3. See docs/workflow/project-memory.md for full guide"
