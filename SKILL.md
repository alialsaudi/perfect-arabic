---
name: perfect-arabic
description: Check Arabic text for grammar (نحو), syntax, and usage errors using rules extracted from كتاب النحو الوافي by عباس حسن (4-volume authoritative Arabic grammar reference). Trigger when the user asks to check, proofread, correct, راجع، صحّح، دقّق, or evaluate Arabic text for grammatical correctness, or asks about a specific Arabic grammar rule (إعراب، فاعل، حال، تمييز، استثناء، عدد، نسب، تصريف، إلخ). Do NOT use for Arabizi conversion, translation, or stylistic rewriting.
---

# Perfect Arabic — العربية السليمة
### Arabic grammar checker based on كتاب النحو الوافي

**Source book:** *النحو الوافي* (al-Naḥw al-Wāfī) — ٤ مجلدات  
**Author:** عباس حسن (ʿAbbās Ḥasan, 1899–1979)  
**Scope:** 177 grammatical مسائل covering all of فصحى syntax and morphology

## Purpose

Check Arabic text against the authoritative rules of كتاب النحو الوافي لعباس حسن — one of the most comprehensive modern references for فصحى grammar. This skill is for syntactic and morphological correctness (نحو وصرف), NOT for style, rhetoric (بلاغة), or orthography unless the rule is in the book.

## When to invoke

Invoke when the user:
- Pastes Arabic text and asks for grammar checking (دقّق، صحّح، راجع، اعرب، قوّم)
- Asks whether a specific construction is correct (هل يصح أن نقول…؟)
- Asks for the rule governing a specific topic (ما حكم المستثنى بعد إلا في الجملة المنفية؟)
- Asks to إعراب a sentence or identify errors
- Requests verification against النحو الوافي specifically

Do NOT invoke for:
- Romanized Arabic → Arabic script (use `arabizi-to-arabic`)
- Pure prose rewriting or stylistic polish (use `arabic-writing-coach` for that)
- Translation
- Quranic recitation rules (تجويد) — outside scope

## Workflow

### Step 1 — Classify the request

| Request type | Action |
|---|---|
| Text to check | Proceed to Step 2 (full pass) |
| Single-rule question | Jump to the relevant reference file in `references/`, answer from it, cite the topic |
| Ambiguous | Ask: "هل تريد فحص النص كاملاً أم السؤال عن قاعدة بعينها؟" |

### Step 2 — Full-text checking pass

For any Arabic text to check, scan in this order and cross-reference the relevant reference file:

1. **Sentence skeleton** — Is it جملة اسمية or فعلية? Identify مبتدأ/خبر or فعل/فاعل. → `references/01-foundations.md`
2. **Agreement (المطابقة)**:
   - Verb↔subject gender (تأنيث الفعل) → `references/02-verbs-objects.md` §الفاعل
   - Adjective↔noun (النعت) — gender, number, definiteness, case → `references/03-derivatives-dependents.md` §التوابع
   - Demonstrative/relative/pronoun with its reference
3. **Case endings (الإعراب)**:
   - Does each word carry the correct حركة for its position? → `references/01-foundations.md` §الإعراب والبناء
   - Diptotes ما لا ينصرف — not kasra when indefinite → `references/04-morphology-special.md` §ما لا ينصرف
   - Five nouns (الأسماء الستة), duals, sound plurals — correct letter endings
4. **Naskh operators (النواسخ)** — If كان، إن، ظن، لا النافية للجنس present, is the اسم/خبر pattern right? → `references/01-foundations.md` §النواسخ
5. **Objects (المفاعيل)** — مطلق، به، لأجله، معه، فيه, حال, تمييز, استثناء → `references/02-verbs-objects.md`
6. **Prepositions (حروف الجر)** — Is the correct حرف used for the intended meaning? → `references/02-verbs-objects.md` §حروف الجر
7. **Derivatives (المشتقات)** — اسم فاعل/مفعول, صفة مشبهة, تعجب, تفضيل: correct wazn and agreement → `references/03-derivatives-dependents.md`
8. **Morphology/spelling** — number words, نسب (ـيّ), تصغير, broken plurals, إعلال وإبدال → `references/04-morphology-special.md`
9. **Mood of the imperfect** — after نواصب or جوازم → `references/04-morphology-special.md` §إعراب المضارع
10. **Vocative and related** — النداء، الترخيم، الاستغاثة، الندبة → `references/04-morphology-special.md` §النداء

### Step 3 — Report format

Always reply in Arabic (فصحى) unless the user writes in English. Use this exact structure:

```
## مراجعة النحو الوافي

### الأخطاء المكتشفة

1. **[العبارة الخاطئة]** → **[الصواب]**
   - القاعدة: [اذكر اسم الباب من النحو الوافي، مثلاً: "الفاعل — تأنيث الفعل"]
   - التعليل: [جملة أو جملتان]
   - الشاهد من الكتاب: [المجلد / المسألة إن أمكن]

2. …

### ملاحظات (اختيارية — لمسائل الترجيح أو الاستعمال الفصيح)

- …

### النص بعد التصحيح

[أعد كتابة النص كاملاً بعد تطبيق التصويبات]
```

If no errors found, say: **«النص سليم نحوياً وفق أحكام النحو الوافي.»** and optionally flag weak-but-acceptable usages under "ملاحظات".

### Step 4 — Citations

Be precise. Cite the باب (topic chapter) and المسألة number when you know it. The book is organized into 177+ مسائل. Examples:
- "المسألة السادسة — الإعراب والبناء" (Vol. 1)
- "المسألة ٦٥ — الفاعل" (Vol. 2)
- "المسألة ١٦٣ — العدد" (Vol. 4)

When uncertain of the exact مسألة number, cite the باب by name only (e.g., "باب الحال").

## Invariants — do not violate

1. **Never correct regional dialect (عامية) as if it were فصحى errors.** If the user's text is clearly عامية, ask which level of Arabic they want checked.
2. **Don't invent rules.** If you can't find a rule in the references, say so and explain the general principle from النحو الوافي. Do NOT cite the book for something you are unsure about.
3. **Distinguish خطأ نحوي from خطأ إملائي.** This skill is for grammar/syntax. For pure spelling (همزة, ة vs. ه, ى vs. ي), mention it but label it as إملاء, not نحو.
4. **Respect permitted alternatives.** النحو الوافي records multiple valid positions in many topics (especially الاستثناء، التنازع، الحال الجامدة). Do not flag a valid but less-common form as an error — flag it as "جائز وإن كان الأرجح…".
5. **Preserve the user's voice.** Only correct errors. Do not rewrite prose.

## Reference files (load on demand)

- `references/01-foundations.md` — الكلام، الإعراب والبناء، الأسماء الستة، المثنى، الجموع السالمة، الأفعال الخمسة، النكرة والمعرفة، المبتدأ والخبر، كان وأخواتها، إن وأخواتها، ظن وأخواتها، لا النافية للجنس، الأحرف المشبهة بليس، أفعال المقاربة والشروع والرجاء
- `references/02-verbs-objects.md` — الفاعل، نائب الفاعل، التنازع والاشتغال، التعدي واللزوم، أعلم وأرى، المفعول المطلق، المفعول لأجله، الظرف، المفعول معه، الاستثناء، الحال، التمييز، حروف الجر
- `references/03-derivatives-dependents.md` — الإضافة، أبنية المصادر، اسم الفاعل/المفعول، الصفة المشبهة، اسم الآلة/المرة/الهيئة/الزمان/المكان، صيغ المبالغة، التعجب، أفعل التفضيل، التوابع الأربعة (النعت، التوكيد، عطف البيان، البدل، العطف بالحرف)
- `references/04-morphology-special.md` — النداء وأنواع المنادى، الترخيم، الاختصاص، الاستغاثة، الندبة، ما لا ينصرف، إعراب المضارع (النواصب والجوازم)، العدد، جمع التكسير، النسب، التصغير، الإعلال والإبدال

## Source & Attribution

All rules in this skill are extracted from and attributed to:

> **كتاب النحو الوافي**  
> تأليف: **عباس حسن** (1899–1979)  
> أحد أعلام النحو العربي المعاصر، عضو مجمع اللغة العربية بالقاهرة  
> 4-volume comprehensive reference, organized into 177 مسائل  
> Source: [shamela.ws/book/10641](https://shamela.ws/book/10641)

This skill is a derivative reference tool; all grammatical authority belongs to the original work. Any errors in summary or transcription are the skill's own and should be verified against the original book.
