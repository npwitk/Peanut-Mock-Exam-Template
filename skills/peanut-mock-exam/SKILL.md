---
name: peanut-mock-exam
description: Write, extend, or grade a Peanut-style mock exam in LaTeX (A4) - the exam paper and its solution key. Use when the user asks for a mock exam, practice exam, mock quiz, answer key, or solution key for a university course, mentions "The Peanuts" or the Peanut exam template, or is editing main.tex / sections/questions-*.tex / solution/sections/sol-part*.tex in a Peanut-Mock-Exam-Template folder. Covers the seven question types (true/false, MCQ, fill-in-the-blanks, code analysis, written, case study, system design), the layout standards each one must follow, answer-space sizing, and the tcolorbox solution key.
---

# Peanut Mock Exam

A mock exam produced from this template is **A4, part-structured, and printable**.
Students write on the paper, so answer space is part of the design, not an afterthought.

## Repository layout

```
main.tex                        exam paper: packages, geometry, lstset, macros, \input list
sections/cover.tex              cover page (course, conditions, directions, solution link)
sections/questions-truefalse.tex    Part I
sections/questions-mcq.tex          Part II
sections/questions-fillblanks.tex   Part III
sections/questions-code.tex         Part IV
sections/questions-written.tex      Part V
sections/questions-casestudy.tex    Part VI   (choose-one scenarios)
sections/questions-design.tex       Part VII  (one big integrated question)
solution/main.tex               solution key: answer boxes, SOLUTION KEY header
solution/sections/sol-part*.tex one file per exam part
components/Logo/                Peanut logo (do not modify)
```

`scripts/new-exam.sh <target-dir>` copies the exam and solution skeletons into a course
folder.

**Finding the template files.** If the working directory already contains `main.tex` and
`sections/`, work in place. Otherwise the skeletons ship with this skill: they live at
`${CLAUDE_PLUGIN_ROOT}` when it is installed as a plugin (so
`${CLAUDE_PLUGIN_ROOT}/scripts/new-exam.sh "<course folder>/Mock Exam/Final"`), or two
levels above this file when the skill folder was copied in by hand. As a last resort,
`git clone https://github.com/npwitk/Peanut-Mock-Exam-Template.git`.

## Workflow

1. **Gather the source material.** Lecture PDFs, syllabus, past quizzes, homework.
   Questions must be answerable from that material alone - never invent syllabus content.
2. **Choose the parts.** A midterm usually runs Parts I-III plus one of IV/V.
   A final usually runs all seven. Comment out the unused `\input` lines in `main.tex`;
   do not delete the files.
3. **Renumber.** Parts must be contiguous (I, II, III, ...) and question numbers are
   `<part>.<n>` - `1.1`, `2.4`, `3.6`. Numbering never resets at a page break.
4. **Fill the placeholders** in `main.tex`, `sections/cover.tex`, and
   `solution/main.tex`: `XXX123`, `Course Name`, `[Midterm/Final]`,
   `[Closed / Semi-closed / Open]`, duration, part count, page count, cheat-sheet
   allowance, and the solution URL. Every bracketed choice must be resolved to one option.
5. **Write the questions**, following `references/layout-standards.md` exactly.
6. **Write the solution key** in `solution/`, mirroring the exam part-for-part and
   number-for-number. See `references/solution-key.md`.
7. **Compile and check the page budget.** `latexmk -pdf main.tex`, and
   `latexmk -pdf main.tex` from inside `solution/`. Then update the page count on the
   cover to the real number.

## Rules that are not negotiable

- **All configuration lives in `main.tex`.** Section files never contain
  `\usepackage`, `\lstset`, `\newcommand`, or `\documentclass`.
- **Use the macros:** `\blank{3cm}` for a fill-in blank, `\tf` for the T / F choice,
  `\pts{5}` for a right-aligned point marker. Never hand-roll `\underline{\hspace{...}}`.
- **Answer space is `\vspace{...}` only.** Never `\\[40mm]`, never an empty
  `\vspace` guess - size it to the answer (see `references/layout-standards.md`).
- **Code goes in `lstlisting` with an explicit `language=`.** Never `verbatim`.
- **The cover page keeps its humor.** The directions are deadpan-funny on purpose;
  keep that register when rewriting them for a new course.
- **Answers never appear in `sections/`.** They live only in `solution/`.
- The logo line and `components/Logo/PeanutLogoPDF.pdf` stay as they are.

## Writing questions that are worth taking

- Target the misconception, not the definition. A good true/false statement is one a
  student who half-understands would get wrong.
- Distractors must be plausible. No joke options, no "all of the above" unless it is
  genuinely the answer.
- State what a complete answer contains: *"Your answer must include: the role of the
  challenge, what z represents, and what the verifier checks."*
- Quantify design and case-study scenarios (events/sec, latency budgets, node counts).
  Vague scenarios cannot be graded.
- Scenarios within a choose-one part must be equal in difficulty and answerable in the
  same space.
- Mix the exam's difficulty: roughly 30% recall, 50% application, 20% integration
  across two or more lectures.

## References

- `references/layout-standards.md` - the exact layout contract for each of the seven
  question types, plus answer-space sizing and the macro list.
- `references/solution-key.md` - the `ans` / `keypoint` / `caution` boxes, the answer
  tables, and what a model answer must contain.
- `references/building.md` - compiling locally and on Overleaf, and the page-budget check.
