resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn
  vpc_config {
    subnet_ids = var.subnet_ids
  }
  depends_on = [aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy]
}

resource "aws_eks_node_group" "node_group_1" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_1_name
  node_role_arn   = aws_iam_role.node_role.arn

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  subnet_ids = var.subnet_ids
}

resource "aws_eks_node_group" "node_group_2" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_2_name
  node_role_arn   = aws_iam_role.node_role.arn

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  subnet_ids = var.subnet_ids
}

resource "aws_iam_role" "node_role" {
  name = var.node_role_arn

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}