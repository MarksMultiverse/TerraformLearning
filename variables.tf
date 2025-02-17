variable "subscription_id" {
  type        = string
  description = "The subscription ID to use for the Azure resources"
  default     = "ba416279-7011-41d0-a069-c6a8205d9232"
  sensitive   = true
}

variable "location" {
  type        = string
  description = "The location to deploy the Azure resources"
  default     = "West Europe"
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network"
  default     = "example-vnet"
}

variable "subnet_names" {
  type        = list(string)
  description = "The names of the subnets"
  default     = ["infra", "vms", "image"]
}

variable "subnet_count" {
  type        = number
  description = "The number of subnets to create"
  default     = 3
}

variable "nsg_name" {
  type        = list(string)
  description = "The names of the network security groups"
  default     = ["nsg1", "nsg2", "nsg3"]
}

variable "vnet_address_space" {
  type        = string
  description = "The address space of the virtual network"
  default     = "10.0.0.0/16"
}

# variable "subnet_address_prefixes" {
#   type        = list(string)
#   description = "The address prefixes of the subnets"
#   default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
# }

variable "Project" {
  type        = string
  description = "The project name"
  default     = "Terraform testing"
}

variable "Responsible" {
  type        = string
  description = "The responsible person"
  default     = "mark.tilleman@cegeka.com"
}

variable "rg_name" {
  type        = list(string)
  description = "The names of the resource groups for the resources"
  default     = ["mark-testRG1", "mark-testRG2", "mark-testRG3", "mark-testRG4"]
}

variable "naming_prefix" {
  type        = string
  description = "The prefix to use for naming the resources"
  default     = "mark"
}

variable "environment" {
  type        = string
  description = "The environment to deploy the resources"
  default     = "dev"
}