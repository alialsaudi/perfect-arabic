# Perfect Arabic — العربية السليمة

An Arabic grammar checker that answers out of one book: **كتاب النحو الوافي** by **عباس حسن** — four volumes, 177 مسائل — and cites it every time it corrects you.

Hand a paragraph of Arabic to a general-purpose model and you get fluent prose back, with your case endings quietly repaired, some of your word choices quietly replaced, and no way to tell which was which. This skill is built for the other job. It names the باب behind each correction, marks it **واجب** or **أرجح** or **جائز**, and leaves everything that isn't wrong exactly as you wrote it.

## What it will not do

- **Rewrite your prose.** Register, rhythm and word choice are yours. Only errors get touched.
- **Flag a valid minority form as an error.** النحو الوافي records more than one permitted position in several باب. «ما جاء أحدٌ إلا محمدٌ» is correct — الإتباع على البدلية is even the stronger reading — so it comes back as a note, not a red mark.
- **Invent a citation.** When the rule isn't in the reference files, it says so and gives the general principle uncited, rather than attaching a مسألة number that might not exist.
- **Treat عامية as broken فصحى.** Dialect gets a question about which register you meant, not a list of corrections.

## What a review looks like

```
اشتريتُ ثلاث كتبٍ وخمسة مجلاتٍ.
```

```
### الأخطاء المكتشفة

1. **ثلاث كتبٍ** ← **ثلاثةَ كتبٍ**
   - القاعدة: باب العدد — مخالفة العدد للمعدود من ٣ إلى ١٠
   - التعليل: مفرد المعدود «كتاب» مذكر، فيلحق العددَ التاء
   - درجة التصحيح: واجب

2. **خمسة مجلاتٍ** ← **خمسَ مجلاتٍ**
   - القاعدة: باب العدد — مخالفة العدد للمعدود من ٣ إلى ١٠
   - التعليل: مفرد المعدود «مجلة» مؤنث، فيتجرد العددُ من التاء
   - درجة التصحيح: واجب
```

Two numerals, wrong in opposite directions, out of a single rule. The 3–10 rule is easy to state backwards from memory — the numeral *opposes* the gender of what it counts — which is why it sits in the test suite as the case that separates a grounded check from a confident guess.

## Install

One folder — [`skills/perfect-arabic/`](./skills/perfect-arabic) — installs on all three surfaces. Same `SKILL.md`, same four reference files, same behavior.

| Where | How | Guide |
|---|---|---|
| **Codex** (CLI, IDE, desktop app) | Copy into `~/.codex/skills/`, invoke with `$perfect-arabic` | [`docs/codex.md`](./docs/codex.md) |
| **ChatGPT** (Business, Enterprise, Edu; paid personal plans) | Upload `perfect-arabic.zip`, mention with `@Perfect Arabic` | [`docs/chatgpt.md`](./docs/chatgpt.md) |
| **Claude Code** | Copy into `~/.claude/skills/`, invoke with `/perfect-arabic` | [`docs/claude-code.md`](./docs/claude-code.md) |

```bash
git clone https://github.com/alialsaudi/perfect-arabic.git

cp -r perfect-arabic/skills/perfect-arabic ~/.codex/skills/    # Codex
cp -r perfect-arabic/skills/perfect-arabic ~/.claude/skills/   # Claude Code
cd perfect-arabic && ./scripts/package.sh                      # ChatGPT: builds the zip
```

All three trigger the skill on their own when a request matches its description. The explicit call is what you use when they don't.

## Coverage

The four reference files track the book's four volumes:

| المجلد | الأبواب |
|---|---|
| **الأول** | الكلام وأقسامه، الإعراب والبناء، الأسماء الستة، المثنى، الجموع، النكرة والمعرفة، المبتدأ والخبر، كان وإن وظن وأخواتها، لا النافية للجنس، أفعال المقاربة والشروع والرجاء |
| **الثاني** | الفاعل ونائبه، الاشتغال والتنازع، التعدي واللزوم، المفاعيل الخمسة، الحال، التمييز، الاستثناء، حروف الجر |
| **الثالث** | الإضافة، أبنية المصادر، المشتقات، التعجب، أفعل التفضيل، التوابع الأربعة |
| **الرابع** | النداء والترخيم، الاختصاص، الاستغاثة والندبة، ما لا ينصرف، إعراب المضارع، العدد، جمع التكسير، النسب، التصغير، الإعلال والإبدال |

**Not covered:** عامية, بلاغة as a subject, translation, Arabizi conversion, تجويد, and stylistic rewriting. إملاء errors are reported, but labelled as إملاء rather than filed under نحو.

## Repository

```
perfect-arabic/
├── skills/perfect-arabic/     ← the skill; this is what you install
│   ├── SKILL.md               ← procedure, report format, invariants
│   ├── agents/openai.yaml     ← UI metadata for OpenAI surfaces
│   └── references/            ← the four rule files, loaded on demand
├── docs/
│   ├── codex.md · chatgpt.md · claude-code.md
│   ├── prompts.md             ← ready-made prompts, Arabic and English
│   └── test-cases.md          ← nine cases to verify an install
└── scripts/package.sh         ← builds the ChatGPT upload archive
```

`SKILL.md` carries only the procedure. The rulings live in `references/`, which the model loads when a text actually raises that topic — so a check of one sentence doesn't drag four volumes of grammar into context.

## Source and attribution

> **كتاب النحو الوافي** — ٤ مجلدات، ١٧٧ مسألة
> تأليف: **عباس حسن** (١٨٩٩–١٩٧٩)، عضو مجمع اللغة العربية بالقاهرة
> [shamela.ws/book/10641](https://shamela.ws/book/10641)

Everything this skill knows about Arabic grammar came out of that book. What ships here is a condensed extraction of it — enough to check a text and cite a باب, nowhere near enough to replace the volumes themselves. Where the two disagree, the book is right and this repository has a bug worth filing.

Deepest acknowledgment to the late عباس حسن رحمه الله, whose النحو الوافي remains among the clearest and most rigorous treatments of Arabic grammar written in the modern era. This exists only to put a little of it within reach of everyday writing.

## License

The skill structure and scaffolding are MIT — see [`LICENSE`](./LICENSE). The grammatical content derives from النحو الوافي by عباس حسن; consult the original for authority.
