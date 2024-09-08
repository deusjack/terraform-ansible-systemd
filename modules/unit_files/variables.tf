# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of linux machine the directory will be created on"
}

variable "unit_name" {
  type        = string
  description = "Name of the systemd unit."
}

variable "content" {
  type = object({
    service = optional(string, null)
    timer   = optional(string, null)
  })
  validation {
    condition     = (var.content.timer != null && var.content.service != null) || var.content.timer == null
    error_message = "If timer is set, service must be set."
  }
}
