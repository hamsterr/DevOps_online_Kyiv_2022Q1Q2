locals {
  remote_state_bucket_prefix = "tfstate"
  env = "dev"
  cidr        = "172.34.0.0/16"
  sg_alb_ingress_ports = ["80"]
  sg_asg_ingress_ports = ["80"]
  app_name = "apache"
  ecs_name = "final_demo"
  app_dir = "app"
  aws_profile = "default"
  aws_account = "281750582201"
  aws_region = "eu-central-1"
  instance_type        = "t2.micro"
  app_tag              = "new"
  github_url = "https://github.com/hamsterr/Kh-071-02-DevOps-FinalDemo.git"
  github_head_ref = "dev"
  github_branch   = "dev"
  github_event  = "PUSH"
  app_count = 2
  codebuild_env_vars = {
      TERRAFORM_VERSION  = "1.2.3"
      TERRAGRUNT_VERSION = "0.38.1"
      APP_NAME           = "${local.app_name}"
      APP_DIR            = "${local.app_dir}"
      ENV                = "${local.env}"
      AWS_DEFAULT_REGION = "${local.aws_region}"
  }
}
  inputs = {
  remote_state_bucket = format("%s-%s-%s-%s", local.remote_state_bucket_prefix, local.app_name, local.env, local.aws_region)
  aws_region            = local.aws_region
  aws_profile           = local.aws_profile
  app_dir               = local.app_dir
  cidr                  = local.cidr
  ecs_name              = local.ecs_name
  instance_type         = local.instance_type
  sg_alb_ingress_ports  = local.sg_alb_ingress_ports
  sg_asg_ingress_ports  = local.sg_asg_ingress_ports
  github_url            = local.github_url
  github_event          = local.github_event
  github_head_ref       = local.github_head_ref
  github_branch         = local.github_branch
  app_name              = local.app_name
  app_dir               = local.app_dir
  app_tag               = local.app_tag
  env                   = local.env
  app_count             = local.app_count
  
  codebuild_env_vars    = local.codebuild_env_vars

  tags = {
    Terraform = "true"
    Environment = "${local.env}"
  }
}
remote_state {
  backend = "s3"
  generate = {
    path      = "s3.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket         = "tfstate-${local.app_name}-${local.env}-${local.aws_region}"
    profile        = "${local.aws_profile}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "${local.aws_region}"
    encrypt        = true
    dynamodb_table = "tfstate-lock-table-${local.env}-${local.app_name}"
  }
}
terraform {

  //after_hook "remove_lock_windows" {
   // commands = get_platform() == "windows" ? [
  //    "apply",
  //    "console",
  //    "destroy",
  //    "import",
 //     "init",
 //     "plan",
 //     "push",
     // "refresh",
 //   ] : []

  //  execute = [
     // "Powershell.exe",
     // "Remove-Item",
     // "${get_terragrunt_dir()}/.terraform.lock.hcl",
  //  ]
//
 //   run_on_error = true
//  }
  after_hook "remove_lock_linux" {
    commands = get_platform() != "windows" ? [
      "apply",
      "console",
      "destroy",
      "import",
      "init",
      "plan",
      "push",
      "refresh",
    ] : []

    execute = [
      "rm",
      "-f",
      "${get_terragrunt_dir()}/.terraform.lock.hcl",
    ]

    run_on_error = true
  }
}
generate "tfenv" {
  path              = ".terraform-version"
  if_exists         = "overwrite"
  disable_signature = true

  contents = <<EOF
1.2.3
EOF
}
terraform_version_constraint = "1.2.3"

terragrunt_version_constraint = ">= 0.38.1"

