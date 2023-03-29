output "azure-subnet-id" {
    value = {
        for id  in keys(var.subnet) : id => azurerm_subnet.subnet[id].id
    }
    description = "Lists the ids of subnets"
}

output "bastion-public-ip" {
  value = azurerm_public_ip.bastion_pip.ip_address
  description = "List the public ip of the bastion host"
}