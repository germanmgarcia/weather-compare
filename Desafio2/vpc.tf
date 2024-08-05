
# Creates a VPC with DNS support and hostnames enabled, not assigned an IPv6 CIDB block.

resource "aws_vpc" "vpc" {
  cidr_block                       = "10.0.0.0/23"
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "${var.env}-${var.app_name}-vpc"
  }

}

# Creates a public subnet in the first availability zone, with automatic public IP assignment.

resource "aws_subnet" "sn_pub_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/25"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-pub-az1"
  }
}

# Creates a public subnet in the second availability zone, also with automatic public IP assignment.

resource "aws_subnet" "sn_pub_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.128/26"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = true

  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-pub-az2"

  }
}


resource "aws_subnet" "sn_pub_az3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.192/26"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-pub-az3"
  }
}


resource "aws_subnet" "sn_priv_az1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/26"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = false

  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-priv-az1"
  }
}

resource "aws_subnet" "sn_priv_az2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.64/26"
  availability_zone       = "${var.aws_region}b"
  map_public_ip_on_launch = false

  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-priv-az2"
  }
}

resource "aws_subnet" "sn_priv_az3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.128/26"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = false

  tags = {
    Name                                            = "${var.env}-${var.app_name}-sn-priv-az3"
  }
}



resource "aws_eip" "nat_eip" {
  depends_on = [
    aws_internet_gateway.ig
  ]
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.sn_pub_az1.id

  tags = {
    Name = "${var.env}-${var.app_name}-nat"
  }
}



# Attaches an Internet Gateway to the VPC for internet access

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-${var.app_name}-ig"
  }
}

# Creates a route table with a default route to the internet gateway for the environment

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "${var.app_name}-rt-first"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.app_name}-rt-private"
  }
}


# Associates the first route table with public subnets for internet access

resource "aws_route_table_association" "public_subnet_asso_az1" {
  subnet_id      = aws_subnet.sn_pub_az1.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public_subnet_asso_az2" {
  subnet_id      = aws_subnet.sn_pub_az2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_asso_az3" {
  subnet_id      = aws_subnet.sn_pub_az3.id
  route_table_id = aws_route_table.public_rt.id
}



resource "aws_route_table_association" "private_subnet_asso_az1" {
  subnet_id      = aws_subnet.sn_priv_az1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_asso_az2" {
  subnet_id      = aws_subnet.sn_priv_az2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_subnet_asso_az3" {
  subnet_id      = aws_subnet.sn_priv_az3.id
  route_table_id = aws_route_table.private_rt.id
}

