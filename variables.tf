variable "image" {
  type        = map(any)
  description = "image for container"
  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "quay.io/influxdb/influxdb:v2.0.2"
      prod = "quay.io/influxdb/influxdb:v2.0.2"
    }
    grafana = {
      dev  = "grafana/grafana:6.5.0"
      prod = "grafana/grafana:6.5.0"
    }
  }
}

variable "ext_port" {
  type = map(any)

  # validation {
  #   condition = min(var.ext_port["dev"]...) >= 1990 && max(var.ext_port["dev"]...) <= 65535
  #   error_message = "The port range must be between 0 - 65535."
  # }

  # validation {
  #   condition = min(var.ext_port["prod"]...) >= 1880 && max(var.ext_port["prod"]...) <= 1889
  #   error_message = "The port range must be between 0 - 65535."
  # }
}

variable "int_nodered_port" {
  type    = number
  default = 1880

  validation {
    condition     = var.int_nodered_port == 1880
    error_message = "The internal port for nodered must be 1880."
  }
}

variable "int_influxdb_port" {
  type    = number
  default = 8086

  validation {
    condition     = var.int_influxdb_port == 8086
    error_message = "The internal port for influxdb must be 8086."
  }
}

variable "int_grafana_port" {
  type    = number
  default = 3000

  validation {
    condition     = var.int_grafana_port == 3000
    error_message = "The internal port for grafana must be 3000."
  }
}




