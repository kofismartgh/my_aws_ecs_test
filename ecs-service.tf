# resource "aws_ecs_service" "hubservice" {
#   name            = "customnginx"
#   cluster         = aws_ecs_cluster.hubcluster.id
#   task_definition = aws_ecs_task_definition.hubtask.arn
#   desired_count   = 2
#   #iam_role        = "aws_iam_role.foo.arn" #not nedded due to awsvpc network mode
#   #depends_on  = [aws_lb_listener.hubalb]
#   launch_type = "FARGATE"
#   scheduling_strategy = "REPLICA"
#   network_configuration {
#     assign_public_ip = true
#     security_groups  = ["sg-049767b202091b1b7"] ##can use varibles to manage this better
#     subnets          = ["subnet-0def7a0a927cb38e5"]
#   }
#   force_new_deployment = true

#   ####### LOAD BALANCER ###
#   load_balancer {
#     target_group_arn = aws_lb_target_group.hubalb.arn
#     container_name   = "custom-nginx" #use the name in the container definition name, 
#     container_port   = 80
#   }

# }

resource "aws_ecs_service" "hubservice" {
  name            = "fullazure"
  cluster         = aws_ecs_cluster.hubcluster.id
  task_definition = aws_ecs_task_definition.hubtask.arn
  desired_count   = 0
  #iam_role        = "aws_iam_role.foo.arn" #not nedded due to awsvpc network mode
  depends_on          = [aws_lb_listener.hubalb, aws_lb_target_group.hubalb_new]
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  network_configuration {
    assign_public_ip = true
    security_groups  = ["sg-049767b202091b1b7"] ##can use varibles to manage this better
    subnets          = ["subnet-0def7a0a927cb38e5"]
  }
  force_new_deployment = true

  ####### LOAD BALANCER ###
  load_balancer {
    target_group_arn = aws_lb_target_group.hubalb_new.arn
    container_name   = "azureimage" #use the name in the container definition name, 
    container_port   = 80
  }

}
