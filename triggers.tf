#################
# ansible files #
#################

resource "null_resource" "systemd" {
  triggers = {
    systemd = filemd5("${path.module}/systemd.yaml")
  }
}

resource "null_resource" "run_command" {
  triggers = {
    run_command = filemd5("${path.module}/run_command.yaml")
  }
}

#####################
# unit_files #
#####################

resource "null_resource" "unit_files" {
  triggers = module.unit_files.triggers
}

#############
# variables #
#############

resource "null_resource" "variables" {
  triggers = {
    unit_name       = var.unit_name
    unit_type       = var.unit_type
    content_service = var.content.service != null ? var.content.service : ""
    content_timer   = var.content.timer != null ? var.content.timer : ""
  }
}
