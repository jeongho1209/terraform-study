resource "aws_vpc" "my_vpc" {
  cidr_block = local.vpc_cidr_block

  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "${local.name_prefix}-igw"
  }
}

resource "aws_subnet" "public_my_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.subnet_1_cidr_block
  availability_zone = "${local.region}a"

  tags = {
    Name = "public-${local.name_prefix}-subnet-1"
  }
}

resource "aws_subnet" "private_my_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.subnet_2_cidr_block
  availability_zone = "${local.region}a"

  tags = {
    Name = "private-${local.name_prefix}-subnet-1"
  }
}

resource "aws_subnet" "public_my_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.subnet_3_cidr_block
  availability_zone = "${local.region}c"

  tags = {
    Name = "public-${local.name_prefix}-subnet-2"
  }
}

resource "aws_subnet" "private_my_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = local.subnet_4_cidr_block
  availability_zone = "${local.region}c"

  tags = {
    Name = "private-${local.name_prefix}-subnet-2"
  }
}

resource "aws_route_table" "my_route_table_1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = local.route_table_cidr_block
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-${local.name_prefix}-route-table-1"
  }
}

resource "aws_route_table" "my_route_table_2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = local.route_table_cidr_block
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "private-${local.name_prefix}-route-table-2"
  }
}

resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.public_my_subnet_1.id
  route_table_id = aws_route_table.my_route_table_1.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.public_my_subnet_2.id
  route_table_id = aws_route_table.my_route_table_1.id
}

resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.private_my_subnet_1.id
  route_table_id = aws_route_table.my_route_table_2.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.private_my_subnet_2.id
  route_table_id = aws_route_table.my_route_table_2.id
}
