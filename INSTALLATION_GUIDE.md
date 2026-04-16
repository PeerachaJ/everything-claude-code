# ECC Full Installation Guide

**Purpose:** Quick reference for installing Everything Claude Code (full profile) on any machine.

**Quickstart:**
```bash
cd /path/to/everything-claude-code
bash install.sh --target claude --profile full
```

---

## What Gets Installed

| Component | Count | Location |
|-----------|-------|----------|
| Agents | 48 | `~/.claude/agents/` |
| Skills | 150+ | `~/.claude/skills/` |
| Rules | 89 files | `~/.claude/rules/` |
| Commands | Full set | `~/.claude/commands/` |
| Hooks | Runtime | `~/.claude/hooks/` |
| MCP Configs | Integrations | `~/.claude/mcp-configs/` |

---

## Installation Methods

### Method 1: Full Profile (Recommended)

Installs all 20 core modules at once:

```bash
bash install.sh --target claude --profile full
```

**Modules installed:**
- rules-core, agents-core, commands-core
- hooks-runtime, platform-configs
- framework-language, database, workflow-quality
- security, research-apis, business-content
- operator-workflows, social-distribution, media-generation
- orchestration, swift-apple, agentic-patterns
- devops-infra, supply-chain-domain, document-processing

**Time:** ~30 seconds  
**Result:** 609 files installed to `~/.claude/`

---

### Method 2: Selective Profile

Install only what you need:

```bash
# Just the essentials
bash install.sh --target claude --profile core

# Developer-focused setup
bash install.sh --target claude --profile developer

# Security-heavy setup
bash install.sh --target claude --profile security

# Research/content setup
bash install.sh --target claude --profile research
```

---

### Method 3: Language-Specific

Install language-specific rules only:

```bash
bash install.sh --target claude typescript python rust golang
```

**Note:** This skips agents/skills/commands. Use Method 1 for full setup.

---

## Verification

After installation, verify everything is in place:

```bash
# Count agents
find ~/.claude/agents -maxdepth 1 -type f -name "*.md" | wc -l
# Expected: ~48

# Count skills (skills are directories)
ls -d ~/.claude/skills/*/ | wc -l
# Expected: ~150+

# Count rules
find ~/.claude/rules -type f -name "*.md" | wc -l
# Expected: ~89

# List available skills
ls ~/.claude/skills/
```

---

## Troubleshooting

### Error: "No install profile, module IDs..."

**Cause:** Missing profile or module specification  
**Fix:** Use `--profile full` or provide explicit modules
```bash
bash install.sh --target claude --profile full
```

### Installation seems stuck

**Check:** Run with `--dry-run` first to see the plan
```bash
bash install.sh --target claude --profile full --dry-run
```

### Some agents/skills missing

**Verify:** Check the installation state file
```bash
cat ~/.claude/ecc/install-state.json
```

### Need to reinstall

**Safe reset:** Backup and clear before reinstalling
```bash
mv ~/.claude ~/.claude.backup
bash install.sh --target claude --profile full
```

---

## What Each Profile Does

### core
Minimal harness baseline:
- Core rules, agents, commands
- Runtime hooks and platform configs
- Quality workflow support

**Use when:** Setting up a minimal Claude Code environment

### developer
Default for app development:
- Everything in `core`
- Framework-language rules (TypeScript, Python, Go, Rust, etc.)
- Database patterns and configs
- Orchestration support

**Use when:** Building apps across multiple languages

### security
Security-focused setup:
- Everything in `core`
- Security rules and guidelines
- Healthcare compliance, DeFi patterns
- Security scanning and auditing

**Use when:** Working on security-critical systems

### research
Content and research focused:
- Everything in `core`
- Research APIs and integrations
- Business content patterns
- Social distribution workflows

**Use when:** Research, content creation, publishing

### full
Complete install (recommended):
- All 20 modules
- Everything from all other profiles
- Maximum capability set

**Use when:** Setting up a complete development toolkit

---

## Post-Installation Setup

After installation completes, these steps are optional but recommended:

### 1. Review Installed Skills

```bash
ls ~/.claude/skills/
```

Browse the skill directories to understand available patterns and knowledge.

### 2. Configure Claude Code Settings

```bash
# View current settings
cat ~/.claude/settings.json | head -50

# Configure via CLI
claude config --help
```

### 3. Test Key Commands

Try these in Claude Code:
- `/tdd` — Test-driven development workflow
- `/plan` — Implementation planning
- `/code-review` — Quality review
- `/build-fix` — Build error resolution
- `/learn` — Extract patterns from sessions
- `/skill-create` — Generate new skills

### 4. Install Language Rules (Optional)

If your project uses specific languages:

```bash
bash install.sh --target claude typescript
bash install.sh --target claude python
bash install.sh --target claude rust
# ... for other languages
```

---

## Installation Locations

| Component | Path | Type |
|-----------|------|------|
| Home directory | `~/.claude/` | User config |
| Agents | `~/.claude/agents/` | Markdown files |
| Skills | `~/.claude/skills/` | Directories |
| Rules | `~/.claude/rules/` | Markdown files |
| Commands | `~/.claude/commands/` | Markdown files |
| Hooks | `~/.claude/hooks/` | JSON + scripts |
| MCP Configs | `~/.claude/mcp-configs/` | JSON configs |
| Install state | `~/.claude/ecc/install-state.json` | Metadata |

---

## Uninstallation

To remove ECC completely:

```bash
rm -rf ~/.claude
```

**Warning:** This removes all Claude Code configuration, not just ECC.

To preserve other Claude Code config, selectively remove:
```bash
rm -rf ~/.claude/agents
rm -rf ~/.claude/skills
rm -rf ~/.claude/rules
rm -rf ~/.claude/commands
rm -rf ~/.claude/hooks
```

---

## Advanced: Dry Run & JSON Output

### See the installation plan without installing:

```bash
bash install.sh --target claude --profile full --dry-run
```

### Get machine-readable output:

```bash
bash install.sh --target claude --profile full --json
```

This outputs the installation plan in JSON format for scripting or auditing.

---

## Support

For issues or questions:
- Check [MISSING_COMPONENTS.md](MISSING_COMPONENTS.md) for component inventory
- Review [INSTALLATION_COMPLETE.md](INSTALLATION_COMPLETE.md) for what was actually installed
- See CLAUDE.md in the repo for project architecture
