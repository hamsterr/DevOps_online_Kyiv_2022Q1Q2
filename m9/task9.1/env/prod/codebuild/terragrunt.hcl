terraform {
  source = "../../../modules//codebuild"
}

include {
  path = find_in_parent_folders()
}
locals {
  secrets = read_terragrunt_config(find_in_parent_folders("secrets.hcl"))
}

dependency "ecr" {
  config_path = "../ecr"
  skip_outputs = true
}

dependency "ecs" {
  config_path = "../ecs"
  mock_outputs = {
    vpc_id  = "vpc-000000000000"
    private_subnets = ["subnet-00000000000", "subnet-111111111111"]
  }
}

inputs = merge(
  local.secrets.inputs,
  {
    vpc = dependency.ecs.outputs.vpc_id
    private_subnets = dependency.ecs.outputs.private_subnets
    build_spec_file = "env/dev/buildspec.yml"
  }
)