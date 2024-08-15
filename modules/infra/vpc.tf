resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block

  tags = var.tags
}


# internet gateway
resource "aws_internet_gateway" "internet_gateway_web" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# private subnet 
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.private_subnet_1_az

  tags = {
    Name = var.private_subnet_1_name
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.private_subnet_2_az

  tags = {
    Name = var.private_subnet_2_name
  }
}




resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az


  tags = {
    Name = "sagar_pub_subnet1"
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.main_vpc.id
  availability_zone       = var.public_subnet_2_az
  cidr_block = var.public_subnet_2_cidr


  tags = {
    Name = "sagar_pub_subnet2"
  }
}






resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_web.id
  }
  tags = {
    Name = var.public_route_name
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_web.id
  }
  tags = {
    Name = var.private_route_name
  }
}

resource "aws_route_table_association" "public_asso" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
  depends_on     = [aws_subnet.public_subnet_1, aws_route_table.public_route]
}

resource "aws_route_table_association" "public_asso_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route.id
  depends_on     = [aws_subnet.public_subnet_2, aws_route_table.public_route]
}

resource "aws_route_table_association" "private_asso" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route.id
  depends_on     = [aws_subnet.private_subnet_1, aws_route_table.private_route]
}

resource "aws_route_table_association" "private_asso_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route.id
  depends_on     = [aws_subnet.private_subnet_2, aws_route_table.private_route]
}

resource "aws_nat_gateway" "nat_web" {
  connectivity_type = var.connectivity_type
  subnet_id         = aws_subnet.public_subnet_1.id
  allocation_id     = aws_eip.eip_web.id

  tags = var.tags

  depends_on = [aws_eip.eip_web]
}

resource "aws_eip" "eip_web" {
  domain = var.domain
}
