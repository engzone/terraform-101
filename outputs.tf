output "vpc" {
  value = aws_vpc.main.id
}
output "subnets" {
  value = [for r in aws_subnet.main : r.id]
}
