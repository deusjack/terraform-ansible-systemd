module "service_file" {
  count    = var.content.service != null ? 1 : 0
  source   = "git@github.com:deusjack/terraform-ansible-file.git?ref=1.1.0"
  hostname = var.hostname
  content  = var.content.service
  path     = "/etc/systemd/system/${var.unit_name}.service"
  mode     = "0644"
}

module "timer_file" {
  count    = var.content.timer != null ? 1 : 0
  source   = "git@github.com:deusjack/terraform-ansible-file.git?ref=1.1.0"
  hostname = var.hostname
  content  = var.content.timer
  path     = "/etc/systemd/system/${var.unit_name}.timer"
  mode     = "0644"
}
