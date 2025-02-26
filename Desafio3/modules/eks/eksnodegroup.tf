
resource "aws_eks_node_group" "node_group" {
  # Name of the EKS Cluster
  cluster_name = var.eks_cluster_name

  # Name of the EKS Node Group.
  node_group_name = "${var.app_name}-node_group"

  # Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group.
  node_role_arn = var.node_role_arn

  # Identifiers of EC2 Subnets to associate with the EKS Node Group. 
 
  subnet_ids = var.subnet_ids

  # Configuration block
  scaling_config {
    # Required number of worker nodes
    desired_size = 2

    # Maximum number of worker nodes
    max_size = 2

    # Minimum number of worker nodes
    min_size = 2
  }

  # Type of Amazon Machine Image (AMI) associated with the EKS Node Group

  ami_type = "AL2_x86_64"

  # Type of capacity associated with the EKS Node Group

  capacity_type = "ON_DEMAND"

  # Disk size in GB for worker nodes
  disk_size = 20

  # Force version update if existing pods are unable to be drained due to a pod disruption budget issue
  force_update_version = false

  # Instance type associated with the EKS Node Group
  instance_types = ["t3.small"]

  labels = {
    role = "${var.app_name}-Node-group-role",
    name = "${var.app_name}-node_group"
  }

  # Kubernetes version
  version = "1.30"
}
