# Test Cases

Nine cases for checking that an install behaves. Each gives a **prompt**, the **expected behavior**, and **what should not happen**. Every ruling below comes from the files in `references/`.

Run each in a fresh conversation. Two of the cases — 7 and 8 — are the ones worth caring about: they test restraint rather than knowledge, and a mis-installed or half-loaded skill fails them first.

---

## 1. Correct text (no errors)

**User prompt**
```
دقّق هذا النص نحوياً وفق النحو الوافي:

ذهبَ الطالبُ إلى المدرسةِ صباحاً، وعادَ إلى بيتِه مساءً.
```

**Expected behavior**
- The assistant replies with: «النص سليم نحوياً وفق أحكام النحو الوافي.»
- Optionally, one short «ملاحظات» line if there is something genuinely useful to say.
- No fabricated errors.

**Should NOT happen**
- Inventing errors to justify a correction section.
- Rewriting the sentence for style.

---

## 2. Verb–subject agreement (تأنيث الفعل)

**User prompt**
```
راجع نحوياً:

قالَ فاطمةُ لصديقتِها إنها متعبةٌ.
```

**Expected behavior**
- Flags «قالَ فاطمةُ» → «قالتْ فاطمةُ».
- القاعدة: باب الفاعل — تأنيث الفعل مع الفاعل المؤنث الحقيقي (cites `references/02-verbs-objects.md`).
- درجة التصحيح: **واجب** (تأنيث الفعل واجب مع المؤنث الحقيقي الظاهر المتّصل).
- Returns the corrected sentence intact otherwise.

**Should NOT happen**
- Treating the تاء as optional here.
- Changing «لصديقتِها» or «متعبةٌ».

---

## 3. إن وأخواتها

**User prompt**
```
هل الجملة صحيحة؟

إنَّ الطالبُ مجتهدٌ.
```

**Expected behavior**
- Flags «الطالبُ» → «الطالبَ».
- القاعدة: إنَّ وأخواتها تنصب الاسم وترفع الخبر (`references/01-foundations.md` §إن وأخواتها).
- درجة التصحيح: **واجب**.

**Should NOT happen**
- Leaving the ضمة on اسم إنّ as acceptable.
- Touching «مجتهدٌ», which is already correct as خبر إنّ مرفوع.

---

## 4. كان وأخواتها

**User prompt**
```
صحّح:

كان الطالبَ مجتهداً في دروسِه.
```

**Expected behavior**
- Flags «الطالبَ» → «الطالبُ».
- القاعدة: كان وأخواتها ترفع الاسم وتنصب الخبر (`references/01-foundations.md` §كان وأخواتها).
- درجة التصحيح: **واجب**.

**Should NOT happen**
- Accepting نصب اسم كان.
- Changing «مجتهداً»، وهو خبر كان منصوب وهو صحيح.

---

## 5. العدد

**User prompt**
```
دقّق:

اشتريتُ ثلاث كتبٍ وخمسة مجلاتٍ.
```

**Expected behavior**

Both numerals are wrong, and they are wrong in opposite directions. From 3 to 10 the numeral takes the **opposite** gender marking to the thing it counts:

- «ثلاث كتبٍ» ← «ثلاثةَ كتبٍ» — مفرد المعدود «كتاب» مذكر، فيلحق العدد التاء.
- «خمسة مجلاتٍ» ← «خمسَ مجلاتٍ» — مفرد المعدود «مجلة» مؤنث، فيتجرد العدد من التاء.
- القاعدة: باب العدد — مخالفة العدد للمعدود من ٣ إلى ١٠ (`references/04-morphology-special.md` §العدد).
- درجة التصحيح: **واجب** في الموضعين.

**Should NOT happen**
- Stating the rule as agreement rather than opposition. This is the single error a model is most likely to make from memory, which is why the case is here.
- Catching one numeral and letting the other pass.

---

## 6. الحال والتمييز

**User prompt**
```
راجع:

جاء محمدٌ راكبٌ، واشتريتُ عشرينَ كتابٌ.
```

**Expected behavior**
- Flags «راكبٌ» → «راكباً» — الحال منصوبة (`references/02-verbs-objects.md` §الحال). درجة التصحيح: **واجب**.
- Flags «كتابٌ» → «كتاباً» — تمييز العدد من ١١ إلى ٩٩ مفرد منصوب (`references/02-verbs-objects.md` §التمييز، و`references/04-morphology-special.md` §العدد). درجة التصحيح: **واجب**.

**Should NOT happen**
- Treating الحال as اسم مرفوع.
- Leaving tamyīz العدد مرفوعاً أو مجروراً.

---

## 7. الاستثناء — respecting permitted alternatives

**User prompt**
```
ما حكم هذا التركيب؟

ما جاء أحدٌ إلا محمدٌ.
```

**Expected behavior**
- Explains that في الاستثناء التامّ المنفي المتصل يجوز في المستثنى وجهان:
  1. **الإتباع** على البدلية (مرفوع هنا: «إلا محمدٌ») — وهو **الأرجح**.
  2. **النصب** على الاستثناء («إلا محمداً») — جائز.
- Does **not** flag «إلا محمدٌ» as an error. Tags it as **جائز مع ملاحظة** that الإتباع هو الأرجح.
- Cites: باب الاستثناء (`references/02-verbs-objects.md` §الاستثناء).

**Should NOT happen**
- Calling the sentence wrong.
- Presenting only one of the two valid positions.

---

## 8. عامية — should ask, not correct

**User prompt**
```
دقّق هذا النص:

إنت فين دلوقتي؟ أنا رايح السوق وراجع بسرعة.
```

**Expected behavior**
- Does **not** flag dialectal forms as فصحى errors.
- Asks a single clarifying question, e.g.:
  «النص المكتوب بالعامية المصرية. هل تريد أن أحوّله إلى الفصحى وفق قواعد النحو الوافي، أم أن أراجع النص كما هو باعتباره عامية فقط؟»

**Should NOT happen**
- Rewriting silently into فصحى without asking.
- Marking «إنت», «فين», «دلوقتي», «رايح» as grammar errors with rules from النحو الوافي.

---

## 9. Spelling-only — should be labeled إملاء, not نحو

**User prompt**
```
راجع نحوياً:

أنت انسانٌ محترمٌ، وعملك رائعٌ.
```

**Expected behavior**
- Recognizes that the sentence is **نحوياً سليم**.
- Replies with: «النص سليم نحوياً وفق أحكام النحو الوافي.»
- Adds a «ملاحظات» item labeled explicitly as **ملاحظة إملائية** (not خطأ نحوي):
  «كتابة "انسان" الأولى بهمزة وصل؛ الصواب إملائياً "إنسان" بهمزة قطع.»

**Should NOT happen**
- Putting the همزة issue under «الأخطاء المكتشفة» as a نحو error.
- Citing a باب من النحو الوافي لقاعدة الهمزة (it belongs to إملاء, not نحو).

---

## Reading the results

Nine passes means the install is sound. A failure is almost always one of three things:

- **No باب cited anywhere.** The `references/` files didn't come along. Reinstall the whole folder, not just `SKILL.md`.
- **The skill never engaged.** Call it explicitly — `$perfect-arabic`, `@Perfect Arabic`, `/perfect-arabic` — and if that works, the install is fine and only the automatic triggering missed.
- **Case 7 or 8 failed while the rest passed.** The skill loaded and the model overrode it. Nothing to reinstall; restate the constraint in the prompt.
