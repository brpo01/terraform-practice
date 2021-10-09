# output "ipaddress"{
#   value = flatten(module.container[*].ipaddress)
#   description = "the ip address & name of the first container"
# }


# output "name"{
#   value = module.container[*].name
#   description = "the name of the container"
# }

output "application_access" {
  value       = module.container[*]
  description = "The name, ipaddress & ports of the containers"
}
