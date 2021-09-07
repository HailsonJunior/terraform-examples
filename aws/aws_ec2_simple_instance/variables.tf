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