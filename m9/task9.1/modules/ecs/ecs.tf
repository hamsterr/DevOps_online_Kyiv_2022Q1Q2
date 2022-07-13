resource "aws_ecs_cluster" "ecs_cluster" {
    name  = "ecs-${var.app_name}-${var.env}"
}
resource "aws_ecs_task_definition" "task_definition" {
  family                   = "slave-${var.app_name}-${var.env}"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  execution_role_arn       = aws_iam_role.ecs_service.arn
  container_definitions    = data.template_file.container_definition_template.rendered
}
data "template_file" "container_definition_template" {
  template = templatefile("container_definition.json.tpl", {
    ecr_url = var.ecr_url,
    app_tag = var.app_tag,
    app_name = var.app_name,
    env = var.env
  })
}
resource "aws_ecs_service" "ecs_service" {
  name                               = "service-${var.app_name}-${var.env}"
  cluster                            = aws_ecs_cluster.ecs_cluster.id
  task_definition                    = aws_ecs_task_definition.task_definition.arn
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  force_new_deployment               = true

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs-target-group.arn
    container_name   = aws_ecs_task_definition.task_definition.family
    container_port   = 80
}
depends_on = [
  aws_vpc.default, 
  aws_ecs_task_definition.task_definition
]
}

