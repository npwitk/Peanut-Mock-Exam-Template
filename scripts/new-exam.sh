#!/usr/bin/env bash
# ============================================================
# new-exam.sh — start a Peanut mock exam in a course folder
#
# Usage:  scripts/new-exam.sh <target-dir> [--no-solution]
#
# Copies the exam skeleton (and, unless --no-solution, the solution key
# skeleton) into <target-dir>. Never overwrites an existing file.
# ============================================================
set -euo pipefail

TEMPLATE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [ $# -lt 1 ]; then
    echo "usage: $(basename "$0") <target-dir> [--no-solution]" >&2
    exit 1
fi

TARGET="${1/#\~/$HOME}"
WITH_SOLUTION=1
[ "${2:-}" = "--no-solution" ] && WITH_SOLUTION=0

mkdir -p "$TARGET"

copy() {  # copy() <relative-path>
    local src="$TEMPLATE_ROOT/$1" dst="$TARGET/$1"
    if [ -e "$dst" ]; then
        echo "  skip (exists)  $1"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    cp -R "$src" "$dst"
    echo "  copied         $1"
}

echo "Peanut mock exam -> $TARGET"
copy main.tex
copy sections
copy components
copy .gitignore
[ "$WITH_SOLUTION" -eq 1 ] && copy solution

cat <<'NEXT'

Next:
  1. Replace the placeholders: XXX123, Course Name, [Midterm/Final],
     [Closed / Semi-closed / Open], duration, part count, page count,
     cheat-sheet allowance, solution URL.
  2. Comment out the \input lines in main.tex for parts you are not using,
     then renumber the remaining parts so they stay contiguous.
  3. latexmk -pdf main.tex
NEXT
