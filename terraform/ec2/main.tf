resource "aws_instance" "myec2-01" {
    ami = var.ami
    instance_type = var.instype
    key_name = var.keyssh
    subnet_id = var.publicsubnet1_id
    associate_public_ip_address = true
    vpc_security_group_ids = var.sgid
    tags = {
    Name : "EC2 1 on public-subnet-1"
    }
}

resource "aws_instance" "myec2-02" {
    ami = var.ami
    instance_type = var.instype
    key_name = var.keyssh
    subnet_id = var.publicsubnet1_id
    associate_public_ip_address = true
    vpc_security_group_ids = var.sgid
    tags = {
    Name : "EC2 2 on public-subnet-1"
    }
}
resource "aws_instance" "myec2-03" {
    ami = var.ami
    instance_type = var.instype
    key_name = var.keyssh
    subnet_id = var.publicsubnet2_id
    associate_public_ip_address = true
    vpc_security_group_ids = var.sgid

    tags = {
        Name : "EC2 3 on public-subnet-2"
        }
}
resource "aws_instance" "myec2-04" {
    ami = var.ami
    instance_type = var.instype
    key_name = var.keyssh
    subnet_id = var.publicsubnet2_id
    associate_public_ip_address = true
    vpc_security_group_ids = var.sgid
    tags = {
        Name : "EC2 4  on public-subnet-2"
        }
}