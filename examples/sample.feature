Feature: Documentation generation

Scenario: Generate architecture docs
  Given repository contains source code
  When agent analyzes repository
  Then documentation should be generated
