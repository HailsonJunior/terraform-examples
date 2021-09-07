resource "aws_key_pair" "my_key" {
    key_name = "my_key"
    public_key = "${file("/home/hailson.junior/.ssh/id_rsa.pub")}" ## altere o nome do usuário
}