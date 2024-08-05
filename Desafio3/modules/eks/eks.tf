#create EKS Cluster eks_cluster

resource "aws_eks_cluster" "eks_cluster" {
  name = var.eks_cluster_name

  # The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations
  role_arn = var.eks_cluster_iam_role
  # Desired Kubernetes master version
  version = "1.30"
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true
    subnet_ids              = var.subnet_ids
  }
}
