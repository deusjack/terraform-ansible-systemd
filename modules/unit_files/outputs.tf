output "triggers" {
  value = {
    service = var.content.service != null ? module.service_file.triggers.playbook : ""
    timer   = var.content.timer != null ? module.timer_file.triggers.playbook : ""
  }
  description = "Trigger for unit file changes to be used by other null_resources/modules"
}
