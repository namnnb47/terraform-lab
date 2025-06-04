module "eks" {
  source               = "./modules/compute/eks"
  cluster_name         = var.cluster_name
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  node_group_role_arn  = module.iam.eks_node_group_role_arn
  subnet_ids           = module.subnet.public_subnet_ids
  desired_size         = 0
  min_size             = 0
  max_size             = 3
  instance_type        = "t3.medium"
}