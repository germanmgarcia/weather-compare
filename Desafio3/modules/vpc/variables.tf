variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "env" {
  description = "Deployment environment of the application"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones in which to place subnets."
  type        = list(string)
}
