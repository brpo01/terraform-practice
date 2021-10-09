locals {
  deployment = {
    nodered = {
      container_count = length(var.ext_port["nodered"][terraform.workspace])
      image           = var.image["nodered"][terraform.workspace]
      int             = var.int_nodered_port
      ext             = var.ext_port["nodered"][terraform.workspace]
      volumes = [
        { container_path_each = "/data" },
      ]
    }
    influxdb = {
      container_count = length(var.ext_port["influxdb"][terraform.workspace])
      image           = var.image["influxdb"][terraform.workspace]
      int             = var.int_influxdb_port
      ext             = var.ext_port["influxdb"][terraform.workspace]
      volumes = [
        { container_path_each = "/var/lib/influxdb" },
      ]
    }
    grafana = {
      container_count = length(var.ext_port["grafana"][terraform.workspace])
      image           = var.image["grafana"][terraform.workspace]
      int             = var.int_grafana_port
      ext             = var.ext_port["grafana"][terraform.workspace]
      volumes = [
        { container_path_each = "/var/lib/grafana" },
        { container_path_each = "/etc/grafana" }
      ]
    }
  }
}