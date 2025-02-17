output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet0" {
  description = "ID of the first public subnet"
  value       = module.vpc.public_subnet0
}

output "public_subnet1" {
  description = "ID of the second public subnet"
  value       = module.vpc.public_subnet1
}

output "private_subnet0" {
  description = "ID of the first private subnet"
  value       = module.vpc.private_subnet0
}

output "private_subnet1" {
  description = "ID of the second private subnet"
  value       = module.vpc.private_subnet1
}
