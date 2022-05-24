#-------------------------------------------
#
# My Ubuntu Servers for 4HA
#
# Made by Gladkov Igor
#
#-------------------------------------------



resource "aws_instance" "my_2ha" {
  ami                      = "ami-02584c1c9d05efa69"
  instance_type            = "t2.micro"
  vpc_security_group_ids   = [aws_security_group.my_ubuntu.id]
  key_name                 = "ansible"

  tags                     = {
   Name                    = "Ubuntu  2HA"
   Owner                   = "Gladkov Igor"
  }
}


resource "aws_security_group" "my_ubuntu" {
  name                     = "Ubuntu Security Group"
  description              = "Deny TLS Traffic"

 ingress {
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  cidr_blocks              = ["172.31.0.0/16"]
 }
 
 egress {
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  cidr_blocks              = ["0.0.0.0/0"]
 }
  tags                     = {
   Name                    = "Security Group 2HA"
   Owner                   = "Gladkov Igor"
  }
}


