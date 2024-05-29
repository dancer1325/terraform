variable "list" {
  type = list(string)
  default = [
    "value1",
    "value2"
  ]
}

#     allows     1to1                         list -> tuple of strings uppercase
output "value_of_upper_elements" {
  value = [for s in var.list : upper(s)]          # [for temporarySymbol in inputType : expression]
}

#     allows     1toSomethingOrNot
output "value_of_filter_list" {
  value = [for item in var.list : item if item == "value1"]
}

#     allows      map  -- via key by lexical sorting -> list
variable "map_inverted_order" {
  type = map(string)
  default = {         # lexical order in the keys are inverted
    key3 = "value1"
    key2 = "value2"
    key1 = "value3"
  }
}

output "map_convert_to_list" {
  # order apply in the execution based on the map's keys
  value = [ for key, value in var.map_inverted_order : "map_convert_to_list - ${key} - ${value}"]
}

#     allows      object  -- via attribute name by lexical sorting -> list
variable "object_attributes_randomposition" {
  type = object({
    name  = string
    age   = number
    adult = bool
    email = string
  })
  default = {
    name  = "Alice"
    age   = 30
    adult = true
    email = "alice@example.com"
  }
}

output "object_convert_to_list" {
  # order applied in the execution based on the object's attributeName
  value = [ for attributeName, attributeValue in var.object_attributes_randomposition : "object_convert_to_list - ${attributeName} - ${attributeValue}"]
}

#     allows          set(string) — via value by lexical sorting → `list` or `tuple`
variable "set_string_randompositionvalues" {
  type    = set(string)
  default = ["value2", "value1", "anotheroption"]
}

output "set_string_convert_to_list" {
  # order applied in the execution based on the value
  value = [for item in var.set_string_randompositionvalues : "set_string_convert_to_list - ${item}"]
}

#     allows          set(!=string) — via arbitrary ordering → `list` or `tuple`
variable "set_no_string" {
  type    = set(number)
  default = [1, 2, 4, 3, 5]
}

output "set_nostring_convert_to_list" {
  # order applied in the execution based on the value appareantly always the same result, but not trusth on it!!
  value = [for item in var.set_no_string : "set_nostring_convert_to_list - ${item}"]
}



#     resultType      tuple/list
output "result_type_tupleorlist" {
  value = [for item in var.list : upper(item)]
}

#     resultType      set         -- via -- toset
output "result_type_toset" {
  value = toset([for item in var.set_no_string : "result_type_toset - ${item}"])
}

#     resultType   {}
output "value_of_list_to_map" {
  value = {for item, index in var.list : index => item}
}



#     inputType    set
variable "set" {
  type    = set(string)
  default = ["value1", "value2", "value3", "value3"]
}

output "value_for_set" {
  value = [for item in var.set : upper(item)]       # Since it's a set, not duplicated VALUE3
}

#     inputType     map
variable "map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

output "value_for_map" {
  value = { for key, value in var.map : upper(key) => upper(value) }
}



#     temporarySymbol     set       1! is accesible
output "temporary_symbol_set" {
  value = [for item, index in var.set : "${index}-${item}"]     # You can add 2 temporarySymbols, but BOTH refer to the item, none of those to the index
}

#     temporarySymbol     list       1
output "temporary_symbol_list_1" {
  value = [for item in var.list : "temporary_symbol_list_1-${item}"]      # inputType's value
}

#     temporarySymbol     list       2
output "temporary_symbol_list_2" {
  # temporarySymbols here are      index, item        BUT we have named the variables opposite, to remark that it does NOT depend on naming
  value = [for item, index in var.list : "temporary_symbol_list_2-${item}-${index}"]      # index, item
}

#     temporarySymbol     map       1
output "temporary_symbol_map_1" {
  value = {for value in var.map : value => "temporary_symbol_map_1-${value}"}      # value
}

#     temporarySymbol     map       2
output "temporary_symbol_map_2" {
  # temporarySymbols here are      key, value
  value = {for key, value in var.map : key => "temporary_symbol_map_2-${key}-${value}"}      # key, value
}



# expression          filter  via `if`
variable "users" {
  type = list(object({
    name  = string
    age   = number
    isadmin = bool
  }))
  default = [
    {
      name  = "Alice"
      age   = 30
      isadmin = false
    },
    {
      name  = "Bob"
      age   = 35
      email = "bob@example.com"
      isadmin = false
    },
    {
      name  = "Charlie"
      age   = 40
      email = "charlie@example.com"
      isadmin = true
    }
  ]
}

output "admin_users" {
  # temporarySymbols in a list are      index, item        INDEPENDENTLY how you name the variables
  value = {for name, user in var.users : name => user if user.isadmin}
}

output "regular_users" {
  # temporarySymbols in a list are      index, item        INDEPENDENTLY how you name the variables
  value = {for name, user in var.users : name => user if !user.isadmin}
}



# ...             grouping model
variable "users_to_group" {
  type = map(object({
    role = string
  }))
  default = {
    "user1" = { role = "admin" }
    "user2" = { role = "user" }
    "user3" = { role = "admin" }
    "user4" = { role = "user" }
  }
}

locals {
  users_by_role = {
  # If you do NOT use grouping model → terraform would return an error
  #for name, user in var.users_to_group : user.role => name
    for name, user in var.users_to_group : user.role => name...         #...      == grouping model
  }
}

output "users_by_role" {
  value = local.users_by_role       # checking how they are grouped and also ordered
}
