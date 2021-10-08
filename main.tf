resource "null_resource" "dockervolume"{
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/"
  } 
}

module "image"{
  source = "./image"
  image_in = var.image[terraform.workspace]
}

resource "random_string" "random"{
  count = local.container_count
  length = 4
  special = false
  upper = false
}

module "container" {
    source = "./container"
    depends_on = [null_resource.dockervolume]
    count = local.container_count
    name_in = join("-",["nodered", terraform.workspace, random_string.random[count.index].result])
    image_in = module.image.image_out
    internal_in = var.int_port
    external_in = var.ext_port[terraform.workspace][count.index]
    container_path_in = "/data"
    host_path_in = "${path.cwd}/noderedvol"
}




