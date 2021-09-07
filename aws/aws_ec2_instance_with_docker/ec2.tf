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

    connection {
      user = "${var.ssh_username}"
      private_key = "${file("${var.ssh_private_key_path}")}"
      agent = false
    }

    provisioner "remote-exec" {
      inline = [
        "sudo hostnamectl set-hostname ${var.hostname}",
        "echo 127.0.0.1 ${var.hostname} | sudo tee -a /etc/hosts", # https://askubuntu.com/a/59517"
      ]
    }

    provisioner "remote-exec" {
      script = "${path.module}/install-docker.sh"    
    }
    
    tags = {
      "Name" = "Docker"
    }
}