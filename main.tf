module "unit_files" {
  source    = "./modules/unit_files"
  hostname  = var.hostname
  unit_name = var.unit_name
  unit_type = var.unit_type
  content   = var.content
}

resource "ansible_playbook" "systemd_daemon_reload" {
  depends_on              = [module.unit_files]
  name                    = var.hostname
  playbook                = "${path.root}/../ansible/run_command.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    cmd = "systemctl daemon-reload"
  }
  lifecycle {
    replace_triggered_by = [
      null_resource.run_command,
      null_resource.unit_files
    ]
  }
}

resource "ansible_playbook" "vault_systemd" {
  depends_on              = [ansible_playbook.systemd_daemon_reload]
  name                    = var.hostname
  playbook                = "${path.root}/../ansible/systemd.yaml"
  replayable              = false
  ignore_playbook_failure = false
  extra_vars = {
    systemd_service_name = "${var.unit_name}.${var.unit_type}"
  }
  lifecycle {
    replace_triggered_by = [
      null_resource.systemd,
      null_resource.unit_files
    ]
  }
}
