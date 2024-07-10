resource "aws_vpc" "main" {
    cidr_block = var.cidr_block

    tags = {
        Name = "vpc-${var.name}"
    }
}

resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name =  "internet-gateway-${var.name}"
    }
}

resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_1_cidr
    map_public_ip_on_launch = true

    tags = {
      Name = "subnet-public-1a-${var.name}"
    }
}

resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_2_cidr
    map_public_ip_on_launch = true

    tags = {
      Name = "subnet-public-2a-${var.name}"
    }
}

resource "aws_subnet" "private_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_1_cidr
    map_public_ip_on_launch = false

    tags = {
      Name = "subnet-private-1a-${var.name}"
    }
}

resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_2_cidr
    map_public_ip_on_launch = false

    tags = {
      Name = "subnet-private-2a-${var.name}"
    }
}

resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.main.id
    subnet_id = aws_subnet.private_1.id

    tags = {
        Name = "nat-gateway-${var.name}"
    }
}

resource "aws_eip" "main" {
    domain = "vpc"
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }

    tags = {
      Name = "public-rtb-${var.name}"
    }
}

resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.main.id
    }

    tags = {
      Name = "private-rtb-${var.name}"
    }
}

resource "aws_route_table_association" "private_1" {
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.private.id
}