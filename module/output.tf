output "aws_lb_pub_dns" {
  description = "load blancer public dns name"
  value       = aws_lb.alb.dns_name
}
