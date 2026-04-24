# How to set up the ChatGPT Project

This folder is a ChatGPT-Project-based equivalent of the Claude Code skill. ChatGPT does not currently have a native equivalent of a Claude Code skill (there is no “auto-trigger on keyword” mechanism available to end users), so we use the next-best option: a **ChatGPT Project** that bundles the instructions and the reference files so they remain available across every chat inside that project.

> **Note:** This is not a native ChatGPT “skill.” It is a Project-based package using **instructions + uploaded knowledge files**. You invoke it by starting a new chat inside the project.

---

## One-time setup (≈ 3 minutes)

### 1. Create a new ChatGPT Project
- Open ChatGPT.
- In the left sidebar, click **+ New project** (or the Projects section → **New project**).
- Name it: **Perfect Arabic — العربية السليمة**
- Optional description: *مراجع نحوي للفصحى وفق كتاب النحو الوافي لعباس حسن.*

### 2. Paste the project instructions
- Open `PROJECT_INSTRUCTIONS.md` from this folder.
- Select **all** of the text below the line that says *“Paste everything below into the ChatGPT Project ‘Instructions’ field”*.
- Copy it, and paste it into the project’s **Instructions** field.
- Save.

### 3. Upload the four knowledge files
Upload every file inside `chatgpt-project/knowledge/` to the project:

- `knowledge/01-foundations.md`
- `knowledge/02-verbs-objects.md`
- `knowledge/03-derivatives-dependents.md`
- `knowledge/04-morphology-special.md`

How to upload: inside the project, click **Add files** (or drag and drop) and select all four files.

These four files are the project’s authoritative reference. The instructions are written so that the assistant consults them for every grammar check.

### 4. Start a new chat inside the project
From inside the project, click **New chat**. Any chat started *inside* the project automatically sees the instructions and the uploaded files. A chat started outside the project will **not** have access to them.

### 5. Try a starter prompt
Open `STARTER_PROMPTS.md` and copy one of the example prompts to begin.

---

## Updating the project later

If you edit the reference files locally (e.g., after a `git pull`), repeat step 3: delete the old copy of each file in the project and upload the new one. The instructions field rarely needs to change; only re-paste it if you edit `PROJECT_INSTRUCTIONS.md`.

---

## Troubleshooting

- **The assistant isn’t citing the book.** Make sure all four files in `knowledge/` are actually uploaded to the project (not just attached to a single chat), and that you started the chat from inside the project.
- **Responses drift in style.** Re-paste the instructions field — it may have been truncated on paste. The instructions file is intentionally compact enough to fit.
- **It keeps rewriting my prose.** The invariants in section 6 of the instructions forbid this. Remind the assistant explicitly: «راجع نحوياً فقط، دون تغيير أسلوبي.»
- **It flags عامية as errors.** Tell it the text is عامية and whether you want فصحى conversion or فصحى-only review.

---

## Why a Project and not a Custom GPT?

- A **Project** is available on standard paid plans, keeps private knowledge inside your account, and supports uploading the exact same Markdown files we already maintain for the Claude skill.
- A **Custom GPT** is a possible alternative, but it’s a separate publishing surface and changes the UX. If you want to share this more widely later, a GPT is worth considering — otherwise a Project is the cleanest path.
