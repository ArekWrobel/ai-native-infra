---
name: generate-plantuml-diagrams
description: >
  Use this skill when the user asks to create PlantUML architecture diagrams,
  translate architecture models into `.puml` files, or update text-based system
  diagrams in the repository.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Generate PlantUML Diagrams

Write version-control-friendly PlantUML diagrams from architecture inputs.

## Workflow

1. Start from confirmed actors, systems, containers, and relationships.
2. Keep diagrams minimal and readable before adding detail.
3. Prefer deterministic text diagrams over image exports.
4. When the diagram is a C4 view, coordinate with `$generate-c4-model`.

## Output

- `.puml` files under `docs/diagrams/`
- Short notes describing assumptions or unresolved relationships

## Resources

- Use [references/system-context-example.puml](references/system-context-example.puml) as a basic system context example
