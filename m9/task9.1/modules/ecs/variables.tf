variable "app_tag" {
  description = "app_tag"
  type        = string
  default     = ""
}
variable "app_count" {
  description = "app_count"
  type        = string
  default     = ""
}
variable "env" {
  description = "env"
  type        = string
  default     = ""
}
variable "ecr_url" {
  description = "ecr_url"
  type        = string
  default     = ""
}
variable "cidr" {
  description = "cidr"
  type        = string
  default     = ""
}
variable "ecs_name" {
  description = "ecs_name"
  type        = string
  default     = ""
}
variable "app_name" {
  description = "app_name"
  type        = string
  default     = ""
}
variable "aws_region" {
  description = "region"
  type        = string
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "region"
  type        = string
  default     = "eu-central-1"
}
variable "vpc_id" {
  type    = string
  default = ""
}

variable "target_group_arns" {
  type    = list(string)
  default = []
}
variable "sg_alb_ingress_ports" {
  type    = list(string)
  default = []
}
variable "public_subnets_id" {
  description = "A list of public subnets id inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets_id" {
  description = "A list of private subnets id inside the VPC"
  type        = list(string)
  default     = []
}
variable "aws_ami_id" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}
variable "key_name" {
  description = "key_name"
  type        = string
  default     = ""
}
variable "sg_asg_ingress_ports" {
  type    = list(string)
  default = []
}
variable "alb_name" {
  description = "alb_name"
  type        = string
  default     = ""
}