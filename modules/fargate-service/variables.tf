# var.tf
variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_id" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["subnet-060fc048315b6a517", "subnet-0130ec9256bd658ac"]
}


#variable "security_groups" {
  #description = "List of security group IDs for the ECS service"
  #type        = list(string)
#}

variable "cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}

variable "task_definition_arn" {
  description = "ARN of the ECS task definition"
  type        = string
}

variable "container_name" {
  description = "ID of the ECS cluster"
  type        = string
  default     = "store-locator-container"
}

variable "container_port" {
  description = "ID of the ECS cluster"
  type        = string
  default	  = 80
}

variable "existing_listener_arn" {
  description = "The ARN of the existing existing_listener_arn"
  type        = string
  default     = "arn:aws:elasticloadbalancing:ap-south-1:390844783830:listener/app/devcx9-alb/9f578e81a5c78001/72a4b18d43b6561a"
}  
  
  variable "vpc_id" {
  description = "The ARN of the existing Application Load Balancer"
  type        = string
  default     = "vpc-0064902e0929f4d38"
} 