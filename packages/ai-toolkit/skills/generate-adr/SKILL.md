---
name: generate-adr
description: >
  Use this skill when the user asks to write architecture decision records,
  convert decisions into ADR format, or update ADR documentation for a codebase.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Generate ADR

Create Architecture Decision Records that capture context, decision, and
consequences in a repository-friendly markdown format.

## Workflow

1. Confirm the decision scope, status, and affected system area.
2. Check existing ADR numbering in `docs/adr/` before assigning a new ID.
3. Draft the ADR using the bundled template.
4. Include repository-specific evidence, tradeoffs, and operational consequences.
5. Prefer one ADR per decision. Split unrelated decisions.

## Output

- A new or updated ADR markdown file in `docs/adr/`
- Clear sections for status, context, decision, and consequences

## Resources

- Use [assets/adr-template.md](assets/adr-template.md) for the default structure
- Refer to [references/example-adr.md](references/example-adr.md) for tone and brevity
