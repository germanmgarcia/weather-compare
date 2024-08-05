module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_block
  env                = var.env
  app_name           = var.app_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  eks_cluster_name   = var.eks_cluster_name
}


module "eks" {
  source               = "./modules/eks"
  subnet_ids           = module.vpc.subnet_ids
  eks_cluster_name     = var.eks_cluster_name
  app_name             = var.app_name
  eks_cluster_iam_role = var.eks_cluster_iam_role
  node_role_arn        = var.node_role_arn
}
