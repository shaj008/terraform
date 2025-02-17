variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-VPC"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default     = {
    "Owner" = "devcx9"
  }
}

variable "environment" {
  description = "The environment name (e.g. production, staging)"
  type        = string
  default     = "dev-cx9"
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway"
  type        = bool
  default     = true
}
