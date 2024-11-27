output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}

# output "terraform-lab-servers" {
#   value = module.ec2.terraform-lab-server[*].private_ip
# }

# output "bastion" {
#   value = module.ec2.bastion.public_ip
# }

output "s3_bucket_id" {
  value = module.s3.s3_bucket_id
}

# output "cloudfront_domain_name" {
#   value = module.cloudfront.cloudfront_domain_name
# }

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

# output "ecr_repository_url" {
#   value = module.ecr.repository_url
# }

# output "codecommit_repository_url" {
#   value = module.codecommit.repository_clone_url_http
# }

# output "codebuild_project_name" {
#   value = module.codebuild.codebuild_name
# }

# output "codepipeline_id" {
#   value = module.codepipeline.pipeline_name
# }
