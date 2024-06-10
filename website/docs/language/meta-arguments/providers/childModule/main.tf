variable "name" {
  description = "Child module name"
  default = "Alfred"
}

output "alfred" {
  value = var.name
}