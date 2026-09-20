# Peanut Solution Key Standards

The solution key is a separate document in `solution/`. It is a study tool, not just
an answer list: a student reads it *instead of* re-reading the lecture slides.

## Structure

`solution/main.tex` holds every package, box definition, and macro, then inputs
`solution/sections/sol-part1-truefalse.tex` ... `sol-part7-design.tex`.
One file per exam part. The key mirrors the exam **part-for-part and
number-for-number** - if the exam has 2.4, the key has 2.4.

Compile from inside `solution/`: `latexmk -pdf main.tex`. The logo resolves through
`\graphicspath{{../}{./}}`.

## The three boxes

| Environment | Colour | Purpose |
|---|---|---|
| `\begin{ans}` | blue | the model answer. Every question gets one. |
| `\begin{keypoint}` / `\begin{keypoint}[Formula]` | green | the fact or formula worth memorizing |
| `\begin{caution}` / `\begin{caution}[Trap]` | orange | the mistake students actually make |

Plus two inline macros: `\tf{TRUE}` colours a true/false answer, `\correct{b}` colours
a correct MCQ choice or a filled-in blank.

Both are **text-mode** macros. To highlight a filled-in formula, put the math inside
the macro - `\correct{$\mathbf{As} + \mathbf{e}$}` - never the macro inside math
(`$\correct{\mathbf{As}}$` fails with *\mathbf allowed only in math mode*).

## What each part's key must contain

- **True/False** - an answer table first (two column pairs), then one explanation per
  statement. For a FALSE statement, state the *correct* claim; "this is false" is not
  an explanation.
- **MCQ** - an answer table (multi-select listed as `b, d`), then per question: why the
  answer is right **and why each strong distractor is wrong**. The distractor analysis
  is the point.
- **Fill in the blanks** - reprint the whole sentence with the blanks filled in and
  wrapped in `\correct{...}`, so it reads as a complete correct statement. List accepted
  alternative wordings.
- **Code analysis** - name the defect precisely (CWE-style naming welcome), show the
  traced input and the exact resulting query/state/output, and give **complete, runnable**
  fixed code in an `lstlisting` inside the `ans` box.
- **Written** - tick off every element the exam demanded. Show every step of a
  computation, then state the conclusion in words: a number with no interpretation is
  not a complete answer.
- **Case study** - a model answer for **every** scenario (students chose differently),
  preceded by the rubric so they can self-mark.
- **System design** - one strong reference design, plus the alternatives that also earn
  full credit, plus an explicit trace: every requirement in the background box maps to a
  decision in the key.

## Tone

Same voice as the exam: direct, specific, no padding. Say "this is where marks are lost"
when it is true. The red **Not for distribution. For personal review only.** line on the
cover stays.
