# resource "aws_lb" "hubalb" {
#   name               = "hub-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["sg-01f3b7e827f9ed30c"]
#   subnets            = ["subnet-0def7a0a927cb38e5", "subnet-0b99eacc0848e8019"]

#   tags = {
#     Name = "Hubalb"
#   }
# }
# ###### listener ######3
# resource "aws_lb_listener" "hubalb" {
#   load_balancer_arn = aws_lb.hubalb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.hubalb_new.arn
#   }
#   lifecycle {
#     create_before_destroy = true
#   }
# }
# output "hubalb_name" {
#   value = aws_lb.hubalb.dns_name
# }


# resource "aws_lb_target_group" "hubalb_new" {
#   name        = "hubecs-lb-tg-80"
#   port        = 80 #container port
#   protocol    = "HTTP"
#   target_type = "ip" 
#   vpc_id      = "vpc-008344e6577e5259c"
#   lifecycle {
#     create_before_destroy = true
#   }

# }
