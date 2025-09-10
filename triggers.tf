#################
# ansible files #
#################

resource "terraform_data" "systemd" {
  input = filemd5("${path.module}/systemd.yaml")
}

resource "terraform_data" "run_command" {
  input = filemd5("${path.module}/run_command.yaml")
}

#####################
# external triggers #
#####################

resource "terraform_data" "external" {
  input = join(",", values(var.external_triggers))
}

#####################
# unit_files #
#####################

resource "terraform_data" "unit_files" {
  input = join(",", values(module.unit_files.triggers))
}

#############
# variables #
#############

resource "terraform_data" "variables" {
  input = join(",", values({
    unit_name       = var.unit_name
    unit_type       = var.unit_type
    content_service = var.content.service != null ? var.content.service : ""
    content_timer   = var.content.timer != null ? var.content.timer : ""
  }))
}
