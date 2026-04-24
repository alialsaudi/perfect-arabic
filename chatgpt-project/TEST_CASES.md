# Test Cases

Use these cases to verify that the ChatGPT Project is behaving correctly after setup. Each case gives a **user prompt**, the **expected behavior**, and **what should not happen**. The grammatical rulings are all grounded in the uploaded knowledge files.

> Run every test in a fresh chat **inside** the project so the instructions and uploaded files are active.

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
- القاعدة: باب الفاعل — تأنيث الفعل مع الفاعل المؤنث الحقيقي (cites `02-verbs-objects.md`).
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
- القاعدة: إنَّ وأخواتها تنصب الاسم وترفع الخبر (`01-foundations.md` §إن وأخواتها).
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
- القاعدة: كان وأخواتها ترفع الاسم وتنصب الخبر (`01-foundations.md` §كان وأخواتها).
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
- Flags «ثلاث كتبٍ» → «ثلاثةَ كتبٍ» (كتاب مذكر، فالعدد من ٣–١٠ يخالفه فيؤنَّث بالتاء عند المذكر — لا، يُذكَّر… ننتبه: القاعدة عكسيّة: «العدد يخالف المعدود في التذكير والتأنيث للأعداد ٣–١٠».
  المعدود «كتاب» مذكر ⇐ يجب تأنيث العدد ⇐ «ثلاثةَ كتبٍ».
- Flags «خمسة مجلاتٍ» → «خمسَ مجلاتٍ» (مجلة مؤنث ⇐ يجب تذكير العدد).
- القاعدة: باب العدد — مخالفة العدد للمعدود من ٣ إلى ١٠ (`04-morphology-special.md` §العدد).
- درجة التصحيح: **واجب** لكلا الخطأين.

**Should NOT happen**
- Swapping the rule (“the number agrees with the counted”) — it is the **opposite** for 3–10.
- Ignoring one of the two errors.

---

## 6. الحال والتمييز

**User prompt**
```
راجع:

جاء محمدٌ راكبٌ، واشتريتُ عشرينَ كتابٌ.
```

**Expected behavior**
- Flags «راكبٌ» → «راكباً» — الحال منصوبة (`02-verbs-objects.md` §الحال). درجة التصحيح: **واجب**.
- Flags «كتابٌ» → «كتاباً» — تمييز العدد من ١١ إلى ٩٩ مفرد منصوب (`02-verbs-objects.md` §التمييز، و`04-morphology-special.md` §العدد). درجة التصحيح: **واجب**.

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
- Cites: باب الاستثناء (`02-verbs-objects.md` §الاستثناء).

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

## How to read the results

If all nine tests produce the expected behavior, the project is correctly set up. If any test fails:

- Re-upload the four knowledge files (see `UPLOAD_FILES.md`).
- Re-paste `PROJECT_INSTRUCTIONS.md` into the instructions field — it may have been truncated.
- Start a fresh chat **inside** the project, not outside it.
