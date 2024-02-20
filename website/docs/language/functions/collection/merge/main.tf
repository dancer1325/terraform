# Define map variables
variable "my_map_first" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "my_map_second" {
  type = map(string)
  default = {
    key3 = "value3"
    key4 = "value4"
  }
}

# Retrieve the value of a merge of maps
output "value_of_merge_maps" {
  value = merge(var.my_map_first, var.my_map_second)
}

variable "my_map_third" {
  type = map(string)
  default = {
    key3 = "value5"
  }
}

# if mapOrObject1’s keyOrAttribute = mapOrObject2’s keyOrAttribute → last one takes precedence
output "value_of_merge_maps_mathcing_keys" {
  value = merge(var.my_map_first, var.my_map_second, var.my_map_third)
}

# + `...` -> separate elements
output "value_of_merge_maps_expanding" {
  value = merge([{a="b", c="d"}, {}, {e="f", c="z"}]...)          # [{a="b", c="d"}, {}, {e="f", c="z"}]    is a tuple
}
