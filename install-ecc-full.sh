#!/usr/bin/env bash
# install-ecc-full.sh — Automated full ECC installation script
#
# Purpose: One-command installation of Everything Claude Code with full profile
# Usage: bash install-ecc-full.sh [--repo-path /path/to/repo]
#
# If --repo-path is not provided, assumes this script is in the repo root

set -euo pipefail

# Color output for clarity
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse arguments
REPO_PATH=""
while [[ $# -gt 0 ]]; do
    case $1 in
        --repo-path)
            REPO_PATH="$2"
            shift 2
            ;;
        --help)
            echo "Usage: bash install-ecc-full.sh [--repo-path /path/to/repo]"
            echo ""
            echo "Installs Everything Claude Code with the full profile."
            echo "Installs to ~/.claude/"
            echo ""
            echo "If --repo-path is not provided, uses current directory."
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Default to current directory if not specified
if [ -z "$REPO_PATH" ]; then
    REPO_PATH="."
fi

# Convert to absolute path
REPO_PATH="$(cd "$REPO_PATH" && pwd)"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}ECC Full Installation${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Verify repo structure
if [ ! -f "$REPO_PATH/install.sh" ]; then
    echo -e "${RED}✗ Error: install.sh not found in $REPO_PATH${NC}"
    echo "  Is this the Everything Claude Code repository root?"
    exit 1
fi

echo -e "${GREEN}✓ Found repo at: $REPO_PATH${NC}"
echo ""

# Summary
echo -e "${BLUE}Installation Plan:${NC}"
echo "  Target:      ~/.claude/"
echo "  Profile:     full"
echo "  Modules:     20 core modules"
echo "  Components:  ~48 agents, ~150+ skills, ~89 rules"
echo ""

# Confirm before proceeding
read -p "Proceed with full installation? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}✗ Installation cancelled${NC}"
    exit 1
fi

echo ""
echo -e "${BLUE}Starting installation...${NC}"
echo ""

# Run the installer
cd "$REPO_PATH"
if bash install.sh --target claude --profile full; then
    echo ""
    echo -e "${GREEN}✓ Installation completed successfully!${NC}"
    echo ""
    echo -e "${BLUE}Next Steps:${NC}"
    echo "  1. Verify installation:"
    echo "     find ~/.claude/agents -maxdepth 1 -type f -name '*.md' | wc -l"
    echo "     ls -d ~/.claude/skills/*/ | wc -l"
    echo ""
    echo "  2. Test key commands in Claude Code:"
    echo "     /tdd, /plan, /code-review, /learn, /skill-create"
    echo ""
    echo "  3. Optional: Install language-specific rules"
    echo "     bash install.sh --target claude typescript python rust golang"
    echo ""
    echo -e "${BLUE}Documentation:${NC}"
    echo "  • INSTALLATION_GUIDE.md — Full reference"
    echo "  • INSTALLATION_COMPLETE.md — Installation results"
    echo "  • MISSING_COMPONENTS.md — Available components"
    echo ""
else
    echo ""
    echo -e "${RED}✗ Installation failed${NC}"
    echo "  Check the error output above for details."
    exit 1
fi
