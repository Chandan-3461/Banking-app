resource "aws_instance" "web" {
  count = 1
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t3.medium"

  tags = {
    Name = "Machine"
  }
}
