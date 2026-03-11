---
name: generate-arc42-documentation
description: >
  Use this skill when the user asks to generate arc42 documentation, draft
  architecture sections from code and ADRs, or refresh an arc42-style system
  description.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Generate arc42 Documentation

Produce arc42-style architecture documentation grounded in repository evidence.

## Workflow

1. Collect available architecture inputs: C4 artifacts, ADRs, BDD behaviors, and repository structure.
2. Draft only the sections supported by evidence. Mark unknowns instead of inventing them.
3. Keep the narrative aligned with source paths, component names, and existing decision records.
4. When refreshing existing docs, preserve section order and rewrite stale claims rather than appending duplicates.

## Output

- Markdown documentation under `docs/arc42/`
- Section-level notes about missing evidence or follow-up work when information is incomplete
