## VPC
namevpc = "[Terraform-lab-final]phuongvd"
ipcidr  = "10.10.0.0/16"

## Subnets
public1_subnet_cidrs = "10.10.1.0/24"
public_az1           = "ap-southeast-2a"
namepublicsubnet1    = "[Public Subnet1]phuongvd"
public2_subnet_cidrs = "10.10.2.0/24"
public_az2           = "ap-southeast-2b"
namepublicsubnet2    = "[Public Subnet2]phuongvd"
private_az           = "ap-southeast-2c"
private_subnet_cidrs = "10.10.100.0/24"
nameprivatesubnet    = "[Private Subnet]phuongvd"

## Internet GW

nameinternetgw = "[Internet GW]phuongvd"

## Route table

nameroutetable = "[Public Route]phuongvd"

## Security Groups

namesg = "[MyTraffic]phuongvd"

ingress = [22, 80, 443]


## EC2

ami     = "ami-0ec19a300f3097b5a" # AMI Ubuntu
instype = "t2.micro"
keyssh  = "keylab"
nameins = "[MyEC2]phuongvd"