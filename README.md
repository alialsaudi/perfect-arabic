# Perfect Arabic — العربية السليمة

An Arabic grammar checker for فصحى, grounded entirely in the rules of **كتاب النحو الوافي** (*al-Naḥw al-Wāfī*) by the Egyptian grammarian **عباس حسن** (ʿAbbās Ḥasan, 1899–1979).

This repository ships **two usable packages** from the same underlying knowledge base:

| Package | For | Folder |
|---|---|---|
| Claude Code skill | Users of **Claude Code** (CLI / IDE) | [`claude-skill/`](./claude-skill) |
| ChatGPT Project | Users of **ChatGPT** on a paid plan with Projects | [`chatgpt-project/`](./chatgpt-project) |

Both packages use the same four reference files extracted from the source book, so the grammatical behavior is identical. They differ only in how each platform exposes them.

## Why two folders?

Claude Code has a native *Skill* mechanism: a folder containing `SKILL.md` plus reference files is auto-discovered and auto-triggered based on the skill’s `description`. ChatGPT has no end-user equivalent to that mechanism. The closest practical option is a **ChatGPT Project** that bundles the instructions and uploaded reference files so they persist across every chat started inside the project.

The two folders keep each platform’s setup cleanly separated while preserving a single source of truth for the grammar content.

---

## About the source

*النحو الوافي* is one of the most comprehensive modern references for classical Arabic grammar. It consists of **4 volumes** organized into **177 مسائل**, covering every major topic of نحو (syntax) and صرف (morphology) with rulings, conditions, permitted variants, and common errors. ʿAbbās Ḥasan was a member of مجمع اللغة العربية بالقاهرة and the author of several canonical grammatical works.

> **Full attribution:** all grammatical rules, terminology, and examples in this repository are drawn from كتاب النحو الوافي لعباس حسن. The repository is a reference tool, **not a substitute for the original book**.

What each package reports:

- الأخطاء النحوية والصرفية المكتشفة مع تصويبها
- القاعدة من النحو الوافي (الباب / المسألة عند توفّرها)
- تعليل مختصر لكل تصويب
- درجة التصحيح: واجب / أرجح / جائز مع ملاحظة
- النص المصحَّح كاملاً

Coverage mirrors the source book’s four volumes:

| Volume | Topics |
|---|---|
| **المجلد الأول** | الكلام وأقسامه، الإعراب والبناء، الأسماء الستة، المثنى، الجموع، النكرة والمعرفة، المبتدأ والخبر، كان/إن/ظن وأخواتها، لا النافية للجنس، أفعال المقاربة والشروع والرجاء |
| **المجلد الثاني** | الفاعل ونائبه، الاشتغال والتنازع، التعدي واللزوم، المفاعيل الخمسة، الحال، التمييز، الاستثناء، حروف الجر |
| **المجلد الثالث** | الإضافة، أبنية المصادر، المشتقات، التعجب، أفعل التفضيل، التوابع الأربعة |
| **المجلد الرابع** | النداء والترخيم، الاختصاص، الاستغاثة والندبة، ما لا ينصرف، إعراب المضارع، العدد، جمع التكسير، النسب، التصغير، الإعلال والإبدال |

---

## Quick start — Claude Code

```bash
# Clone the repo anywhere
git clone https://github.com/alialsaudi/perfect-arabic.git

# Copy only the skill folder into your Claude Code skills directory
cp -r perfect-arabic/claude-skill ~/.claude/skills/perfect-arabic
# ...or project-scoped:
cp -r perfect-arabic/claude-skill .claude/skills/perfect-arabic
```

Then in Claude Code, say any of: «دقّق هذا النص: …» / «راجع الفقرة التالية نحوياً» / «ما حكم المستثنى بعد إلا في الجملة المنفية؟».

Full details: [`claude-skill/README.md`](./claude-skill/README.md).

## Quick start — ChatGPT Project

1. Create a new ChatGPT Project named **Perfect Arabic — العربية السليمة**.
2. Paste the contents of [`chatgpt-project/PROJECT_INSTRUCTIONS.md`](./chatgpt-project/PROJECT_INSTRUCTIONS.md) into the project’s **Instructions** field.
3. Upload the four files inside [`chatgpt-project/knowledge/`](./chatgpt-project/knowledge) to the project.
4. Start a new chat **inside** the project.
5. Use a prompt from [`chatgpt-project/STARTER_PROMPTS.md`](./chatgpt-project/STARTER_PROMPTS.md).

Full details: [`chatgpt-project/UPLOAD_FILES.md`](./chatgpt-project/UPLOAD_FILES.md).

> Note: this is a Project-based equivalent using instructions + uploaded knowledge files. It is not a native ChatGPT “skill” and cannot auto-trigger the way a Claude Code skill does. Using it inside a ChatGPT Project keeps the instructions and reference files available across every chat in that project.

---

## Repository structure

```
perfect-arabic/
├── README.md
├── LICENSE
├── claude-skill/
│   ├── SKILL.md
│   ├── README.md
│   └── references/
│       ├── 01-foundations.md
│       ├── 02-verbs-objects.md
│       ├── 03-derivatives-dependents.md
│       └── 04-morphology-special.md
└── chatgpt-project/
    ├── README.md
    ├── PROJECT_INSTRUCTIONS.md
    ├── UPLOAD_FILES.md
    ├── STARTER_PROMPTS.md
    ├── TEST_CASES.md
    └── knowledge/
        ├── 01-foundations.md
        ├── 02-verbs-objects.md
        ├── 03-derivatives-dependents.md
        └── 04-morphology-special.md
```

The four `.md` files under `claude-skill/references/` and `chatgpt-project/knowledge/` are identical copies of the same source-of-truth content.

## Scope & limits

- **Is for:** فصحى grammar (نحو وصرف) — agreement, case, mood, word forms, numerals, vocative, exception, and the 177 مسائل covered by the source book.
- **Is not for:** dialect (عامية), rhetoric (بلاغة), stylistic rewriting, translation, Arabizi conversion, or tajwīd.

Both packages are built around the same invariants: do not invent rules not in the reference files, respect permitted alternatives, preserve the user’s voice, and distinguish نحو / صرف / إملاء / أسلوب clearly.

## Acknowledgment

Deepest acknowledgment to the late **عباس حسن رحمه الله**, whose 4-volume *النحو الوافي* remains one of the clearest and most rigorous works on modern Arabic grammar. This repository exists only to make that work more accessible in day-to-day writing.

## License

The skill code and structure are released under **MIT** (see [`LICENSE`](./LICENSE)). The grammatical content derives from *النحو الوافي* by عباس حسن — please consult the original book for authoritative reference.
