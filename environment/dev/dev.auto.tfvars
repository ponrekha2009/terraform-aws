environment    = "dev"
aws_account    = "006406332845"
primary_region = "us-east-1"
created_by     = "Palani"
//task_role               = "arn:aws:iam::006406332845:role/ecs-task-execution-role"
task_role               = "arn:aws:iam::006406332845:role/ecs_task_role"
execution_role          = "arn:aws:iam::006406332845:role/ecsTaskExecutionRole"
docker_image_booksapp   = "006406332845.dkr.ecr.us-east-1.amazonaws.com/palani/booksapp:v5"
docker_image_financeapp = "006406332845.dkr.ecr.us-east-1.amazonaws.com/palani/financeapp:v5"
docker_image_logger     = "006406332845.dkr.ecr.us-east-1.amazonaws.com/palani/custom-fluent-bit-config:v5"

create_ecs_cluster         = true
deploy_ecs_task_booksapp   = false
deploy_ecs_task_financeapp = true

create_eks_cluster = false

create_ecr_repos     = false
create_vpc_endpoints = false

subnet_names = ["primary_dmz_subnet_10.0.1.0/24", "secondary_dmz_subnet_10.0.2.0/24"]
ecr_repo_names = [
  "palani/custom-fluent-bit-config",
  "palani/booksapp",
  "palani/financeapp"
]

interface_vpc_endpoints = [
  "com.amazonaws.us-east-1.logs",
  "com.amazonaws.us-east-1.ecr.api",
  "com.amazonaws.us-east-1.ecr.dkr",
  "com.amazonaws.us-east-1.events",
  "com.amazonaws.us-east-1.kinesis-firehose",
  "com.amazonaws.us-east-1.kinesis-streams",
  "com.amazonaws.us-east-1.monitoring"
]

log_groups_list = [
  {
    log_group_name  = "/aws/ecs/fargate/cluster/container_logs",
    log_stream_name = "container-logs"
  },
  {
    log_group_name  = "/aws/ecs/fargate/apache_logs",
    log_stream_name = "apache_logs"
  },
  {
    log_group_name  = "/aws/ecs/fargate/app_logs",
    log_stream_name = "app_logs"
  },
  {
    log_group_name  = "/aws/ecs/fargate/cluster/container-insights/performance_logs",
    log_stream_name = "performance"
  },
  {
    log_group_name  = "/logger/firehose/splunk/firehose_logs",
    log_stream_name = "firehose_logs"
  },
  {
    log_group_name  = "/aws/ecs/fargate/application",
    log_stream_name = "financeapp-service"
  }

]