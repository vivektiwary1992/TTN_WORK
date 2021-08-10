
resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc-fullcidr

  #### this 2 true values are for use the internal vpc dns resolution
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ion-vpc"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.mainvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Custom route"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.PublicAZA.id
  route_table_id = aws_route_table.RT.id
}
