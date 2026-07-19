rgs= {
    rg1= {
        name= "rg-terraform"
        location = "centralindia"
    }
}
stgs= {
    stg1= {
        name= "stgprod000001"
        resource_group_name = "rg-terraform"
        location = "centralindia"
        account_tier = "Standard"
        account_replication_type = "LRS"
    }
}

vnets= {
    vnet1= {
        name= "vnet-terraform"
        address_space = ["10.0.0.0/16"]
        location = "centralindia"
        resource_group_name = "rg-terraform"
    }
}

subnets= {
    subnet1= {
        name= "subnet-frontend"
        resource_group_name = "rg-terraform"
        virtual_network_name = "vnet-terraform"
        address_prefixes = ["10.0.1.0/24"]
    }
    subnet2= {
        name= "subnet-backend"
        resource_group_name = "rg-terraform"
        virtual_network_name = "vnet-terraform"
        address_prefixes = ["10.0.2.0/24"]
    }
}


    pips= {
        pip1={
            name= "pip-frontend"
            location = "centralindia"
            resource_group_name = "rg-terraform"
            allocation_method = "Static"  
            sku = "Standard"  
        }
    }

vms = {
    vm1 = {
        name= "vm-frontend"
        resource_group_name = "rg-terraform"
        location = "centralindia"
        size = "Standard_d2s_v3"
        admin_username = "azureuser"
        admin_password = "Password@1234"
       
        source_image_publisher = "Canonical"
        source_image_offer = "UbuntuServer" 
        source_image_sku = "18.04-LTS"
        source_image_version = "latest"
        os_disk_caching = "ReadWrite"
        os_disk_storage_account_type = "Standard_LRS"
        name= "nic-frontend"
        location = "centralindia"
        resource_group_name = "rg-terraform"
        pip_id = "pip1"  
        subnet_id = "subnet1"
        private_ip_address_allocation = "Dynamic"
    }
}

nsgs= {
    nsg1= {
        name= "nsg-terraform"
        location = "centralindia"
        resource_group_name = "rg-terraform"
        security_rule_name = "AllowSSH"
        security_rule_priority = 100
        security_rule_direction = "Inbound"
        security_rule_access = "Allow"
        security_rule_protocol = "Tcp"
        security_rule_source_port_range = "*"
        security_rule_destination_port_range = "22"
        security_rule_source_address_prefix = "*"
        security_rule_destination_address_prefix = "*"
    }
    nsg2 = {
        name= "nsg-terraform2"
        location = "centralindia"
        resource_group_name = "rg-terraform"
        security_rule_name = "AllowHTTP"
        security_rule_priority = 200
        security_rule_direction = "Inbound"
        security_rule_access = "Allow"
        security_rule_protocol = "Tcp"
        security_rule_source_port_range = "*"
        security_rule_destination_port_range = "80"
        security_rule_source_address_prefix = "*"
        security_rule_destination_address_prefix = "*"
    }
}

subnet_nsg_associations= {
    association1= {
        subnet_id = "subnet1"
        nsg_id = "nsg1"
    }
    association2= {
        subnet_id = "subnet2"
        nsg_id = "nsg2"
    }
}