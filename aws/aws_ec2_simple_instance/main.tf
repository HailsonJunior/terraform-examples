terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    region = var.region
}

module "ec2" {
    source = "./ec2"
}

module "key_pair" {
    source = "./key_pair"
}

module "output" {
    source = "./output"
}

module "security_group" {
    source = "./security_group"  
}