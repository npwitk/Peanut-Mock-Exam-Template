# Peanut Exam Layout Standards

The layout contract for each question type. Follow it exactly; a Peanut exam is
recognizable across courses because these never drift.

## Global macros (defined in `main.tex`, usable in any section file)

| Macro | Renders | Use for |
|---|---|---|
| `\blank{3cm}` | a 3 cm underline | every fill-in-the-blank blank |
| `\tf` | `  T  /  F  ` | the choice printed before a true/false statement |
| `\pts{5}` | right-aligned *(5 pts)* | point value on a question line, graded exams only |

Widths for `\blank`: `2cm` a number, `3cm` a term, `3.5cm` an expression inside math,
`5cm` a short phrase, `9cm` a full sentence or acronym expansion.

## Part I - True / False (`questions-truefalse.tex`)

- Heading: `\section*{Part I: True or False}` + an italic instruction line.
- `\begin{enumerate}[label=\textbf{1.\arabic*}, left=0pt, itemsep=0.35cm]`.
- Every item **starts with `\tf`**, then the statement.
- Continue after a group break or `\newpage` with a fresh
  `enumerate[..., start=<n>]` so numbering never resets.
- Spacing between statements comes from `itemsep` in the enumerate options - blank
  lines in the source do nothing. Never `\vspace` inside the list.
- Size: 12-15 statements for a final, 8-10 for a midterm.
- Never add explanation space. Never convert to MCQ.

## Part II - Multiple Choice (`questions-mcq.tex`)

- Question numbers are `\textbf{2.1}`, never `\subsection`.
- Choices: `\begin{enumerate}[label=\alph*)]`, exactly 4 unless multi-select.
- Multi-select questions say **(Select ALL that apply.)** in bold on the question line.
- `\vspace{5mm}` between questions.
- Group questions by topic with a `% --- Topic ---` comment.
- Numbering continues across `\newpage`.

## Part III - Fill in the Blanks (`questions-fillblanks.tex`)

- Question numbers are `\textbf{3.1}`.
- Blanks via `\blank{...}` only, including inside math: `$b = \blank{3.5cm} \pmod{q}$`.
- Hints and constraints go in parentheses at the end of the sentence
  ("(Use passive voice.)", "(Answer in order.)").
- A blank may be driven by a small table; centre the table between `\vspace{2mm}` pairs.
- `\vspace{4mm}` between questions. No answer boxes.

## Part IV - Code Analysis (`questions-code.tex`)

- `\subsection*{Problem 4.1}` per code problem, `(a) (b) (c)` sub-parts inside.
- Code in `\begin{lstlisting}[language=Python]` - the language is mandatory.
  Line numbers are on globally; do not re-configure `lstset`.
- The code is for reading. Students answer in the `\vspace` below each sub-part.
- Typical progression: identify the defect -> trace a hostile input -> rewrite the code.

## Part V - Written / Free Response (`questions-written.tex`)

- `\subsection*{Question 1}`, sub-parts `label=(\alph*)`.
- Display math with `$$ ... $$`.
- State explicitly what a complete answer must contain.
- `\newpage` before any question that will not fit on the remaining page.

## Part VI - Case Study (`questions-casestudy.tex`)

- Opens with a boxed instruction:
  `\fbox{\parbox{0.9\textwidth}{...}}` stating how many scenarios to choose, the
  penalty for choosing more than one, and the rubric split.
- `\subsubsection*{Scenario A --- Title}`, 3 to 5 scenarios.
- Structure: **Context** -> numbered sequence of events -> **Your Task** with (a)(b)(c).
- Equal difficulty, equal space (usually `\vspace{120mm}`), one scenario per page.

## Part VII - System Design (`questions-design.tex`)

- One scenario integrating most of the course.
- Background in `\noindent\fbox{\parbox{\dimexpr\textwidth-2\fboxsep-2\fboxrule\relax}{...}}`
  (a plain `\parbox{\textwidth}` overflows the margin by 6.8 pt) with an itemized list of
  **quantified** requirements (events/sec, latency bounds, tenant counts, privacy rules).
- Sub-questions `(a)(b)(c)(d)`, each with a bold title line and a bullet list of the
  specific things to address. Each targets a different topic.
- `\vspace{85mm}`-`\vspace{90mm}` after each sub-question.
- Close with a failure / trade-off sub-question.

## Answer-space sizing

| Expected answer | `\vspace` |
|---|---|
| one-line recall, a choice + justification | 20-30 mm |
| short explanation, identify-and-classify | 35-40 mm |
| derivation, multi-step computation | 45-60 mm |
| rewrite a function | 60-70 mm |
| full essay answer | 80-90 mm |
| case study / design sub-question | 85-140 mm |

Rule of thumb: a student writes about 6 lines per 25 mm. When in doubt, give more -
a cramped answer box is the most common complaint about a mock exam.

## Page discipline

- The cover has no header and no page number (`\pagenumbering{gobble}`); question
  pages carry the `exampage` header and a centred page number.
- Each part starts on a fresh page (`\newpage` between `\input` lines in `main.tex`).
- Never let a question's stem sit on one page and its answer space on the next.
  Insert `\newpage` before it instead.
- After compiling, put the **real** page count on the cover.
