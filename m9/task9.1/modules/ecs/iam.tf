data "aws_iam_policy_document" "ecs_service" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_service" {
  name           = "ecs-slave-${var.app_name}-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.ecs_service.json
}

resource "aws_iam_instance_profile" "ecs_service" {
  name = "ecs_service-${var.app_name}-${var.env}"
  role = aws_iam_role.ecs_service.name
}

resource "aws_iam_role_policy" "ecs_service" {
  name_prefix = "ecs_iam_role_policy"
  role        = aws_iam_role.ecs_service.id
  policy      = data.template_file.ecs_service_policy.rendered
}

data "template_file" "ecs_service_policy" {
  template = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeTags",
                "ecs:CreateCluster",
                "ecs:DeregisterContainerInstance",
                "ecs:DiscoverPollEndpoint",
                "ecs:Poll",
                "ecs:RegisterContainerInstance",
                "ecs:StartTelemetrySession",
                "ecs:UpdateContainerInstancesState",
                "ecs:Submit*",
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}