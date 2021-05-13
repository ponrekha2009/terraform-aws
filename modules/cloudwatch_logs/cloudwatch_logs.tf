resource "aws_cloudwatch_log_group" "log_group" {
  for_each          = { for lg in var.log_groups_list : lg.log_group_name => lg }
  name              = "${var.environment}${each.value.log_group_name}"
  retention_in_days = 1
  tags = {
    Name        = each.value.log_group_name
    Environment = var.environment
  }
}

resource "aws_cloudwatch_log_stream" "log_stream" {
  for_each       = { for lg in var.log_groups_list : lg.log_group_name => lg }
  name           = each.value.log_stream_name
  log_group_name = aws_cloudwatch_log_group.log_group[each.key].name
  depends_on     = [aws_cloudwatch_log_group.log_group]
}

