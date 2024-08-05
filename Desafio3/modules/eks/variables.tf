variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to use in the EKS cluster"
  type        = list(string)
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "eks_cluster_iam_role" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS node group"
  type        = string
}
