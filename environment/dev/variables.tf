variable "primary_region" {
  type = string
}
variable "organization" {
  default = "skymars"
}
variable "application_id" {
  default = "sm-3002"
}
variable "app_name" {
  default = "banksapp"
}
variable "aws_account" {
  type = string
}

variable "created_by" {
  type    = string
  default = "Palani"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "desired_count" {
  type    = number
  default = 1
}
variable "container_port" {
  type    = number
  default = 8008
}

variable "execution_role" {
  type    = string
  default = null
}
variable "task_role" {
  type    = string
  default = null
}

variable "docker_image_booksapp" {
  type = string
}
variable "docker_image_financeapp" {
  type = string
}
variable "docker_image_logger" {
  type = string
}

variable "cpu" {
  type    = number
  default = 10
}
variable "memory" {
  type    = number
  default = 512
}
variable "subnet_names" {
  type = list(string)
}
variable "interface_vpc_endpoints" {
  type = list(string)
}
variable "ecr_repo_names" {
  type = list(string)
}
variable "log_groups_list" {
  type = list(object({
    log_group_name  = string
    log_stream_name = string
  }))
}
variable "create_ecs_cluster" {
  type    = bool
  default = false
}

variable "deploy_ecs_task_booksapp" {
  type    = bool
  default = false
}
variable "deploy_ecs_task_financeapp" {
  type    = bool
  default = false
}
variable "create_eks_cluster" {
  type    = bool
  default = false
}
variable "create_vpc_endpoints" {
  type    = bool
  default = false
}
variable "create_ecr_repos" {
  type    = bool
  default = false
}
