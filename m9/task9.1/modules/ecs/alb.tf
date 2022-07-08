resource "aws_lb" "alb" {
  name               = "lb-${var.app_name}-${var.env}"
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [aws_security_group.alb.id]

  tags = {
    Name = format("%s-alb", aws_vpc.default.id)
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

   default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs-target-group.id
  }
}
resource "aws_lb_target_group" "ecs-target-group" {
  name     = "tg-${var.app_name}-${var.env}"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.default.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_security_group" "alb" {
  vpc_id = aws_vpc.default.id
  name   = "alb security group"

  dynamic "ingress" {
    for_each = var.sg_alb_ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb security group"
  }
}