---
name: generate-c4-model
description: >
  Use this skill when the user asks to build a C4 model, infer system context
  and containers from code, or write C4 architecture artifacts for a repository.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: architecture
---

# Generate C4 Model

Infer a C4 model from repository evidence and produce text-based architecture
artifacts that can be reviewed in version control.

## Workflow

1. Identify actors, systems, containers, and components from the codebase and docs.
2. Separate confirmed elements from assumptions. Label inferred relationships clearly.
3. Prefer repository names over generic labels.
4. When diagrams are requested, coordinate with `$generate-plantuml-diagrams`.

## Output

- System context, container, and component summaries
- Inputs suitable for PlantUML or other text-based diagram generation

## Resources

- Use [assets/container-template.puml](assets/container-template.puml) as the default container-diagram scaffold
