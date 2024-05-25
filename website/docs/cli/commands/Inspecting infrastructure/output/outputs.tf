output "instance_ips" {
  value = var.instace
}
output "lb_address" {
  value = var.dns
}
output "password" {
  sensitive = true      # Value NOT displayed if you try to retrieve
  value = var.secret_password
}