terraform {
  backend "s3" {
    bucket = "hc-terraform-template"
    key    = "ecs-fargate-module/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "hc-terraform-template"
    key    = "vpc-module/terraform.tfstate"
    region = "ap-south-1"
  }
}

# Security Group for ECS
resource "aws_security_group" "ecs_security_group" {
  name_prefix = "ecs_sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id 

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"
}

module "fargate_task" {
  source = "./modules/fargate-task-def"
}

module "fargate_service" {
  source       = "./modules/fargate-service"
  #subnets      = [
    #data.terraform_remote_state.vpc.outputs.private_subnet0,
    #data.terraform_remote_state.vpc.outputs.private_subnet1
  #]
  cluster_id   = module.ecs_cluster.cluster_id
  task_definition_arn = module.fargate_task.task_definition_arn
  #security_groups = data.terraform_remote_state.vpc.outputs.security_groups
}
