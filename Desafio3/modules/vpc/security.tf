# Creates a security group for public networks allowing HTTP, HTTPS, ICMP (ping), and SSH access

resource "aws_security_group" "vpc_pub_sg" {

  description = "Allows HTTP, HTTPS, PING, SSH"
  name        = "public_sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "HTTP for webservers"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP for webservers"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Ping"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Output from resources in Public"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}_vpc_sg"
  }

}

# Defines a security group for EKS services, allowing unrestricted ingress from the load balancer security group

resource "aws_security_group" "eks_nodes_sg" {
  vpc_id      = aws_vpc.vpc.id
  name        = "${var.app_name}-eks-nodes"
  description = "Security group for all nodes in the cluster"

  ingress {
    description = "HTTP for webservers"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP for webservers"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Ping"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Output from resources in Public"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name                                            = "${var.app_name}_service_sg"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}
