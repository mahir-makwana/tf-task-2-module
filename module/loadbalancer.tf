resource "aws_lb_target_group" "tg" {
  depends_on = [aws_lb.alb]
  health_check {
    interval            = "15"
    path                = "/index.html"
    protocol            = "HTTP"
    timeout             = "5"
    unhealthy_threshold = "2"
  }

  name        = var.target_group_config.name
  port        = var.target_group_config.port
  protocol    = var.target_group_config.protocol
  target_type = var.target_group_config.target_type
  vpc_id      = aws_vpc.vpc.id
}

resource "aws_lb" "alb" {
  name               = var.alb_config.name
  load_balancer_type = var.alb_config.load_balancer_type
  security_groups    = [aws_security_group.load_balancer_security_group.id]

  subnets = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "instance-1-atteach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance-1.id
}

resource "aws_lb_target_group_attachment" "instance-2-atteach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.instance-2.id
}
