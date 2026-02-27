# CI/CD Pipeline — Requirements

## Goal
GitHub Actions workflow to validate and publish the Extension Pack.

## Configuration
- Branch: `master` (not `main`)
- Registry URL secret: `OVH_NPM_REGISTRY_URL`
- Registry token secret: `OVH_NPM_TOKEN`
- Workflow file: `.github/workflows/ci.yml`
- Package location: `packages/ai-toolkit/` (relative to repo root)

### Validation checks (validate job)
1. `pack.yaml` exists with required fields: `name`, `version`, `description`, `namespace`
2. Each `skills/*/SKILL.md` has YAML frontmatter with `name` and `description`
3. Frontmatter `name` matches the skill's directory name
4. `npm pack --dry-run` succeeds

### Secrets setup
```bash
gh secret set OVH_NPM_REGISTRY_URL --body "https://<registry-host>/npm/" --repo <owner>/<repo>
gh secret set OVH_NPM_TOKEN --body "<npm-token>" --repo <owner>/<repo>
```
