resource "aws_instance" "drone_app" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  tags = {
    Name  = "docker-drone-app"
    Role  = "Application on docker"
    Owner = var.lord_of_terraform
  }
}

resource "aws_instance" "prometheus" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  tags = {
    Name  = "prometheus"
    Role  = "monitoring"
    Owner = var.lord_of_terraform
  }
}

resource "aws_instance" "grafana" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]

  tags = {
    Name  = "grafana"
    Role  = "monitoring"
    Owner = var.lord_of_terraform
  }
}


