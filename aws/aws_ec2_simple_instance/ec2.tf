resource "aws_instance" "docker" {
    ami = var.ami  
    instance_type = var.type
    security_groups = [ "${aws_security_group.allow_iac_ssh.name}" ]
    key_name = "${aws_key_pair.my_key.key_name}"
    tags = {
      "Name" = "Docker"
    }
}