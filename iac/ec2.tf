data "aws_ami" "ubuntu"{
    owners = ["amazon"]
    most_recent = true
    name_regex = "Ubuntu"
}

resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = "PublicInstance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.ubuntu.ids
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = "PrivateInstance"
  }
}