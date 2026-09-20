# Building a Peanut Exam

## Local

```bash
latexmk -pdf main.tex                 # exam paper  -> main.pdf
cd solution && latexmk -pdf main.tex  # solution key -> solution/main.pdf
latexmk -c                            # clean aux files
```

Requires a full TeX distribution (MacTeX / TeX Live). Packages used beyond the base:
`geometry`, `enumitem`, `fancyhdr`, `listings`, `xcolor`, `tcolorbox`, `booktabs`,
`tabularx`, `multicol`, `svg`, `tikz`, `hyperref`, `upquote`, `ulem`.

`\usepackage[inkscapelatex=false]{svg}` needs Inkscape on `PATH` **only if** an `.svg`
is actually included; with no `\includesvg` in the document it is inert. Drop the line
if Inkscape is not installed and no SVG is used.

## Overleaf

Upload the repository as a project. Set the main document to `main.tex`.
For the solution key, upload `solution/` as its own project **together with a copy of
`components/`**, or move `solution/main.tex` to the project root - Overleaf resolves
`\graphicspath{{../}{./}}` only within the project tree.

## Starting a new course exam

```bash
scripts/new-exam.sh "~/.../CSS451 - Cloud Computing/Mock Exam/Final"
```

This copies `main.tex`, `sections/`, `components/`, `solution/`, and `.gitignore` into
the target folder, leaving this repository untouched.

## Page-budget check

After the first successful compile:

1. `pdfinfo main.pdf | grep Pages` (or open the PDF) - note the real page count.
2. Write that number into the cover's directions ("approximately **N pages**").
3. Scan for orphaned question stems: any page whose last line is a question with its
   answer space on the next page needs a `\newpage` before it.
4. Confirm no part ends mid-page followed by the next part's heading - parts start on
   fresh pages.
