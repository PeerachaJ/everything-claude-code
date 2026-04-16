# Quick Install Reference

**One-command installation of Everything Claude Code (full profile)**

---

## For This Machine (Already Done ✓)

```bash
# Verify what's installed
find ~/.claude/agents -maxdepth 1 -type f -name "*.md" | wc -l      # 48 agents
ls -d ~/.claude/skills/*/ | wc -l                                    # 150+ skills
find ~/.claude/rules -type f -name "*.md" | wc -l                   # 89 rules
```

---

## For Another Machine

### Fastest Way

```bash
cd /path/to/everything-claude-code
bash install-ecc-full.sh
```

### Manual Way

```bash
cd /path/to/everything-claude-code
bash install.sh --target claude --profile full
```

**Installation takes:** ~30 seconds  
**Installs to:** `~/.claude/`

---

## Verification

After installation:

```bash
# Test commands in Claude Code
/tdd              # Test-driven development
/plan             # Planning
/code-review      # Code quality review
/build-fix        # Build error resolution
```

---

## Available Profiles

```bash
# Full (recommended) - everything
bash install.sh --target claude --profile full

# Developer-focused
bash install.sh --target claude --profile developer

# Security-heavy
bash install.sh --target claude --profile security

# Research/content
bash install.sh --target claude --profile research

# Minimal setup
bash install.sh --target claude --profile core
```

---

## Add Language Rules

```bash
bash install.sh --target claude typescript python rust golang
```

---

## Troubleshooting

| Issue | Fix |
|-------|-----|
| "No install profile" error | Use `--profile full` flag |
| Skills not visible | Restart Claude Code |
| Permission denied | `mkdir -p ~/.claude && chmod 755 ~/.claude` |
| Not in repo root | `cd /path/to/everything-claude-code` |

---

## Documentation

- **Full guide:** [INSTALLATION_GUIDE.md](INSTALLATION_GUIDE.md)
- **Setup another machine:** [SETUP_ANOTHER_MACHINE.md](SETUP_ANOTHER_MACHINE.md)
- **What's installed:** [INSTALLATION_COMPLETE.md](INSTALLATION_COMPLETE.md)

---

**Current Installation Status:**
- ✅ 48 agents installed
- ✅ 150+ skills installed
- ✅ 89 rules installed
- ✅ Full profile ready to use
