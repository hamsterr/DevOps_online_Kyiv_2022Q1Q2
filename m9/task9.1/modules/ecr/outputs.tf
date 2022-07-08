output "registry_id" {
  description = "The account ID of the registry holding the repository."
  value       = aws_ecr_repository.demo.registry_id
}
output "ecr_url" {
  description = "The URL of the repository."
  value       = aws_ecr_repository.demo.repository_url
}