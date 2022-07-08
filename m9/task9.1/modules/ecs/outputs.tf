output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
output "vpc_id" {
  value       = aws_vpc.default.id
}
output "private_subnets" {
  value = aws_subnet.private.*.id
}