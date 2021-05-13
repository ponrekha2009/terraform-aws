module "caller_identity" {
  source = "../../modules/caller_identity"
}

module "network" {
  source                  = "../../modules/network"
  environment             = var.environment
  primary_region          = var.primary_region
  interface_vpc_endpoints = var.interface_vpc_endpoints
  subnet_names            = var.subnet_names
}

module "vpc_endpoint" {
  count                   = var.create_vpc_endpoints ? 1 : 0
  source                  = "../../modules/vpc_endpoint"
  environment             = var.environment
  interface_vpc_endpoints = var.interface_vpc_endpoints
  primary_region          = var.primary_region
  depends_on              = [module.network]
}
