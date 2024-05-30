provider "aws" {}

// Model object / declare top level networks + subnets
variable "networks" {
  type = map(object({
    cidr_block = string
    subnets    = map(object({ cidr_block = string }))
  }))
  default = {
    "private" = {
      cidr_block = "10.1.0.0/16"
      subnets = {
        "db1" = {
          cidr_block = "10.1.0.1/16"
        }
        "db2" = {
          cidr_block = "10.1.0.2/16"
        }
      }
    },
    "public" = {
      cidr_block = "10.1.1.0/16"
      subnets = {
        "webserver" = {
          cidr_block = "10.1.1.1/16"
        }
        "email_server" = {
          cidr_block = "10.1.1.2/16"
        }
      }
    }
    "dmz" = {
      cidr_block = "10.1.2.0/16"
      subnets = {
        "firewall" = {
          cidr_block = "10.1.2.1/16"
        }
      }
    }
  }
}

resource "aws_vpc" "example" {
  for_each = var.networks

  cidr_block = each.value.cidr_block
}

locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a list of lists of objects.
  network_subnets = flatten([
   // resultTypeStart for temporarySymbol in inputType : expression... resultTypeEnd      -- for expression --
    for network_key, network in var.networks : [
      for subnet_key, subnet in network.subnets : {
        network_key = network_key
        subnet_key  = subnet_key
        network_id  = aws_vpc.example[network_key].id
        cidr_block  = subnet.cidr_block
      }
    ]
  ])
}

resource "aws_subnet" "example" {
  # local.network_subnets is a list, so we must now project it into a map
  # where each key is unique. We'll combine the network and subnet keys to
  # produce a single unique key per instance.
  for_each = tomap({
    for subnet in local.network_subnets : "${subnet.network_key}.${subnet.subnet_key}" => subnet
  })

  vpc_id            = each.value.network_id
  availability_zone = each.value.subnet_key
  cidr_block        = each.value.cidr_block
}
