resource "aws_iam_role" "drone_app_role" {
  name = "drone-app-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudwatch_policy" {
  name = "CloudWatchAgentPolicy"
  role = aws_iam_role.drone_app_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:PutMetricData",
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "drone_app_profile" {
  name = "drone-app-profile"
  role = aws_iam_role.drone_app_role.name
}

resource "aws_instance" "drone_app" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.drone_app_profile.name

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


