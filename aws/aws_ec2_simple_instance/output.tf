output "public_dns_ec2" {
    value = "${aws_instance.docker.public_dns}"
}