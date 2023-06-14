## VPC
variable "namevpc" {
  type = string
}
variable "ipcidr" {
    type = string
}

### Subnets
variable "public1_subnet_cidrs" {
    type = string
    description = "Public Subnet 1 CIDR values"
}

variable "public2_subnet_cidrs" {
    type = string
    description = "Public Subnet 2 CIDR values"
}

variable "public_az1" {
    type = string
    description = "Public Subnet AZ1"
}

variable "public_az2" {
    type = string
    description = "Public Subnet AZ2"
}

variable "namepublicsubnet1" {
    type = string
    description = "Name of Public Subnet1"
}

variable "namepublicsubnet2" {
    type = string
    description = "Name of Public Subnet2"
}

variable "private_az" {
    type = string
    description = "Private Subnet AZ"
}

variable "private_subnet_cidrs" {
    type = string
    description = "Private Subnet CIDR values"
  
}
variable "nameprivatesubnet" {
    type = string
    description = "Name of Private Subnet"
}

## Internet GW

variable "nameinternetgw" {
    type = string
    description = "Name of Internet GateWay"
  
}

## Route table

variable "nameroutetable" {
    type = string
    description = "Name Route Table"
}

## Security Groups

variable "namesg" {
    type = string
    description = "Name of Security Groups"
}

variable "ingress" {
    type = list(number)
    default = [ 22, 80, 443 ]
  
}