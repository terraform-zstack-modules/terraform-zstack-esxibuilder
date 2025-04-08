<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_zstack"></a> [zstack](#requirement\_zstack) | 1.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_esxi_builder_image"></a> [esxi\_builder\_image](#module\_esxi\_builder\_image) | git::http://172.20.14.17/jiajian.chi/terraform-zstack-image.git | n/a |
| <a name="module_esxi_builder_instance"></a> [esxi\_builder\_instance](#module\_esxi\_builder\_instance) | git::http://172.20.14.17/jiajian.chi/terraform-zstack-instance.git | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.ks_cfg](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [terraform_data.remote_exec](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_storage_name"></a> [backup\_storage\_name](#input\_backup\_storage\_name) | Name of the backup storage to use | `string` | `"bs"` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br/><br/>Examples:<pre>context:<br/>  project:<br/>    name: string<br/>    id: string<br/>  environment:<br/>    name: string<br/>    id: string<br/>  resource:<br/>    name: string<br/>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_esxi_iso_filename"></a> [esxi\_iso\_filename](#input\_esxi\_iso\_filename) | ESXi ISO文件名 | `string` | `"VMware-VMvisor-Installer-6.5.0.update01-5969303.x86_64.iso"` | no |
| <a name="input_esxi_iso_url"></a> [esxi\_iso\_url](#input\_esxi\_iso\_url) | URL to download the ESXi ISO from | `string` | `"http://192.168.200.100/mirror/iso/vmware/VMware_iso/VMware-VMvisor-Installer-6.5.0.update01-5969303.x86_64.iso"` | no |
| <a name="input_esxi_root_password"></a> [esxi\_root\_password](#input\_esxi\_root\_password) | Root password for the ESXi installation | `string` | `"ZStack@123"` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Name for the esxi\_builder image | `string` | `"esxi_builder_by_terraform"` | no |
| <a name="input_image_url"></a> [image\_url](#input\_image\_url) | URL to download the image from | `string` | `"http://minio.zstack.io:9000/packer/redis-by-packer-image-compressed.qcow2"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name for the esxi\_builder instance | `string` | `"esxi_builder"` | no |
| <a name="input_instance_offering_name"></a> [instance\_offering\_name](#input\_instance\_offering\_name) | Name of the instance offering to use | `string` | `"min"` | no |
| <a name="input_l3_network_name"></a> [l3\_network\_name](#input\_l3\_network\_name) | Name of the L3 network to use | `string` | `"test"` | no |
| <a name="input_never_stop"></a> [never\_stop](#input\_never\_stop) | Whether the instance should never be stopped automatically | `bool` | `true` | no |
| <a name="input_ssh_password"></a> [ssh\_password](#input\_ssh\_password) | SSH password for remote access | `string` | `"ZStack@123"` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | SSH username for remote access | `string` | `"zstack"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_esxi_iso_url"></a> [esxi\_iso\_url](#output\_esxi\_iso\_url) | ESXi  下载地址 |
| <a name="output_service_ip"></a> [service\_ip](#output\_service\_ip) | Service IP |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->