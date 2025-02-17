output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.store_locator_service.name
}

output "ecs_service_arn" {
  description = "ARN of the ECS service"
  value       = aws_ecs_service.store_locator_service.id  # Use `id` instead of `arn`
}

output "ecs_service_cluster" {
  description = "ECS cluster the service is running in"
  value       = aws_ecs_service.store_locator_service.cluster
}
