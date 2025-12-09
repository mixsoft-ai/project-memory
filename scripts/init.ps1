# Initialize Project Memory in a project

param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"

# Resolve to absolute path
$Target = (Resolve-Path $Target).Path

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$TemplateDir = Join-Path $ScriptDir "..\template"

Write-Host "Initializing Project Memory in: $Target"

# Create directory structure
$dirs = @(
    "docs\decisions",
    "docs\failures",
    "docs\data-quirks",
    "docs\database",
    "docs\integrations",
    "docs\reference",
    "docs\session-logs",
    "docs\workflow"
)

foreach ($dir in $dirs) {
    $path = Join-Path $Target $dir
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

# Copy template files
$filesToCopy = @(
    @{ Source = "AI-AGENT-GUIDE.md"; Dest = "" },
    @{ Source = "docs\decisions\000-template.md"; Dest = "docs\decisions\" },
    @{ Source = "docs\workflow\project-memory.md"; Dest = "docs\workflow\" },
    @{ Source = "docs\workflow\prompt-patterns.md"; Dest = "docs\workflow\" }
)

foreach ($file in $filesToCopy) {
    $sourcePath = Join-Path $TemplateDir $file.Source
    $destPath = Join-Path $Target $file.Dest
    if (Test-Path $sourcePath) {
        Copy-Item $sourcePath $destPath -Force
    }
}

# Create .gitkeep files for empty directories
$gitkeepDirs = @(
    "docs\failures",
    "docs\data-quirks",
    "docs\database",
    "docs\integrations",
    "docs\reference",
    "docs\session-logs"
)

foreach ($dir in $gitkeepDirs) {
    $gitkeepPath = Join-Path $Target "$dir\.gitkeep"
    if (-not (Test-Path $gitkeepPath)) {
        New-Item -ItemType File -Path $gitkeepPath -Force | Out-Null
    }
}

Write-Host ""
Write-Host "Project Memory initialized!"
Write-Host ""
Write-Host "Created structure:"
Write-Host "  $Target\"
Write-Host "  ├── AI-AGENT-GUIDE.md"
Write-Host "  └── docs\"
Write-Host "      ├── decisions\"
Write-Host "      ├── failures\"
Write-Host "      ├── data-quirks\"
Write-Host "      ├── database\"
Write-Host "      ├── integrations\"
Write-Host "      ├── reference\"
Write-Host "      ├── session-logs\"
Write-Host "      └── workflow\"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Edit AI-AGENT-GUIDE.md for your project"
Write-Host "  2. Start documenting decisions, failures, and quirks"
Write-Host "  3. See docs\workflow\project-memory.md for full guide"
