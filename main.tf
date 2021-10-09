module "image" {
  source   = "./image"
  for_each = local.deployment
  image_in = each.value.image
}

module "container" {
  source      = "./container"
  count_in    = each.value.container_count
  for_each    = local.deployment
  name_in     = each.key
  image_in    = module.image[each.key].image_out
  internal_in = each.value.int
  external_in = each.value.ext
  volume_in   = each.value.volumes
}




