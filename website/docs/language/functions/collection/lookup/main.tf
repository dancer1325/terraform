# Define a map variable
variable "my_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

# Retrieve the value of a map element by key
output "value_of_key1" {
  value = lookup(var.my_map, "key1")
}

# Try to retrieve the value of a non-existent key, providing a default value
output "value_of_non_existent_key" {
  value = lookup(var.my_map, "non_existent_key", "default_value")
}
