module "eks" {
  source          = "./modules/application/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  node_groups     = var.node_groups
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_groups" {
  description = "Configuration for the EKS node groups"
  type = list(object({
    name          = string
    instance_type = string
    min_size      = number
    max_size      = number
  }))
}