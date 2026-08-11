# Install in Claude Code

Claude Code discovers skills by scanning its skills directories for folders containing a `SKILL.md`.

## Personal — available in every project

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git
mkdir -p ~/.claude/skills
cp -r perfect-arabic/skills/perfect-arabic ~/.claude/skills/perfect-arabic
```

## Project-scoped — checked in with the repository

```bash
mkdir -p .claude/skills
cp -r /path/to/perfect-arabic/skills/perfect-arabic .claude/skills/perfect-arabic
```

Keep the folder named `perfect-arabic` so it matches the `name` in the frontmatter.

## Verify

```bash
ls ~/.claude/skills/perfect-arabic
# SKILL.md  agents  references
```

Start a new session, then ask for a check:

```
دقّق هذا النص نحوياً وفق النحو الوافي:

إنَّ الطالبُ مجتهدٌ، وجاء محمدٌ راكبٌ.
```

The `description` in `SKILL.md` triggers on Arabic proofreading requests in either language. `/perfect-arabic` invokes it directly.

## About `agents/openai.yaml`

That file carries UI metadata for OpenAI surfaces. Claude Code ignores it. It stays in the folder so one directory installs everywhere.

## Updating

```bash
cd perfect-arabic && git pull
cp -r skills/perfect-arabic ~/.claude/skills/
```
