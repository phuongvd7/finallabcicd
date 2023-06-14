output "vpc_id" {
    value = aws_vpc.myvpc.id
  
}

output "publicsubnet1_id" {
    value = aws_subnet.public_subnets1.id
  
}
output "publicsubnet2_id" {
    value = aws_subnet.public_subnets2.id
  
}
output "privatesubnet_id" {
    value = aws_subnet.private_subnets.id
  
}
output "sgid" {
    value = aws_security_group.mytraffic.id
  
}