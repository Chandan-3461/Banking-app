resource "aws_instance" "res1" {
  count = 2
  ami           = "ami-00bb6a80f01f03502"
  instance_type = "t3.medium"

  tags = {
    Name = "Machine"
  }
}
