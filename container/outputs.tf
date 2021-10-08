# output "ipaddress"{
#   value = [for i in docker_container.container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
#   description = "the ip address & name of the first container"
# }


# output "name"{
#   value = docker_container.container.name
#   description = "the name of the container"
# }

output "application_access" {
  value = {for x in docker_container.container[*]: x.name => join(":", [x.ip_address], x.ports[*]["external"])}
}