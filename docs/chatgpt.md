# Install in ChatGPT

This is the same skill folder Codex and Claude Code use, uploaded instead of copied. It is a real ChatGPT skill — not a Project with attached files.

## Before you start

Skills need a paid ChatGPT plan. On Business, Enterprise, Healthcare and Edu workspaces they can also be switched off by an admin, and on Enterprise and Edu they are off until someone turns them on. If **Skills** doesn't appear in your settings, that's the reason — the workspace owner enables it under organization settings, along with code execution and file creation. OpenAI's [Skills in ChatGPT](https://help.openai.com/en/articles/20001066-skills-in-chatgpt) article is the current word on plan coverage.

## 1. Build the archive

ChatGPT expects a `.zip` holding exactly one folder, and that folder must hold `SKILL.md`.

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git
cd perfect-arabic
./scripts/package.sh          # writes perfect-arabic.zip
```

The script prints the archive contents so you can confirm the shape before uploading:

```
perfect-arabic/SKILL.md
perfect-arabic/agents/openai.yaml
perfect-arabic/references/01-foundations.md
...
```

If you'd rather not run a script, zip the `skills/perfect-arabic` directory itself — or, where your ChatGPT client accepts a folder, point it straight at `skills/perfect-arabic` and skip the archive.

## 2. Upload it

In ChatGPT, open **Skills**, choose **Create → Upload from your computer**, and select `perfect-arabic.zip`. The skill lands in your personal list, enabled.

To make it available to a whole workspace instead, an organization owner uploads the same archive under organization settings → **Skills** → organization skills. Everyone in the workspace gets it, on by default, without repeating step 1.

## 3. Use it

Mention it: `@Perfect Arabic`, then paste the text.

```
@Perfect Arabic راجع هذه الفقرة، ولا تغيّر الأسلوب إلا عند وجود خطأ نحوي أو صرفي:

كان الطالبَ مجتهداً، وحضر عشرين طالبٌ إلى القاعة.
```

ChatGPT will also reach for the skill unprompted when a message matches its description. The `@` mention is what you use when it doesn't.

More prompts: [`prompts.md`](./prompts.md). To confirm the install behaves, run the nine cases in [`test-cases.md`](./test-cases.md).

## Updating

Skill versions are immutable once uploaded. Pull, rebuild, and upload the new archive to the same skill:

```bash
git pull && ./scripts/package.sh
```

## If it isn't citing the book

The four files under `references/` carry every ruling; `SKILL.md` on its own only carries the procedure. If answers arrive without a باب or a مسألة, open the uploaded skill and check that all four reference files are present in the version you uploaded — a zip built by hand from the wrong directory is the usual cause.
