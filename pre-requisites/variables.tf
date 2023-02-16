variable "location" {
  description = "Region of resources"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "Storage tier account"
  type        = string
  default     = "Standard"
}

variable "azure_replication_type" {
  description = "Replication type of storage account"
  type        = string
  default     = "LRS"
}
