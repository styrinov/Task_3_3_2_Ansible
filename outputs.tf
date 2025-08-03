output "ansible_public_ip" {
  value = aws_instance.drone_app.public_ip
}

output "prometheus_public_ip" {
  value = aws_instance.prometheus.public_ip
}

output "grafana_public_ip" {
  value = aws_instance.grafana.public_ip
}

# output "alertmanager_public_ip" {
#   value = aws_instance.alertmanager.public_ip
# }

# output "public_ips" {
#   value = {
#     ansible      = aws_instance.ansible_host.public_ip
#     prometheus   = aws_instance.prometheus.public_ip
#     grafana      = aws_instance.grafana.public_ip
#     alertmanager = aws_instance.alertmanager.public_ip
#   }
# }
