resource "aws_vpc" "vpc_example_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name        = "example-vpc-jack"
    name        = "prueba"
    Environment = "dev"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_example_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags                    = var.tags

}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_example_virginia.id
  cidr_block = var.subnets[1]
  tags       = var.tags
  depends_on = [aws_subnet.public_subnet]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_example_virginia.id
  tags = {
    Name = "example-igw-jack"
  }
}

resource "aws_route_table" "myRouteTable" {
  vpc_id = aws_vpc.vpc_example_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "example-route-table-jack"
    Environment = "dev"
  }
}

resource "aws_security_group" "mySecurityGroup" {
  vpc_id = aws_vpc.vpc_example_virginia.id
  ingress {
    description = "SSH Over internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "example-sg-jack"
    Environment = "dev"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.myRouteTable.id
}
