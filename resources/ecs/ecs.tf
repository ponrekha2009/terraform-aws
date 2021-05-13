
module "s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name    = "${var.application_id}-${var.environment}"
  s3_versioning  = true
  application_id = var.application_id
  app_name       = var.app_name
  environment    = var.environment
  organization   = var.organization
}

module "ecs_cluster" {
  source = "../../modules/ecs_cluster"
}

module "ecs_task_definition" {
  source     = "../../modules/ecs_task_definition"
  depends_on = [module.ecs_cluster]

  app_name       = var.app_name
  task_role      = var.task_role
  execution_role = var.execution_role

  created_by                      = var.created_by
  environment                     = var.environment
  organization                    = var.organization
  ecs_task_definition_family      = var.ecs_task_definition_family
  container_definitions_file_path = var.container_definitions_file_path
  docker_image_app                = var.docker_image_app
  docker_image_logger             = var.docker_image_logger
  primary_region                  = var.primary_region
}

module "ecs_service" {
  source        = "../../modules/ecs_service"
  name          = "${var.app_name}-${var.environment}"
  cluster_name  = module.ecs_cluster.arn
  desired_count = var.desired_count

  port                 = [var.container_port]
  container_name       = var.app_name
  task_definition      = module.ecs_task_definition.arn
  app_name             = var.app_name
  created_by           = var.created_by
  environment          = var.environment
  organization         = var.organization
  subnet_names         = var.subnet_names
  security_group_names = ["allow_all"]
  depends_on           = [module.ecs_task_definition]
}
