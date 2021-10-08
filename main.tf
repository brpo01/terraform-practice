locals {
  deployment = {
    nodered = {
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image = var.image["nodered"][terraform.workspace]
      int = var.int_nodered_port
      ext = var.ext_port["nodered"][terraform.workspace]
      container_path = "/data"
    }
    influxdb = {
      container_count = length(var.ext_port["influxdb"][terraform.workspace])
      image = var.image["influxdb"][terraform.workspace]
      int = var.int_influxdb_port
      ext = var.ext_port["influxdb"][terraform.workspace]
      container_path = "/var/lib/influxdb"
    }
  }
}


module "image"{
  source = "./image"
  for_each = local.deployment
  image_in = each.value.image
}

module "container" {
    source = "./container"
    count_in = each.value.container_count
    for_each = local.deployment
    name_in = each.key
    image_in = module.image[each.key].image_out
    internal_in = each.value.int
    external_in = each.value.ext
    container_path_in = each.value.container_path
}




