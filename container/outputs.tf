# output "ipaddress"{
#   value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
#   description = "the ip address & name of the first container"
# }


# output "name"{
#   value = docker_container.nodered_container.name
#   description = "the name of the container"
# }