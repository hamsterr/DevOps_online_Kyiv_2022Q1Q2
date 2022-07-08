variable "aws_region" {
  description = "region"
  type        = string
  default     = "eu-central-1"
}
variable "app_name" {
  description = "app_name"
  type        = string
  default     = ""
}
variable "app_tag" {
  description = "app_tag"
  type        = string
  default     = ""
}
variable "working_dir" {
  description = "app_dir"
  type        = string
  default     = ""
}
variable "ecr_url" {
  description = "ecr_url"
  type        = string
  default     = ""
}
variable "registry_id" {
  description = "registry_id"
  type        = string
  default     = ""
}