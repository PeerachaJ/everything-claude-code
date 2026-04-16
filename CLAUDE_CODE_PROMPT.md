# Claude Code Prompt for ECC Installation

**Purpose:** Copy-paste this prompt into Claude Code to automatically set up Everything Claude Code on another machine.

**Prerequisites before using this prompt:**
- [ ] Clone the repo: `git clone https://github.com/PeerachaJ/everything-claude-code`
- [ ] Navigate to repo: `cd everything-claude-code`
- [ ] Node.js ≥18 installed
- [ ] Claude Code open and ready

---

## Copy-Paste This Prompt into Claude Code

```
Follow the step-by-step instructions in SETUP_ANOTHER_MACHINE.md 
to install the full Everything Claude Code profile to ~/.claude/ on this machine.

Start from "Step 1: Get the Repository" and complete all steps through "Step 4: Test Installation".
```

---

## OR Use This Shorter Version

```
I've cloned the everything-claude-code repo to this machine.
Follow SETUP_ANOTHER_MACHINE.md to complete the full ECC installation to ~/.claude/.
```

---

## OR Use This Fastest Version (Script-Based)

```
Run install-ecc-full.sh to set up the full Everything Claude Code installation on this machine.
```

---

## Which Version to Use?

| Version | Best For | Length |
|---------|----------|--------|
| **Full** | First time, want detailed guidance | Longer |
| **Shorter** | Second time, familiar with process | Medium |
| **Fastest** | Experienced, just run the script | Short |

---

## What Claude Code Will Do

When you paste the prompt above, Claude Code will:

1. ✅ Read SETUP_ANOTHER_MACHINE.md
2. ✅ Help you verify prerequisites
3. ✅ Guide you through cloning the repo (if needed)
4. ✅ Run the installation script
5. ✅ Verify everything installed correctly
6. ✅ Show you how to test the installation

---

## Expected Result

After following the prompt:
- ✅ 48 agents installed to `~/.claude/agents/`
- ✅ 150+ skills installed to `~/.claude/skills/`
- ✅ 89 rules installed to `~/.claude/rules/`
- ✅ All CLI commands working (`/tdd`, `/plan`, `/code-review`, etc.)
- ✅ Ready to use Everything Claude Code

---

## Troubleshooting

If Claude Code asks for clarification:

**If it asks about prerequisites:**
Make sure you have Node.js ≥18 installed:
```bash
node --version
```

**If it asks about the repo:**
Make sure you've cloned it:
```bash
git clone https://github.com/PeerachaJ/everything-claude-code
cd everything-claude-code
```

**If installation seems stuck:**
Tell Claude Code: "Run install-ecc-full.sh with --dry-run to see the plan first"

---

## Quick Reference

**What you'll see during installation:**
```
✓ Verifies repo structure
✓ Confirms you want to proceed
✓ Installs 609+ files
✓ Takes ~30 seconds
✓ Shows verification commands
✓ Lists next steps
```

**Then verify with:**
```bash
# Check agents (should be 48)
find ~/.claude/agents -maxdepth 1 -type f -name "*.md" | wc -l

# Check skills (should be 150+)
ls -d ~/.claude/skills/*/ | wc -l
```

**Then test with:**
```
/tdd
/plan
/code-review
```

---

## Files Referenced in This Prompt

- **SETUP_ANOTHER_MACHINE.md** — Complete step-by-step guide
- **install-ecc-full.sh** — Automated installation script
- **README_INSTALLATION.md** — Overview and documentation index

---

**Ready? Open Claude Code and paste the prompt above!** ✨
