output "aws_lb_pub_dns" {
  description = "load blancer public dns name"
  value       = module.load_balancer.aws_lb_pub_dns
}
