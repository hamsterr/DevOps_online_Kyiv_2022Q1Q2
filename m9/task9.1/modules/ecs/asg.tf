
resource "aws_launch_template" "ecs_template" {
  name            = "node-tpl-${var.app_name}-${var.env}"
  image_id        = data.aws_ami.latest_amazon_image.id
  instance_type   = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_service.name
  }
  vpc_security_group_ids  = [aws_security_group.instance.id]
  user_data = "${base64encode(data.template_file.launch_data.rendered)}"
}
data "template_file" "launch_data" {
  template = templatefile("launch_data.sh.tpl", {
    env = var.env
    app_name  = var.app_name
  })
}
resource "aws_autoscaling_group" "ecs_asg" {
  name              = "asg-${var.app_name}-${var.env}"
  vpc_zone_identifier  = aws_subnet.private.*.id
  health_check_type = "EC2"
  health_check_grace_period = 300
  min_size         = 1
  max_size         = 3
  desired_capacity = var.app_count
 

  launch_template {
    id      = aws_launch_template.ecs_template.id
    version = "$Latest"
  }
   lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    aws_launch_template.ecs_template,
    aws_vpc.default
  ]
}

resource "aws_security_group" "instance" {
  vpc_id = aws_vpc.default.id
  name   = "node-sg-${var.app_name}-${var.env}"
  dynamic "ingress" {
    for_each = var.sg_asg_ingress_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_ami" "latest_amazon_image" {
  owners      = ["591542846629"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}