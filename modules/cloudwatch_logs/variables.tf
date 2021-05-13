variable "primary_region" {
  type = string
}
variable "environment" {
  type = string
}

variable "log_groups_list" {
  type = list(object({
    log_group_name  = string
    log_stream_name = string
  }))
}
