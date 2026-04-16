# Setting Up ECC on Another Machine

**Goal:** Replicate the full Everything Claude Code installation from this repo to another computer.

**Time:** ~5 minutes (mostly automated)

---

## Prerequisites

Before starting, ensure the other machine has:

- [ ] Node.js ≥18 installed (`node --version`)
- [ ] npm, pnpm, yarn, or bun available
- [ ] Git installed
- [ ] Claude Code installed and running (`claude`)
- [ ] ~500MB free disk space for installation

---

## Step 1: Get the Repository

Clone or copy the everything-claude-code repository to the target machine:

```bash
# Clone from GitHub (if public)
git clone https://github.com/affaan-m/everything-claude-code.git
cd everything-claude-code

# OR copy files from this machine via USB/cloud/network
# Then navigate to the directory
cd /path/to/everything-claude-code
```

---

## Step 2: Run Automated Installation

Use the provided installation script for a one-command setup:

```bash
bash install-ecc-full.sh
```

**What this script does:**
- ✓ Verifies the repo structure
- ✓ Confirms you want to proceed
- ✓ Runs `install.sh --target claude --profile full`
- ✓ Shows post-installation next steps

**Alternative (manual):**
```bash
bash install.sh --target claude --profile full
```

**Installation takes:** ~30 seconds

---

## Step 3: Verify Installation

After the script completes, verify everything installed:

```bash
# Count agents (should be ~48)
find ~/.claude/agents -maxdepth 1 -type f -name "*.md" | wc -l

# Count skills (should be ~150+)
ls -d ~/.claude/skills/*/ | wc -l

# Count rules (should be ~89)
find ~/.claude/rules -type f -name "*.md" | wc -l

# List a few skills to confirm
ls ~/.claude/skills/ | head -20
```

---

## Step 4: Test Installation

Open Claude Code and try these commands:

```
/plan              # Implementation planning
/tdd               # Test-driven development
/code-review       # Quality review
/build-fix         # Build error resolution
/learn             # Extract patterns
```

All commands should work without errors.

---

## Step 5: Optional - Install Language Rules

If the other machine's projects use specific languages, install language-specific rules:

```bash
# For TypeScript/JavaScript projects
bash install.sh --target claude typescript

# For Python projects
bash install.sh --target claude python

# For Rust projects
bash install.sh --target claude rust

# For Go projects
bash install.sh --target claude golang

# For multiple languages at once
bash install.sh --target claude typescript python rust golang
```

Each language adds ~15-20 additional rule files with language-specific patterns.

---

## Step 6: Sync User Rules (Optional)

If you have custom rules or settings from this machine, copy them:

```bash
# Copy custom rules from this machine
scp -r ~/.claude/rules/custom/* user@target:~/.claude/rules/custom/

# Or if using a shared location, sync from cloud storage
# (adjust path as needed)
```

---

## Troubleshooting

### Installation fails with permission error

**Solution:** Ensure you have write access to home directory
```bash
mkdir -p ~/.claude
chmod 755 ~/.claude
```

### "install.sh not found"

**Solution:** Make sure you're in the repo root directory
```bash
cd /path/to/everything-claude-code
ls install.sh  # Should exist
```

### Skills directory is empty

**Solution:** Skills install as subdirectories, not files. Verify:
```bash
ls ~/.claude/skills/
# Should list: agent-harness-construction, agentic-engineering, etc.
```

### Claude Code doesn't recognize new skills

**Solution:** Restart Claude Code
```bash
# Close Claude Code completely
# Reopen it
claude
```

---

## Installation Profiles Comparison

| Profile | Size | Use Case |
|---------|------|----------|
| **core** | ~20 files | Minimal setup, new users |
| **developer** | ~200 files | App development across languages |
| **security** | ~150 files | Security-critical projects |
| **research** | ~180 files | Research, content, publishing |
| **full** | ~600 files | Complete toolkit (recommended) |

We're using **full** which includes everything.

---

## What Gets Installed (Full Profile)

```
~/.claude/
├── agents/                    # 48 specialized agents
│   ├── planner.md
│   ├── code-reviewer.md
│   ├── tdd-guide.md
│   └── ... (45 more)
│
├── skills/                    # 150+ knowledge modules
│   ├── python-patterns/
│   ├── rust-testing/
│   ├── docker-patterns/
│   └── ... (147 more)
│
├── rules/                     # 89 rule files
│   ├── common/
│   │   ├── coding-style.md
│   │   ├── security.md
│   │   └── ... (common standards)
│   ├── typescript/
│   ├── python/
│   └── ... (language-specific rules)
│
├── commands/                  # Full CLI command set
├── hooks/                     # Automation triggers
├── mcp-configs/              # External integrations
└── settings.json             # User preferences
```

---

## Machine Comparison

After installation on both machines, verify parity:

```bash
# On both machines, run this to create a manifest:
echo "=== Agents ===" && find ~/.claude/agents -maxdepth 1 -type f -name "*.md" | wc -l
echo "=== Skills ===" && ls -d ~/.claude/skills/*/ | wc -l
echo "=== Rules ===" && find ~/.claude/rules -type f -name "*.md" | wc -l
```

**Expected output on both machines:**
```
=== Agents ===
48
=== Skills ===
150
=== Rules ===
89
```

---

## Rollback/Uninstall

If you need to remove the installation on the target machine:

```bash
# Full removal (removes all Claude Code config)
rm -rf ~/.claude

# Selective removal (keeps other Claude Code config)
rm -rf ~/.claude/agents
rm -rf ~/.claude/skills
rm -rf ~/.claude/rules
rm -rf ~/.claude/commands
rm -rf ~/.claude/hooks
```

---

## Keeping Both Machines in Sync

### Option 1: Git-based (Recommended)

Store your custom rules, skills, and settings in git:

```bash
# On both machines, periodically sync
cd /path/to/everything-claude-code
git pull  # Get latest components
git push  # Share your custom rules (if in repo)
```

### Option 2: Cloud Storage

Sync the .claude directory via cloud storage:

```bash
# Use Dropbox, OneDrive, Google Drive, etc.
# Symlink ~/.claude to cloud storage
ln -s /path/to/cloud/storage/.claude ~/.claude
```

### Option 3: Manual Sync

Copy specific directories after updates:

```bash
# After updating on machine A, copy to machine B
scp -r ~/.claude/skills/learned/* user@machineB:~/.claude/skills/learned/
scp ~/.claude/settings.json user@machineB:~/.claude/
```

---

## Next Steps After Installation

1. **Explore skills:** Browse `~/.claude/skills/` to see available patterns
2. **Review rules:** Check `~/.claude/rules/` for coding standards
3. **Configure settings:** Customize `~/.claude/settings.json` as needed
4. **Test workflows:** Try `/tdd`, `/plan`, `/code-review` on a test project
5. **Create custom skills:** Use `/skill-create` to generate skills from your code

---

## Support & Documentation

- **Full guide:** See [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md)
- **Installation results:** See [INSTALLATION_COMPLETE.md](INSTALLATION_COMPLETE.md)
- **Component inventory:** See [MISSING_COMPONENTS.md](MISSING_COMPONENTS.md)
- **Project docs:** See [CLAUDE.md](CLAUDE.md) and [README.md](README.md)

---

**Ready to replicate? Run:**
```bash
bash install-ecc-full.sh
```
