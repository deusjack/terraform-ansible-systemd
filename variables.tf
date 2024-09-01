# Doesn't need a trigger. On change the playbooks is automatically replaced.
variable "hostname" {
  type        = string
  description = "The hostname of linux machine the directory will be created on"
}

variable "unit_name" {
  type        = string
  description = "Name of the systemd unit."
}

variable "unit_type" {
  type        = string
  default     = "service"
  description = "Type of the systemd unit"
  validation {
    condition     = contains(["service", "timer"], var.unit_type)
    error_message = "Supported values are service or timer."
  }
}

variable "content" {
  type = object({
    service = optional(string, null)
    timer   = optional(string, null)
  })
  default = {}
  validation {
    condition     = (var.content.timer != null && var.content.service != null) || var.content.timer == null
    error_message = "If timer is set, service must be set."
  }
}
