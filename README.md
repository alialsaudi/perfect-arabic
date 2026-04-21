# Perfect Arabic — العربية السليمة

A Claude Code skill that checks Arabic text (فصحى) for grammar, syntax, and morphological errors, grounded entirely in the rules of **كتاب النحو الوافي** (*al-Naḥw al-Wāfī*) by the Egyptian grammarian **عباس حسن** (ʿAbbās Ḥasan, 1899–1979).

## About the source

*النحو الوافي* is one of the most comprehensive and authoritative modern references for classical Arabic grammar. It consists of **4 volumes** organized into **177 مسائل** (grammatical questions), covering every major topic of نحو (syntax) and صرف (morphology) with rulings, conditions, permitted variants, and common errors. ʿAbbās Ḥasan was a member of مجمع اللغة العربية بالقاهرة (the Arabic Language Academy in Cairo) and the author of several canonical grammatical works.

> **Full attribution:** *All grammatical rules, terminology, and examples in this skill are drawn from كتاب النحو الوافي لعباس حسن. This skill is a reference tool, not a substitute for the original book.*


## What the skill does

When invoked, it checks Arabic text against the book's rules and reports:
- الأخطاء النحوية/الصرفية المكتشفة مع تصويبها
- القاعدة من النحو الوافي (الباب / المسألة)
- تعليل مختصر لكل تصويب
- النص المصحَّح كاملاً

It covers:

| Volume | Topics |
|---|---|
| **المجلد الأول** | الكلام وأقسامه، الإعراب والبناء، الأسماء الستة، المثنى، الجموع، النكرة والمعرفة، المبتدأ والخبر، كان/إن/ظن وأخواتها، لا النافية للجنس، أفعال المقاربة والشروع والرجاء |
| **المجلد الثاني** | الفاعل ونائبه، الاشتغال والتنازع، التعدي واللزوم، المفاعيل الخمسة (المطلق، لأجله، فيه، معه، به)، الحال، التمييز، الاستثناء، حروف الجر |
| **المجلد الثالث** | الإضافة، أبنية المصادر، المشتقات (اسم الفاعل والمفعول، الصفة المشبهة، صيغ المبالغة، اسم الآلة والمرة والهيئة والزمان والمكان)، التعجب، أفعل التفضيل، التوابع الأربعة |
| **المجلد الرابع** | النداء والترخيم، الاختصاص، الاستغاثة والندبة، ما لا ينصرف، إعراب المضارع (النواصب والجوازم)، العدد، جمع التكسير، النسب، التصغير، الإعلال والإبدال |

## Installation

Clone into your Claude Code skills directory:

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git ~/.claude/skills/perfect-arabic
```

Or in a project:

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git .claude/skills/perfect-arabic
```

Then in Claude Code, ask any of:

- «دقّق هذا النص: …»
- «راجع الفقرة التالية نحوياً»
- «هل يصح أن نقول …؟»
- «ما حكم المستثنى بعد "إلا" في الجملة المنفية؟»
- «أعرب الجملة التالية»

The skill auto-triggers on these patterns.

## Structure

```
perfect-arabic/
├── SKILL.md                             # Skill metadata, workflow, report template
├── README.md                            # This file
└── references/
    ├── 01-foundations.md                # Vol 1: الكلام، الإعراب، النواسخ
    ├── 02-verbs-objects.md              # Vol 2: الفاعل، المفاعيل، الحال، التمييز، الاستثناء، حروف الجر
    ├── 03-derivatives-dependents.md     # Vol 3: الإضافة، المشتقات، التعجب، التفضيل، التوابع
    └── 04-morphology-special.md         # Vol 4: النداء، المضارع، العدد، النسب، التصريف
```

## Scope & limits

- **Is for:** فصحى grammar (نحو وصرف) — agreement, case, mood, word forms, numerals, vocative, exception, etc.
- **Is not for:** Dialect (عامية), rhetoric (بلاغة), stylistic rewriting, translation, Arabizi conversion, or Quranic recitation rules (تجويد).

## Acknowledgment

Deepest acknowledgment to the late **عباس حسن رحمه الله**, whose 4-volume *النحو الوافي* remains one of the clearest and most rigorous works on Arabic grammar in the modern era. This skill exists only to make that work more accessible in day-to-day writing.

## License

The skill code and structure are released under MIT. The grammatical content derives from *النحو الوافي* by عباس حسن — please consult the original book for authoritative reference.
