resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-2"
  }
}

resource "aws_subnet" "web_private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.project_name}-web-private-1"
  }
}

resource "aws_subnet" "web_private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.project_name}-web-private-2"
  }
}

resource "aws_subnet" "app_private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.project_name}-app-private-1"
  }
}

resource "aws_subnet" "app_private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.project_name}-app-private-2"
  }
}

resource "aws_subnet" "db_private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.31.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.project_name}-db-private-1"
  }
}

resource "aws_subnet" "db_private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.project_name}-db-private-2"
  }
}
