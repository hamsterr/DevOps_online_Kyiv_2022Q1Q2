terraform {
  source = "../../../modules//init-build"
}

include {
  path = find_in_parent_folders()
}


dependency "ecr" {
  config_path = "../ecr"
  mock_outputs = {
  ecr_url = "000000000000.dkr.ecr.eu-west-1.amazonaws.com/image"
  registry_id = "000000000000"
  }
 
}


inputs = {
  ecr_url = dependency.ecr.outputs.ecr_url
  registry_id = dependency.ecr.outputs.registry_id
  working_dir = format("%s/../../../app", get_terragrunt_dir())
}