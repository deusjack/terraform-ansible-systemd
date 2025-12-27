module "unit_files" {
  source    = "./modules/unit_files"
  hostname  = var.hostname
  unit_name = var.unit_name
  content   = var.content
}

resource "terraform_data" "systemd" {
  depends_on = [module.unit_files]
  input = jsonencode({
    unit_name       = var.unit_name
    unit_type       = var.unit_type
    content_service = var.content.service != null ? var.content.service : ""
    content_timer   = var.content.timer != null ? var.content.timer : ""
    external        = var.external_triggers
    unit_files      = module.unit_files.triggers
  })

  connection {
    host = jsondecode(self.output).hostname
    user = "root"
  }

  provisioner "remote-exec" {
    when = create
    inline = [
      "systemctl daemon-reload",
      "systemctl enable --now ${jsondecode(self.output).unit_name}.${jsondecode(self.output).unit_type}",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "systemctl disable --now ${jsondecode(self.output).unit_name}.${jsondecode(self.output).unit_type}",
    ]
  }
}
