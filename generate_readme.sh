#!/usr/bin/env bash
set -euo pipefail

# This script generates README.md from all section Markdown files.
# Usage:
#   ./generate_readme.sh

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

shopt -s nullglob
section_files=( "$script_dir"/[0-9][0-9]_*.md )
shopt -u nullglob

if [ ${#section_files[@]} -eq 0 ]; then
  echo "No section markdown files (like 00_*.md) were found." >&2
  exit 1
fi

mapfile -t sorted_files < <(printf '%s\n' "${section_files[@]##*/}" | sort)

readme_path="$script_dir/README.md"

{
  printf "# 4bit Town Rulebook\n\n"
  printf "> This README.md is generated from section markdown files (00_*.md – 11_*.md).\n"
  printf "> Do not edit README.md directly. Edit the section files and rerun \`generate_readme.sh\`.\n\n"
} > "$readme_path"

for file in "${sorted_files[@]}"; do
  {
    printf "\n---\n\n<!-- %s -->\n" "$file"
    cat -- "$script_dir/$file"
  } >> "$readme_path"
done

echo "README.md has been updated."
