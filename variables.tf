variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"  # Change this as needed
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for the first public subnet"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for the second public subnet"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
}

variable "trust_subnet_cidr_1" {
  description = "CIDR block for the first private subnet"
  type        = string
}

variable "trust_subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
}


variable "availability_zone_1" {
  description = "Availability zone for the first subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for the second subnet"
  type        = string
}

# variable "ami" {
#   description = "AMI ID for the instances"
#   type        = string
# }

# variable "instance_type" {
#   description = "Instance type for the EC2 instances"
#   type        = string
# }

# variable "instance_count" {
#   description = "Number of instances to launch"
#   type        = number
#   default     = 2
# }

# variable "s3_bucket_name" {
#   description = "Name of the S3 bucket for CodePipeline"
#   type        = string
# }

variable "public_subnet_1" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "public_subnet_2" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "private_subnet_1" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "private_subnet_2" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "trust_subnet_1" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

variable "trust_subnet_2" {
  description = "The subnet ID where the instances will be created"
  type        = string
}

# variable "family" {
#   description = "Family of the ECS task"
#   type        = string
# }

# variable "cpu" {
#   description = "CPU units for the task"
#   type        = string
# }

# variable "memory" {
#   description = "Memory for the task"
#   type        = string
# }

# variable "container_name" {
#   description = "Name of the container"
#   type        = string
# }

# variable "container_port" {
#   description = "Port for the container"
#   type        = number
# }

# variable "container_image" {
#   description = "Port for the container"
#   type        = string
# }


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

variable "region" {
  description = "The AWS region to deploy the EKS cluster"
  type        = string
}

# variable "vpc_id" {
#   description = "The VPC ID where the EKS cluster will be deployed"
#   type        = string
# }

# variable "subnet_ids" {
#   description = "The subnet IDs for the EKS cluster"
#   type        = list(string)
# }
