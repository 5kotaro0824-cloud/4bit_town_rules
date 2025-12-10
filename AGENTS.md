# AGENTS

Repository guide for automation and LLM agents. Save this file and all markdown in UTF-8.

- **Project**: Japanese rulebook for the board game "4bitタウン". The definitive assembled text is `README.md`, generated from section files `00_*.md` through `11_*.md`.
- **Do not edit `README.md` directly**. Update the corresponding section file(s) instead, then regenerate.
- **Regeneration**: `powershell -ExecutionPolicy Bypass -File .\generate_readme.ps1`. The script concatenates numbered section files (sorted by filename) into `README.md` with UTF-8 output.
- **Editing style**: keep headings and numbering (`## n.`), preserve existing bold/quote/list formatting, and maintain Japanese punctuation/wording. Use plain ASCII symbols unless Japanese text requires otherwise.
- **File naming**: new sections should follow the `NN_title.md` pattern with zero-padded indices to keep ordering stable.
- **Content dependencies**: when changing locations, actions, or buildings, ensure consistency between sections (e.g., place effects in `09_*.md` and the mapping table in `11_*.md`). No external build/test steps beyond regenerating the README.
