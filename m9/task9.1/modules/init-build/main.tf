resource "null_resource" "aws_login" {
    provisioner "local-exec" {
     command = "aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.registry_id}.dkr.ecr.${var.aws_region}.amazonaws.com"
    }
}
resource "null_resource" "build0" {
    provisioner "local-exec" {
    working_dir = var.working_dir
    command = "docker build -t ${var.app_name}:${var.app_tag} ."
     }
    depends_on = [ null_resource.aws_login ]  
}
resource "null_resource" "build1" {
    provisioner "local-exec" {
     command = "docker tag ${var.app_name}:${var.app_tag} ${var.ecr_url}:${var.app_tag}"
     }
    depends_on =  [null_resource.build0]
}
resource "null_resource" "build2" {
    provisioner "local-exec" {
     command = "docker push ${var.ecr_url}:${var.app_tag}"
     }
    depends_on = [null_resource.build1]    
}