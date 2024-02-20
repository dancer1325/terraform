variable "list1" {
  default = ["item1", "item2"]
}

variable "list2" {
  default = ["item3", "item4"]
}

# Test case 1: Concatenate two lists
output "concatenated_lists" {
  value = concat(var.list1, var.list2)
}

# Test case 2: Concatenate with additional string
output "concatenated_with_string" {
  value = concat(var.list1, var.list2, ["additional_item"])
}

# Test case 3: Concatenate with empty list
output "concatenated_with_empty_list" {
  value = concat(var.list1, [])
}

# Test case 4: Concatenate with empty list as first argument
output "concatenated_with_empty_list_first" {
  value = concat([], var.list1)
}

# Test case 5: Concatenate with empty lists
output "concatenated_with_empty_lists" {
  value = concat([], [])
}
