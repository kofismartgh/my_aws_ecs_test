# resource "aws_ecs_task_definition" "hubtask" {
#   family                   = "custom-nginx" #task definition name
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = 256
#   memory                   = 512
#   network_mode             = "awsvpc"
#   execution_role_arn       = "arn:aws:iam::908027390466:role/ecsTaskExecutionRole"
#   container_definitions = jsonencode([
#     {
#       name           = "custom-nginx" #random name of container
#       image          = "nginxdemos/hello"
#       #container_port = 80 #cos we are using awsvpc as networkmode you only specify containerport
#       essential      = true
#       portMappings = [ # i had to use this when i had to attach a ALB for my target group
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#       logConfiguration = {
#         logDriver = "awslogs",
#         options = {
#           awslogs-group         = "/ecs/proxytask-01",
#           mode                  = "non-blocking",
#           awslogs-create-group  = "true",
#           max-buffer-size       = "25m",
#           awslogs-region        = "us-east-1",
#           awslogs-stream-prefix = "ecs"
#         }
#       }
#     }
#   ])
#   runtime_platform {
#     cpu_architecture        = "X86_64"
#     operating_system_family = "LINUX"
#   }


# }

# resource "aws_ecs_task_definition" "hubtask" {
#   family                   = "fullazure" #task definition name
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = 256
#   memory                   = 512
#   network_mode             = "awsvpc"
#   execution_role_arn       = "arn:aws:iam::908027390466:role/ecsTaskExecutionRole"
#   container_definitions = jsonencode([
#     {
#       name           = "azureimage" # name of container
#       image          = "908027390466.dkr.ecr.us-east-1.amazonaws.com/azuretest:Release-28"
#       essential      = true
#       portMappings = [ # i had to use this when i had to attach a ALB for my target group
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#       logConfiguration = {
#         logDriver = "awslogs",
#         options = {
#           awslogs-group         = "/ecs/fullazure",
#           mode                  = "non-blocking",
#           awslogs-create-group  = "true",
#           max-buffer-size       = "25m",
#           awslogs-region        = "us-east-1",
#           awslogs-stream-prefix = "ecs"
#         }
#       }
#     }
#   ])
#   runtime_platform {
#     cpu_architecture        = "X86_64"
#     operating_system_family = "LINUX"
#   }
#   ephemeral_storage {
#     size_in_gib = 21
#   }
# #   lifecycle {
# #     ignore_changes = [ container_definitions ] #ignores_image changes
# #   }
#   skip_destroy = true #keeps the old revision


# }