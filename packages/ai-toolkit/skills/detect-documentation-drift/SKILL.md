---
name: detect-documentation-drift
description: >
  Use this skill when the user asks to detect architecture documentation drift,
  compare repository code with docs, or find inconsistencies between documented
  and implemented system behavior.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Detect Documentation Drift

Compare architecture documentation against repository evidence and report
mismatches that should be fixed.

## Workflow

1. Gather the relevant docs from `docs/`, `templates/`, and any architecture notes the user points to.
2. Inspect the current codebase for actual modules, entry points, and observable behaviors.
3. Report every mismatch with a concrete file reference on both sides when possible.
4. Separate confirmed drift from missing evidence. Do not speculate beyond what the repository supports.

## Output

- `Drift findings` with severity, doc path, implementation path, and recommended fix
- `Missing evidence` when a document makes a claim that cannot be verified from the repository
- `Aligned areas` only when useful to show what does not need work
