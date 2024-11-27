module "ecs_cluster" {
  source          = "../../modules/application/ecs_cluster"
  cluster_name    = "terraform-dev-ecs-cluster"
}