
module "eks_fargate_cluster" {
  source = "../../modules/eks_fargate_cluster"

  name          = "pals-eks_fargate_cluster"
  cluster_name  = "pals-eks-cluster"
  desired_count = var.desired_count

  port                 = [var.container_port]
  container_name       = var.app_name
  app_name             = var.app_name
  created_by           = var.created_by
  environment          = var.environment
  organization         = var.organization
  subnet_names         = var.subnet_names
  security_group_names = ["allow_all"]
}

module "eks_fargate_profile" {
  source       = "../../modules/eks_fargate_profile"
  cluster_name = "pals-eks-cluster"
  name         = "pals-eks_fargate_profile"

  port                 = [var.container_port]
  container_name       = var.app_name
  app_name             = var.app_name
  created_by           = var.created_by
  environment          = var.environment
  organization         = var.organization
  subnet_names         = var.subnet_names
  security_group_names = ["allow_all"]
  depends_on = [
    module.eks_fargate_cluster
  ]
}

module "eks_node_group" {
  source       = "../../modules/eks_node_group"
  cluster_name = "pals-eks-cluster"
  name         = "pals-eks_node_group"

  port                 = [var.container_port]
  container_name       = var.app_name
  app_name             = var.app_name
  created_by           = var.created_by
  environment          = var.environment
  organization         = var.organization
  subnet_names         = var.subnet_names
  security_group_names = ["allow-all"]
  depends_on = [
    module.eks_fargate_cluster
  ]
}
