# terraform-ansible-systemd
Terraform module to manage a systemd unit on Linux with Ansible

> [!Warning]
> * This module doesn't have resources with a traditional state.
> * Make sure to set var.external_triggers for any changes that require an update other than variables.
> * This module doesn't delete the changes on the target system on destroy.

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | >= 1, < 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ansible"></a> [ansible](#provider\_ansible) | 1.3.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_unit_files"></a> [unit\_files](#module\_unit\_files) | ./modules/unit_files | n/a |

## Resources

| Name | Type |
|------|------|
| [ansible_playbook.systemd](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [ansible_playbook.systemd_daemon_reload](https://registry.terraform.io/providers/ansible/ansible/latest/docs/resources/playbook) | resource |
| [terraform_data.external](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.run_command](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.systemd](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.unit_files](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [terraform_data.variables](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | n/a | <pre>object({<br>    service = optional(string, null)<br>    timer   = optional(string, null)<br>  })</pre> | `{}` | no |
| <a name="input_external_triggers"></a> [external\_triggers](#input\_external\_triggers) | Triggers for rerunning the directory playbook except variables | `map(string)` | `{}` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of linux machine the directory will be created on | `string` | n/a | yes |
| <a name="input_unit_name"></a> [unit\_name](#input\_unit\_name) | Name of the systemd unit. | `string` | n/a | yes |
| <a name="input_unit_type"></a> [unit\_type](#input\_unit\_type) | Type of the systemd unit | `string` | `"service"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
