# - Create Resource Groups and assign mandatory tags

module "resource-groups" {
    source = "./modules/resource-group"
    
}
    
module "virtual-networks" {
    source = "./modules/virtual-network"
    depends_on = [
      module.resource-groups
    ]
}

module "storage-accounts" {
   source = "./modules/storage-account"
   depends_on = [
     module.resource-groups
   ]
}

module "keyvaults" {
   source = "./modules/keyvault"
   depends_on = [
     module.resource-groups
   ]
}

module "virtual-machines" {
   source = "./modules/virtual-machine"
   key_vault_id = module.keyvaults.key_vault_id
   depends_on = [module.keyvaults,module.virtual-networks]
}
