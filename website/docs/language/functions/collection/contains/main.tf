# Define a list variable
variable "my_list" {
  type    = list(string)
  default = ["value1", "value2", "value3"]
}

# Check if a value exists in the list
output "value1_exists" {
  value = contains(var.my_list, "value1")
}

# Check if a value does not exist in the list
output "value4_exists" {
  value = contains(var.my_list, "value4")
}
