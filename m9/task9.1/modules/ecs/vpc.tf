
data "aws_availability_zones" "available" {
}
resource "aws_vpc" "default" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-${var.app_name}-${var.env}"
  }
}
resource "aws_subnet" "public" {
  count = var.app_count

  vpc_id                  = aws_vpc.default.id
  cidr_block              = cidrsubnet(aws_vpc.default.cidr_block, 8, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  depends_on = [
    aws_vpc.default
  ]
  tags = {
    Name = "public${count.index}-${var.app_name}-${var.env}"
  }
}
resource "aws_subnet" "private" {
  count = var.app_count

  vpc_id            = aws_vpc.default.id
  cidr_block        = cidrsubnet(aws_vpc.default.cidr_block, 8, var.app_count + count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  depends_on = [
    aws_vpc.default
  ]
  tags = {
    Name = "private${count.index}-${var.app_name}-${var.env}"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "igw-${var.app_name}-${var.env}"
  }
}
resource "aws_route" "public" {
  route_table_id = aws_vpc.default.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  
}
resource "aws_eip" "nat_eip" {
  count = var.app_count
  vpc = true
  tags = {
    Name = "nat_eip-${var.app_name}-${var.env}"
  }
}
resource "aws_nat_gateway" "nat" {
  count = var.app_count

  allocation_id = element(aws_eip.nat_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = format("ngw-%s-%s-%s", data.aws_availability_zones.available.names[count.index], var.app_name, var.env)
  }
}


resource "aws_route_table" "private" {
  count = var.app_count
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.nat.*.id, count.index)
  }

  tags = {
    Name = format("private route table in -%s-%s-%s", data.aws_availability_zones.available.names[count.index], var.app_name, var.env)
  }
}

resource "aws_route_table_association" "custom-rtb-private-subnet" {
  count = var.app_count

  route_table_id = aws_route_table.private.*.id[count.index]
  subnet_id      = aws_subnet.private.*.id[count.index]
}
