resource "aws_ecr_repository" "demo" {
  name                 = "${var.app_name}-${var.env}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}