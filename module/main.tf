resource "aws_instance" "instance-1" {
  ami                    = var.ec2_config.ami
  instance_type          = var.ec2_config.instance_type
  subnet_id              = aws_subnet.subnet_1.id
  key_name               = "key"
  vpc_security_group_ids = [aws_security_group.vpc_security_group.id]
  user_data              = file("${path.module}/shell.sh")
  tags = {
    Name = "instance-1",
  }
}
resource "aws_instance" "instance-2" {
  ami                    = var.ec2_config.ami
  instance_type          = var.ec2_config.instance_type
  key_name               = "key"
  subnet_id              = aws_subnet.subnet_2.id
  vpc_security_group_ids = [aws_security_group.vpc_security_group.id]
  user_data              = file("${path.module}/shell.sh")
  tags = {
    Name = "instance-2",
  }
}
resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = file("${path.module}/key.pub")
}
