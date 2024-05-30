# 2. for_each for a module
// Invoking a module, passing the arguments
module "bucket" {
  # module's meta argument
  for_each = toset(["assets", "media"])   // Several module instances
  source   = "./publish_bucket"

  # module's input variable
  name     = "${each.key}_bucket"
}
