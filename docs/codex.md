# Install in Codex

Codex discovers skills by scanning `$CODEX_HOME/skills` for any directory containing a `SKILL.md`. `$CODEX_HOME` defaults to `~/.codex`.

## Personal — available in every project

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git
mkdir -p ~/.codex/skills
cp -r perfect-arabic/skills/perfect-arabic ~/.codex/skills/perfect-arabic
```

## Project-scoped — checked in with the repository

```bash
mkdir -p .codex/skills
cp -r /path/to/perfect-arabic/skills/perfect-arabic .codex/skills/perfect-arabic
```

Either way, the folder name must stay `perfect-arabic`, matching the `name` field in the frontmatter.

## Restart, then verify

Codex reads skill metadata at session start, so start a new session after copying.

```bash
ls ~/.codex/skills
head -4 ~/.codex/skills/perfect-arabic/SKILL.md
```

Inside Codex, `/skills` lists what it has loaded.

## Invoking it

Type `$perfect-arabic` to call the skill explicitly:

```
$perfect-arabic دقّق هذه الفقرة نحوياً واذكر القاعدة في كل تصويب:

قال فاطمة لصديقتها إنها متعبة، واشتريت ثلاث كتب.
```

Codex also triggers it on its own when a request matches the `description` — pasting Arabic text with «صحّح» or «راجع» is usually enough. `$` is the reliable path when it doesn't.

## The UI metadata file

`agents/openai.yaml` sets the display name, the one-line blurb, and the default prompt shown in the Codex surface inside the ChatGPT desktop app. Codex CLI ignores it; nothing breaks if you delete it.

## Updating

```bash
cd perfect-arabic && git pull
cp -r skills/perfect-arabic ~/.codex/skills/
```

Then restart Codex so it re-reads the metadata.
