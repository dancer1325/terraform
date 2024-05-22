variable "list1" {
  default = ["item1", "item2"]
}

variable "list2" {
  default = ["item3", "item4"]
}

locals {
  service_name = "forum"
  owner        = "Community Team"

  # Use data source to reference instance IDs based on set
  instance_ids = concat(var.list1, var.list2)

  # consuming other local values
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}

# Output to show the merged instance IDs
output "merged_instance_ids" {
  value = local.instance_ids
}

# Output to show common tags
output "common_tags" {
  value = local.common_tags
}

# Use another module
module "subModule" {
  source = "./anotherModule"
}

# Next part fails     -- Uncomment to check
/*output "try_using_anothermodule_localvalues" {
  value = local.another
}*/
