provider "aws" {
  region = "ap-south-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "hello-world-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"] # Replace with your VPC subnets
  vpc_id          = "vpc-xxxxxxxx" # Replace with your VPC ID

  node_groups = {
    default = {
      desired_capacity = 1
      max_capacity     = 2
      min_capacity     = 1
      instance_type    = "t2.micro"
    }
  }
}

output "kubeconfig" {
  value = module.eks.kubeconfig
  sensitive = true
}
