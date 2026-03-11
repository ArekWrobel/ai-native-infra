variable "ovh_endpoint" {
  description = "OVH API endpoint"
  type        = string
  default     = "ovh-eu"
}

variable "ovh_region" {
  description = "OVH Public Cloud region code (for example: GRA11, SBG5)"
  type        = string
}

variable "ovh_project_id" {
  description = "OVH Public Cloud project ID"
  type        = string
}

variable "registry_namespace" {
  description = "Namespace used as the private npm registry prefix"
  type        = string

  validation {
    condition     = can(regex("^[a-z]", var.registry_namespace))
    error_message = "Registry namespace must start with a lowercase letter."
  }
}

variable "project_name" {
  description = "Project name used for tagging/documentation"
  type        = string
}
