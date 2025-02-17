# modules/ecs-cluster/main.tf
resource "aws_ecs_cluster" "store_locator" {
  name = "store-locator-cluster"
}
