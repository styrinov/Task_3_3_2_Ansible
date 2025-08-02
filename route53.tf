resource "aws_route53_record" "drone_app_dns" {
  zone_id = "Z01110622V9YNHCB0J5FF"
  name    = "ansible.styrinov.com.ua"
  type    = "A"
  ttl     = 300
  records = [aws_instance.drone_app.public_ip]
}

# resource "aws_route53_record" "prometheus_dns" {
#   zone_id = "Z01110622V9YNHCB0J5FF"
#   name    = "prometheus.styrinov.com.ua"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.prometheus.public_ip]
# }

# resource "aws_route53_record" "grafana_dns" {
#   zone_id = "Z01110622V9YNHCB0J5FF"
#   name    = "grafana.styrinov.com.ua"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.grafana.public_ip]
# }

# resource "aws_route53_record" "alertmanager_dns" {
#   zone_id = "Z01110622V9YNHCB0J5FF"
#   name    = "alertmanager.styrinov.com.ua"
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.alertmanager.public_ip]
# }

