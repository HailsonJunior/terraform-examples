resource "aws_security_group" "allow_iac_ssh" {
    name = "allow_iac_ssh"
    ingress = {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }
    egress = {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      to_port = 0
      protocol = -1
    }
}