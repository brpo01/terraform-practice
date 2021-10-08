variable image {
    type = map
    description = "image for container"
    default = {
        dev = "nodered/node-red:latest"
        prod = "nodered/node-red:latest-minimal"
    }
}

variable "ext_port" {
  type = map
  
  validation {
    condition = min(var.ext_port["dev"]...) >= 1990 && max(var.ext_port["dev"]...) <= 65535
    error_message = "The port range must be between 0 - 65535."
  }
  
  validation {
    condition = min(var.ext_port["prod"]...) >= 1880 && max(var.ext_port["prod"]...) <= 1889
    error_message = "The port range must be between 0 - 65535."
  }
}

variable "int_port" {
  type = number
  default = 1880
  
  validation {
    condition = var.int_port == 1880
    error_message = "The internal port for nodered must be 1880."
  }
}

locals {
 container_count = length(var.ext_port[terraform.workspace])
}


