## Common ##
variable "region" {
  default = "us-east-1"
}

variable "organization" {
  default = "skymars"
}
variable "application_id" {
  default = "sm-3002"
}
variable "app_name" {
  default = null
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
  default = 8080
}

variable "cpu" {
  type    = number
  default = 10
}

variable "memory" {
  type    = number
  default = 512
}

variable "ecs_task_definition_family" {
  type = string
}
variable "container_definitions_file_path" {
  type = string
}
variable "task_role" {
  type    = string
  default = null
}
variable "execution_role" {
  type    = string
  default = null
}
variable "docker_image_app" {
  type    = string
  default = null
}
variable "docker_image_logger" {
  type    = string
  default = null
}
variable "subnet_names" {
  type = list(string)
}
variable "primary_region" {
  type = string
}