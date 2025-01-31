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
  default     = ["subnet1", "subnet2"]
}

variable "nsg1_name" {
  type        = string
  description = "The name of the first network security group"
  default     = "nsg1"
}

variable "nsg2_name" {
  type        = string
  description = "The name of the second network security group"
  default     = "nsg2"
}

variable "vnet_address_space" {
  type        = string
  description = "The address space of the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The address prefixes of the subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

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

variable "network_rg_name" {
  type        = string
  description = "The name of the resource group for the network resources"
  default     = "mark-testRG1"
}