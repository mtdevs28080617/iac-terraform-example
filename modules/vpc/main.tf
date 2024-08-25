resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_prefix}.0.0/16"
  tags       = {
    Name        = "${var.customer}_${var.environment}"
    environment = var.environment
    customer    = var.customer
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.cidr_prefix}.1.0/24"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags                    = {
    Name        = "${var.customer}_${var.environment}_Public_1a"
    environment = var.environment
    customer    = var.customer
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.cidr_prefix}.2.0/24"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags                    = {
    Name        = "${var.customer}_${var.environment}_Public_1b"
    environment = var.environment
    customer    = var.customer
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "${var.cidr_prefix}.3.0/24"
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true
  tags                    = {
    Name        = "${var.customer}_${var.environment}_Public_1c"
    customer    = var.customer
    environment = var.environment
  }
}
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.cidr_prefix}.10.0/24"
  availability_zone = "${var.region}a"
  tags              = {
    Name        = "${var.customer}_${var.environment}_Private_1a"
    customer    = var.customer
    environment = var.environment
  }
}
resource "aws_subnet" "private_1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.cidr_prefix}.11.0/24"
  availability_zone = "${var.region}b"
  tags              = {
    Name        = "${var.customer}_${var.environment}_Private_1b"
    customer    = var.customer
    environment = var.environment
  }
}
resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "${var.cidr_prefix}.12.0/24"
  availability_zone = "${var.region}c"
  tags              = {
    Name        = "${var.customer}_${var.environment}_Private_1c"
    customer    = var.customer
    environment = var.environment
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = {
    Name        = "${var.customer}_${var.environment}_IGW"
    customer    = var.customer
    environment = var.environment
  }
}
resource "aws_route" "public" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}