# Perfect Arabic — Claude Code Skill

Arabic grammar checker for Claude Code, grounded in **كتاب النحو الوافي** by **عباس حسن**.

This folder is a self-contained Claude Code skill. The `SKILL.md` file at the root of this folder is the skill manifest; the four files under `references/` are loaded on demand when a check requires them.

## Install

Clone just this folder into your Claude Code skills directory. A simple way:

```bash
# 1. Clone the repo anywhere
git clone https://github.com/alialsaudi/perfect-arabic.git

# 2. Copy the skill folder into your Claude Code skills directory
# User-wide:
cp -r perfect-arabic/claude-skill ~/.claude/skills/perfect-arabic

# Or project-scoped (inside a specific project):
cp -r perfect-arabic/claude-skill .claude/skills/perfect-arabic
```

After that, Claude Code will auto-discover the skill by reading `SKILL.md`. No build step, no dependencies.

### Verifying the install

Your skill directory should look like this:

```
~/.claude/skills/perfect-arabic/
├── SKILL.md
└── references/
    ├── 01-foundations.md
    ├── 02-verbs-objects.md
    ├── 03-derivatives-dependents.md
    └── 04-morphology-special.md
```

## Using it

In Claude Code, ask any of:

- «دقّق هذا النص: …»
- «راجع الفقرة التالية نحوياً»
- «هل يصح أن نقول …؟»
- «ما حكم المستثنى بعد "إلا" في الجملة المنفية؟»
- «أعرب الجملة التالية»

The skill auto-triggers on these patterns via the `description` field in `SKILL.md`.

## Scope

**For:** فصحى grammar and morphology (نحو وصرف) — agreement, case, mood, word forms, numerals, vocative, exception, and the other 177 مسائل covered by the source book.

**Not for:** dialect (عامية), rhetoric (بلاغة), stylistic rewriting, translation, Arabizi conversion, or tajwīd rules.

## Attribution

All grammatical rules are extracted from *النحو الوافي* (4 volumes) by عباس حسن. This skill is a reference tool and is not a substitute for the original book.

Source: [shamela.ws/book/10641](https://shamela.ws/book/10641)
