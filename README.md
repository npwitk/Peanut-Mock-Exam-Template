# Peanut Mock Exam Template

A4 LaTeX template for the mock exams curated by **The Peanuts**, plus a Claude Code
skill so an AI assistant writes them in the right layout without being re-taught
every semester.

```
main.tex                   exam paper — packages, geometry, lstset, macros, \input list
sections/                  cover + one file per question type (Parts I–VII)
solution/                  solution key — tcolorbox answer boxes, mirrors the exam
components/Logo/           the Peanut logo
skills/peanut-mock-exam/   the skill: SKILL.md + layout references
scripts/new-exam.sh        copy the skeleton into a course folder
```

## Use it as a template

```bash
git clone https://github.com/npwitk/Peanut-Mock-Exam-Template.git
cd Peanut-Mock-Exam-Template
latexmk -pdf main.tex                 # exam paper
cd solution && latexmk -pdf main.tex  # solution key
```

Or drop a skeleton straight into a course folder:

```bash
scripts/new-exam.sh "~/School/Year 3/Second Semester/CSS451 - Cloud Computing/Mock Exam/Final"
```

## Use it as a Claude Code skill

```
/plugin marketplace add npwitk/Peanut-Mock-Exam-Template
/plugin install peanut-mock-exam@peanut
```

Then just ask: *"write a CSS451 final mock exam from these lecture PDFs"*. The skill
loads the Peanut layout standards, the answer-space sizing table, and the solution-key
conventions.

Prefer not to install a plugin? Copy the skill in by hand:

```bash
cp -R skills/peanut-mock-exam ~/.claude/skills/          # available everywhere
cp -R skills/peanut-mock-exam .claude/skills/            # this project only
```

## The seven parts

| Part | File | What it is |
|---|---|---|
| I | `sections/questions-truefalse.tex` | True/False, `\tf` before each statement |
| II | `sections/questions-mcq.tex` | Multiple choice, incl. select-all-that-apply |
| III | `sections/questions-fillblanks.tex` | Fill in the blanks, `\blank{3cm}` |
| IV | `sections/questions-code.tex` | Code analysis, `lstlisting` with a language |
| V | `sections/questions-written.tex` | Written / free response |
| VI | `sections/questions-casestudy.tex` | Choose-one scenarios |
| VII | `sections/questions-design.tex` | One big integrated design question |

A midterm usually runs I–III plus one of IV/V; a final runs all seven. Comment out the
`\input` lines you do not need in `main.tex` — don't delete the files — then renumber
the remaining parts so they stay contiguous.

## House rules

- All packages, `\lstset`, and `\newcommand` live in `main.tex`. Section files contain
  questions and nothing else.
- Answer space is `\vspace{...}`, sized to the expected answer
  (see `skills/peanut-mock-exam/references/layout-standards.md`).
- Question numbers are `<part>.<n>` and never reset at a page break.
- Answers live only in `solution/`.
- The cover page keeps its humor.
