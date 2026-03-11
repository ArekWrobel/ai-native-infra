---
name: build-traceability-matrix
description: >
  Use this skill when the user asks to build a requirements traceability
  matrix, map requirements to BDD scenarios and code, or generate RTM
  documentation for a repository.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Build Traceability Matrix

Create or update a requirements traceability matrix that links requirements,
BDD scenarios, architecture artifacts, and code evidence.

## Inputs

- Requirement sources in `docs/`, `context/`, or issue text provided by the user
- BDD features in `examples/` or the repository test suite
- Architecture docs in `docs/`
- Repository code and module names

## Workflow

1. Identify the requirement sources and assign stable requirement IDs if none exist.
2. Extract matching BDD scenarios and quote the scenario title or file path.
3. Map each requirement to code or documentation evidence with repository paths.
4. Write or update `docs/traceability/rtm.md` using the bundled template as the starting point.
5. Call out gaps explicitly when a requirement has no BDD coverage, no architecture artifact, or no code evidence.

## Output

- A markdown table with columns for requirement, scenario, architecture artifact, and implementation evidence
- A short gaps section listing missing links or stale entries

## Resources

- Use [references/rtm-example.md](references/rtm-example.md) for the expected table shape
