variable "location" {
  description = "Region of resources"
  type        = string
  default     = "Brazil South"
}

variable "resource_group" {
  description = "Resource Group Name"
  type        = string
}

variable "default_tags" {
  description = "Tags"
  type        = map(string)
}