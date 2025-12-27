output "triggers" {
  value = {
    service = var.content.service != null ? one(module.service_file).triggers.file : ""
    timer   = var.content.timer != null ? one(module.timer_file).triggers.file : ""
  }
  description = "Trigger for unit file changes to be used by other terraform_data/modules"
}
