locals {
  reprovision_trigger = <<EOF
    # Trigger reprovision on variable changes:
    ${var.hostname}
    ${var.reprovision_trigger}
    # Trigger reprovision on file changes:
    ${file("${path.module}/provision-docker.sh")}
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