variable "aws_region" {
  description = "aws region"
}

variable "aws_profile" {
  description = "aws profile"
}

variable "app_name" {
  description = "app name"
  type        = string
  default     = ""
}
variable "app_dir" {
  description = "app dir"
  type        = string
  default     = ""
}
variable "env" {
  description = ""
  type        = string
  default     = ""
}

variable "github_token" {
  description = "github token"
  type        = string
  default     = ""
}
variable "github_url" {
  description = "github url"
  type        = string
  default     = ""
}
variable "vpc" {
  description = "A list of private subnets id inside the VPC"
  type        = string
  default     = ""
}
variable "github_event" {
  description = ""
  type        = string
  default     = ""
}
variable "github_head_ref" {
  description = ""
  type        = string
  default     = ""
}
variable "github_branch" {
  description = ""
  type        = string
  default     = ""
}
variable "private_subnets" {
  description = "A list of private subnets id inside the VPC"
  type        = list(string)
  default     = []
}
variable "codebuild_env_vars" {
  type = map(any)
}