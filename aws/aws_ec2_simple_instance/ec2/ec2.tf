resource "aws_instance" "docker" {
    ami = var.ami  
    instance_type = var.type
    security_groups = [ "${aws_security_group.allow_iac_ssh.name}" ]
    key_name = "${aws_key_pair.my_key.key_name}"
    
    root_block_device {
      volume_size = 30
      volume_type = "gp2"
      delete_on_termination = true
    }
    tags = {
      "Name" = "Docker"
    }
}