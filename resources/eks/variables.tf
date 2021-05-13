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
variable "docker_image" {
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