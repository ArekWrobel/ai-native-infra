output "registry_host" {
  description = "OVH private registry host"
  value       = local.registry_host
}

output "npm_registry_url" {
  description = "Private npm registry URL"
  value       = local.npm_registry_url
}

output "npm_login_command" {
  description = "Command to configure npm auth for local publishing"
  value       = "npm config set registry ${local.npm_registry_url} && npm config set //${local.registry_host}/${local.npm_repository}/:_authToken $OVH_NPM_TOKEN"
}
