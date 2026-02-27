# Private npm Registry — Requirements

## Goal
Create OVHcloud-oriented infrastructure configuration for a private npm registry using Terraform.

## Configuration

| Parameter | Value |
|-----------|-------|
| Registry namespace | `devs10x` (must start with a lowercase letter) |
| OVH endpoint | `ovh-eu` |
| OVH region | `GRA11` |
| Private repo name | `npm` |
| Proxy repo name | `npm-store` |
| Project name | `webinar-demo` |

### Terraform versions
- Terraform required version: `>= 1.10`
- OVH provider version: `~> 1.5`

### Notes
- This baseline keeps registry coordinates in Terraform locals/outputs.
- Publish authentication is handled in CI with npm token secrets.
