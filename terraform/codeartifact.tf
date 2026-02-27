locals {
  npm_repository       = "npm"
  npm_proxy_repository = "npm-store"

  # OVH does not expose an npm-specific Terraform resource in this project.
  # We model registry coordinates here and use them in CI/CD and outputs.
  registry_host    = "${var.registry_namespace}.${var.ovh_region}.containers.ovh.net"
  npm_registry_url = "https://${local.registry_host}/${local.npm_repository}/"
}
