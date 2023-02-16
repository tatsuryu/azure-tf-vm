variable "location" {
  description = "Region of resources"
  type        = string
  default     = "Brazil South"
}

variable "resource_group" {
  description = "Resource Group Name"
  type        = string
  default     = "terraform_state_resource_group"
}
