
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

module "ecr" {
  for_each  = var.create_ecr_repos ? toset(var.ecr_repo_names) : []
  source    = "../../modules/ecr"
  repo_name = each.value
}

module "cloudwatch_logs" {
  source          = "../../modules/cloudwatch_logs"
  log_groups_list = var.log_groups_list
  environment     = var.environment
  primary_region  = var.primary_region
}

module "kinesis_data_stream" {
  source         = "../../modules/kinesis_data_stream"
  environment    = var.environment
  primary_region = var.primary_region
}

module "kinesis_firehose" {
  source         = "../../modules/kinesis_firehose"
  environment    = var.environment
  primary_region = var.primary_region
  depends_on     = [module.kinesis_data_stream]
}

module "ecs_cluster" {
  count      = var.create_ecs_cluster ? 1 : 0
  source     = "../../modules/ecs_cluster"
  depends_on = [module.network]
}

module "ecs_financeapp" {
  count                           = var.deploy_ecs_task_financeapp ? 1 : 0
  source                          = "../../resources/ecs"
  app_name                        = "financeapp"
  ecs_task_definition_family      = "financeapp-task-definition"
  container_definitions_file_path = "../../modules/container_definitions/container_definitions_financeapp.json"
  docker_image_app                = var.docker_image_financeapp
  docker_image_logger             = var.docker_image_logger
  aws_account                     = module.caller_identity.aws_account
  execution_role                  = var.execution_role
  task_role                       = var.task_role
  depends_on                      = [module.network, module.ecs_cluster]
  subnet_names                    = var.subnet_names
  primary_region                  = var.primary_region
}

module "ecs_booksapp" {
  count                           = var.deploy_ecs_task_booksapp ? 1 : 0
  source                          = "../../resources/ecs"
  app_name                        = "booksapp"
  ecs_task_definition_family      = "booksapp-task-definition"
  container_definitions_file_path = "../../modules/container_definitions/container_definitions_booksapp.json"
  docker_image_app                = var.docker_image_booksapp
  docker_image_logger             = var.docker_image_logger
  aws_account                     = module.caller_identity.aws_account
  execution_role                  = var.execution_role
  task_role                       = var.task_role
  depends_on                      = [module.network, module.ecs_cluster]
  subnet_names                    = var.subnet_names
  primary_region                  = var.primary_region
}

module "eks" {
  count        = var.create_eks_cluster ? 1 : 0
  source       = "../../resources/eks"
  aws_account  = module.caller_identity.aws_account
  docker_image = var.docker_image_financeapp
  subnet_names = var.subnet_names
  depends_on   = [module.network]
}


