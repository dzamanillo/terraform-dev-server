resource "aws_internet_gateway" "internet_gateway_dev" {
  vpc_id = aws_vpc.vpc_tf.id

  tags = {
    Name = "${var.project_name}_igw-dev"
  }
}

resource "aws_route_table" "rt_dev" {
  vpc_id = aws_vpc.vpc_tf.id

  tags = {
    Name = "${var.project_name}_rt-dev"
  }
}

resource "aws_route" "default_route-dev" {
  route_table_id         = aws_route_table.rt_dev.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway_dev.id
}

resource "aws_route_table_association" "mtc_public_assoc-dev" {
  subnet_id      = aws_subnet.subnet_tf.id
  route_table_id = aws_route_table.rt_dev.id
}
