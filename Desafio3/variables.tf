variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "env" {
  description = "Application environment"
  type        = string
}

# ------------------- VPC ----------------------

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in which to place subnets."
  type        = list(string)
}

# ------------------- EKS ----------------------

variable "eks_cluster_iam_role" {
  description = "IAM role ARN for the EKS cluster."
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS node group."
  type        = string
}

