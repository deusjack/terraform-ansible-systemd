# unit_files

Terraform module to conditionally create unit files

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
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3, < 4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service_file"></a> [service\_file](#module\_service\_file) | git@github.com:deusjack/terraform-ansible-file.git | 1.0.0 |
| <a name="module_timer_file"></a> [timer\_file](#module\_timer\_file) | git@github.com:deusjack/terraform-ansible-file.git | 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | n/a | <pre>object({<br>    service = optional(string, null)<br>    timer   = optional(string, null)<br>  })</pre> | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | The hostname of linux machine the directory will be created on | `string` | n/a | yes |
| <a name="input_unit_name"></a> [unit\_name](#input\_unit\_name) | Name of the systemd unit. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_triggers"></a> [triggers](#output\_triggers) | Trigger for unit file changes to be used by other null\_resources/modules |
<!-- END_TF_DOCS -->
