# Agentic Architecture Documentation System

This repository is structured as a Codex-installable skill pack.

The canonical installable content lives under
`packages/ai-toolkit/skills/<skill-name>/` where each skill contains:

- `SKILL.md` with trigger metadata and workflow instructions
- `agents/openai.yaml` with UI metadata for Codex skill lists
- optional `assets/` or `references/` files needed by that skill

Included skills:

- `build-traceability-matrix`
- `code-review`
- `detect-documentation-drift`
- `extract-behaviors-from-bdd`
- `generate-adr`
- `generate-arc42-documentation`
- `generate-c4-model`
- `generate-plantuml-diagrams`

The npm package in `packages/ai-toolkit/` installs those skills into a target
project via `ai-toolkit install`.

Supporting examples remain in the repository root under `docs/`, `examples/`,
and `templates/`, but the packaged skills are self-contained.
