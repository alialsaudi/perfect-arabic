# Perfect Arabic — ChatGPT Project

The ChatGPT-Project version of **Perfect Arabic — العربية السليمة**. This folder contains everything you need to set up an Arabic grammar checker inside a ChatGPT Project, grounded in **كتاب النحو الوافي** by **عباس حسن**.

> This is not a native ChatGPT “skill.” ChatGPT does not currently expose an equivalent of Claude Code skills to end users. Instead, this folder gives you a **Project-based equivalent**: copy-paste instructions plus uploaded reference files. Use it inside a ChatGPT Project so the instructions and uploaded files remain available across every chat in that project.

## Files in this folder

| File | Purpose |
|---|---|
| `PROJECT_INSTRUCTIONS.md` | Copy-paste-ready instructions for the ChatGPT Project **Instructions** field. |
| `UPLOAD_FILES.md` | Step-by-step setup: create the project, paste instructions, upload knowledge files. |
| `STARTER_PROMPTS.md` | Ready-to-use first-message prompts in Arabic and English. |
| `TEST_CASES.md` | Nine scenarios to verify the project is behaving correctly after setup. |
| `knowledge/` | Four Markdown reference files to upload to the project. |

## Quick start

1. Read `UPLOAD_FILES.md` and follow the five setup steps.
2. Paste `PROJECT_INSTRUCTIONS.md` into the project’s **Instructions** field.
3. Upload the four files in `knowledge/` to the project.
4. Start a new chat **inside** the project and use a prompt from `STARTER_PROMPTS.md`.
5. (Optional) Run the nine scenarios in `TEST_CASES.md` to confirm everything works.

## Scope

**For:** فصحى grammar (نحو) and morphology (صرف), based on the 177 مسائل of the source book.

**Not for:** dialect (عامية), rhetoric (بلاغة), translation, Arabizi conversion, stylistic rewriting, or tajwīd.

## Attribution

All grammatical rules come from:

> **كتاب النحو الوافي** — ٤ مجلدات، ١٧٧ مسألة
> تأليف: **عباس حسن** (١٨٩٩–١٩٧٩)
> Source: [shamela.ws/book/10641](https://shamela.ws/book/10641)

This project is a derivative reference tool, not a substitute for the original book.
