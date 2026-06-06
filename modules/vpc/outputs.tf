#vpc outputs
output "vpc_id" {
  value = aws_vpc.poc_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.poc_public_subnet.id
}