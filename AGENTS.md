# AGENTS

Repository guide for automation and LLM agents. Save this file and all markdown in UTF-8.

- **Project**: Japanese rulebook for the board game "4bitタウン". The definitive assembled text is `README.md`, generated from section files `00_*.md` through `11_*.md`.
- **Do not edit `README.md` directly**. Update the corresponding section file(s) instead, then regenerate.
- **Regeneration**: After editing any section markdown (`00_*.md` – `11_*.md`), run `./generate_readme.sh` (or `powershell -ExecutionPolicy Bypass -File .\\generate_readme.ps1`) to rebuild `README.md`.
- **Editing style**: keep headings and numbering (`## n.`), preserve existing bold/quote/list formatting, and maintain Japanese punctuation/wording. Use plain ASCII symbols unless Japanese text requires otherwise.
- **File naming**: new sections should follow the `NN_title.md` pattern with zero-padded indices to keep ordering stable.
- **Content dependencies**: when changing locations, actions, or buildings, ensure consistency between sections (e.g., place effects in `09_*.md` and the mapping table in `11_*.md`). No external build/test steps beyond regenerating the README.
