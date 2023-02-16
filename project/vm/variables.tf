variable "location" {
  description = "Region of resources"
  type        = string
  default     = "Brazil South"
}

variable "resource_group" {
  description = "Resource Group Name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet Id"
  type        = string
}

variable "network_security_group_id" {
  description = "Network Security Group Id"
  type        = string
}

variable "default_tags" {
  description = "Tags"
  type        = map(string)
}