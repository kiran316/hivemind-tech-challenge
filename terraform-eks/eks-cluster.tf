module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.5"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  cluster_addons = [
    {
      addon_name        = "vpc-cni"
      addon_version     = "v1.18.0-eksbuild.1"
      cluster_name      = local.cluster_name
      resolve_conflicts = "OVERWRITE"
    },
    {
      addon_name        = "kube-proxy"
      addon_version     = "v1.29.3-eksbuild.2"
      cluster_name      = local.cluster_name
      resolve_conflicts = "OVERWRITE"
    },
    {
      addon_name        = "coredns"
      addon_version     = "v1.11.1-eksbuild.4"
      cluster_name      = local.cluster_name
      resolve_conflicts = "OVERWRITE"
    }
  ]

  enable_irsa = true

  tags = {
    cluster = "demo"
  }

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id] # Ensure this security group allows necessary communication
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }
}
