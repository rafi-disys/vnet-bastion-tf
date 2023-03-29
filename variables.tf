variable "rg-name" {
  type        = string
  description = "resource group name"
  default     = "test-rg"
}

variable "location" {
  type        = string
  description = "Region for deployment"
  default     = "South India"
}

variable "tags" {
  type        = map(string)
  description = "Tags used for deployment"
  default = {
    Environment = "Lab"
    Owner       = "Rafi"
  }
}

variable "vnet-name" {
  type        = string
  description = "Virtual network name"
  default     = "test-vnet"
}

variable "vnet-address-space" {
  type        = list(any)
  description = "(optional) describe your variable"
  default     = ["10.100.0.0/16"]
}
variable "subnet" {
  type        = map(any)
  description = "(optional) describe your variable"
  default = {
    subnet1 = {
      name             = "subnet1"
      address_prefixes = ["10.100.1.0/24"]
    },
    subnet2 = {
      name             = "subnet1"
      address_prefixes = ["10.100.2.0/24"]
    },
    subnet3 = {
      name             = "subnet1"
      address_prefixes = ["10.100.3.0/24"]
    },
    bastion_subnet = {
        name = "AzureBastionSubnet"
        address_prefixes = "10.100.250.0/24"
    }
  }
}

variable "bastionhostname" {
    type = string
    description = "bastion host name"
    default = "test-BastionHost"
}
