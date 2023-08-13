######################################################################################
#                APPLICATION LOAD BALANCER TARGET GROUP CONFIGUATION
######################################################################################

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo_vpc.id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "alb_attachment" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.demo_instance.id
  port             = 80
}

