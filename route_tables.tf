resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "web_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-web-private-rt"
  }
}

resource "aws_route_table_association" "web_private_1" {
  subnet_id      = aws_subnet.web_private_1.id
  route_table_id = aws_route_table.web_private.id
}

resource "aws_route_table_association" "web_private_2" {
  subnet_id      = aws_subnet.web_private_2.id
  route_table_id = aws_route_table.web_private.id
}

resource "aws_route_table" "app_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-app-private-rt"
  }
}

resource "aws_route_table_association" "app_private_1" {
  subnet_id      = aws_subnet.app_private_1.id
  route_table_id = aws_route_table.app_private.id
}

resource "aws_route_table_association" "app_private_2" {
  subnet_id      = aws_subnet.app_private_2.id
  route_table_id = aws_route_table.app_private.id
}

resource "aws_route_table" "db_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-db-private-rt"
  }
}

resource "aws_route_table_association" "db_private_1" {
  subnet_id      = aws_subnet.db_private_1.id
  route_table_id = aws_route_table.db_private.id
}

resource "aws_route_table_association" "db_private_2" {
  subnet_id      = aws_subnet.db_private_2.id
  route_table_id = aws_route_table.db_private.id
}