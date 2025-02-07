output "cluster_name" {
  value = aws_eks_cluster.my_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.my_cluster.certificate_authority[0].data
}

output "node_group_1_id" {
  value = aws_eks_node_group.node_group_1.id
}

output "node_group_2_id" {
  value = aws_eks_node_group.node_group_2.id
}