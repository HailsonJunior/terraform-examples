locals {
  reprovision_trigger = <<EOF
    # Trigger reprovision on variable changes:
    ${var.hostname}
    ${var.reprovision_trigger}
    ${var.ssh_username}
    ${var.ssh_private_key_path}
    ${var.ssh_public_key_path}
    # Trigger reprovision on file changes:
    ${file("${path.module}/install-docker.sh")}
  EOF
}

variable "region" {
    description = "Região"
    default = "us-east-1"
}

variable "ami" {
    description = "AMI da instância"
    default = "ami-09e67e426f25ce0d7" 
}

variable "type" {
    description = "Tipo da instância"
    default = "t2.micro"  
}

variable "hostname" {
    default = "docker"  
}

variable "reprovision_trigger" {
  description = "Strinf de valor arbitrario; Quando seu valor muda, o host precisar ser reprovisionado"
  default     = ""
}

variable "ssh_private_key_path" {
  description = "SSH private key file path, relativo ao projeto root do Terraform"
  default     = "ssh.private.key"
}

variable "ssh_public_key_path" {
  description = "SSH public key file path, relativo ao projeto root do Terraform"
  default     = "ssh.public.key"
}