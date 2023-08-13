######################################################################################
#                      APPLICATION LOAD BALANCER CONFIGUATION
######################################################################################


# Create an ALB
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"

  subnets         = [aws_subnet.public_subnet_1a.id, aws_subnet.public_subnet_1b.id]
  security_groups = [aws_security_group.alb_sg.id]


  tags = {
    Name = "alb"
  }
}

# Create a listener for the ALB
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  protocol          = "HTTP"
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
######################################################################################
######################################################################################


