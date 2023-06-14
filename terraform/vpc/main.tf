
#VPC
resource "aws_vpc" "myvpc" {
    cidr_block = var.ipcidr
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"
    tags = {
        Name = var.namevpc
    }
}


#### Create Subnet
resource "aws_subnet" "public_subnets1" {
  availability_zone = var.public_az1
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.public1_subnet_cidrs
  map_public_ip_on_launch = true

  tags = {
    Name = var.namepublicsubnet1
  }
}

resource "aws_subnet" "public_subnets2" {
    availability_zone = var.public_az2
    vpc_id = aws_vpc.myvpc.id 
    cidr_block = var.public2_subnet_cidrs
    map_public_ip_on_launch = true

    tags = {
        Name = var.namepublicsubnet2
    }
}

resource "aws_subnet" "private_subnets" {
    availability_zone = var.private_az
    vpc_id     = aws_vpc.myvpc.id
    cidr_block = var.private_subnet_cidrs
 
    tags = {
        Name = var.nameprivatesubnet
 }
}

## Create Internet Gateway

resource "aws_internet_gateway" "myinternetgw" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
      "Name" = var.nameinternetgw
    }
  
}


## Create Route table and Association
resource "aws_route_table" "myroutetable" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myinternetgw.id
    }
    
    tags = {
      Name = var.nameroutetable
    }
  
}

resource "aws_route_table_association" "publicsubnet_asso1" {
    subnet_id = aws_subnet.public_subnets1.id
    route_table_id = aws_route_table.myroutetable.id
}
resource "aws_route_table_association" "publicsubnet_asso2" {
    subnet_id = aws_subnet.public_subnets2.id
    route_table_id = aws_route_table.myroutetable.id
}

## Security groups

resource "aws_security_group" "mytraffic" {
    name = var.namesg
    vpc_id = aws_vpc.myvpc.id
    tags = {
      Name = var.namesg
    }

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
          cidr_blocks = [ "0.0.0.0/0" ]
        }
    }
    egress {
          from_port = 0
          to_port = 0
          protocol = "-1"
          cidr_blocks = [ "0.0.0.0/0" ]
    }    
}