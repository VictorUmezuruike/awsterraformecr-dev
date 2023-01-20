#ecr repository
resource "aws_ecr_repository" "production" {
  name                 = "poc"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

# #ecs cluster
# resource "aws_ecs_cluster" "production" {
#   name = "white-hart"

#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
# }

# #ecs service
# resource "aws_ecs_service" "mongo" {
#   name            = "mongodb"
#   cluster         = aws_ecs_cluster.production.id
# #   task_definition = aws_ecs_task_definition.production.arn
#   desired_count   = 3
# #   iam_role        = aws_iam_role.production.arn
# #   depends_on      = [aws_iam_role_policy.production]

#   ordered_placement_strategy {
#     type  = "binpack"
#     field = "cpu"
#   }

# #   load_balancer {
# #     target_group_arn = aws_lb_target_group.production.arn
# #     container_name   = "mongo"
# #     container_port   = 8080
# #   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
#   }
# }
