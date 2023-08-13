######################################################################################
#                        ELASTIC COMPUTE CLOUD CONFIGURATION
######################################################################################

resource "aws_instance" "demo_instance" {
  ami           = var.image_id
  instance_type = var.instance_type

  availability_zone = var.availablity_zone1
  key_name          = var.keypair

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_id              = aws_subnet.public_subnet_1a.id

  user_data_base64 = base64encode(file("apache.sh"))

  tags = {
    Name = "demo_instance"
  }
}

