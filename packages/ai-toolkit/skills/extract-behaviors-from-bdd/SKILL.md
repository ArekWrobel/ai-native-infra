---
name: extract-behaviors-from-bdd
description: >
  Use this skill when the user asks to parse Gherkin or BDD feature files,
  derive runtime scenarios from them, or summarize behavior coverage from
  repository features.
license: MIT
metadata:
  author: team
  version: "1.0.0"
  category: analysis
---

# Extract Behaviors From BDD

Extract observable system behaviors from Gherkin features and translate them
into concise runtime scenarios.

## Workflow

1. Read the relevant `.feature` files.
2. For each scenario, capture actors, preconditions, trigger, and expected outcome.
3. Normalize duplicates while preserving file references.
4. Flag missing acceptance criteria, ambiguous steps, and scenarios that lack system-level outcomes.

## Output

- A scenario list grouped by feature
- Optional coverage notes about missing or weakly specified behaviors

## Resources

- Use [assets/feature-template.feature](assets/feature-template.feature) as the canonical feature structure
