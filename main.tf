<<<<<<< HEAD
provider "aws" {
  region = "ap-south-1"
=======
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.3.0"
>>>>>>> 64ce9e7114bd9ee3cf831a5525dc3c25a48025b6
}

provider "aws" {
  region = "ap-south-1"
}

# Create a simple VPC for EKS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false
}

# Create EKS cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.5"

  cluster_name    = "hello-world-cluster"
  cluster_version = "1.27"

  cluster_endpoint_public_access = true

  vpc_id  = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    default = {
<<<<<<< HEAD
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "t2.micro"
=======
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.micro"]
>>>>>>> 64ce9e7114bd9ee3cf831a5525dc3c25a48025b6
    }
  }
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "kubeconfig" {
  value     = module.eks.kubeconfig
  sensitive = true
}
