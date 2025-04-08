locals {
  context = var.context
}

module "esxi_builder_image" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-image.git"

  create_image        = true
  image_name          = var.image_name
  image_url           = var.image_url
  guest_os_type      = "Linux"
  platform           = "Linux"
  format             = "qcow2"
  architecture       = "x86_64"

  backup_storage_name = var.backup_storage_name
}

module "esxi_builder_instance" {
  source = "git::http://172.20.14.17/jiajian.chi/terraform-zstack-instance.git"

  name                  = var.instance_name
  description           = "esxi_builder Created by Terraform devops"
  instance_count        = 1
  image_uuid            = module.esxi_builder_image.image_uuid
  l3_network_name       = var.l3_network_name
  instance_offering_name = var.instance_offering_name
}

resource "local_file" "ks_cfg" {
   content = templatefile("${path.module}/files/KS.CFG.tpl", {
    esxi_root_password = var.esxi_root_password
  })
  filename = "${path.module}/files/KS.CFG"
}

resource "terraform_data" "remote_exec" {
  depends_on = [module.esxi_builder_instance, local_file.ks_cfg]

  connection {
      type     = "ssh"
      host     = module.esxi_builder_instance.instance_ips[0]
      user     = var.ssh_user
      password = var.ssh_password
      timeout  = "5m"
  }

  provisioner "file" {
    source      = "${path.module}/files/iso-builder-setup.sh"
    destination = "/home/zstack/iso-builder-setup.sh"
    on_failure = fail
  }

  provisioner "file" {
    source      = "${path.module}/files/esxi_ks_iso.sh"
    destination = "/home/zstack/esxi_ks_iso.sh"
    on_failure = fail
  }

  provisioner "file" {
    source      = "${path.module}/files/KS.CFG"
    destination = "/home/zstack/KS.CFG"
    on_failure = fail
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_password}' | sudo -S sh -c 'echo \"zstack ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/zstack'",
      "echo '${var.ssh_password}' | sudo -S chmod 440 /etc/sudoers.d/zstack",
      "cd /home/zstack",
      "chmod +x iso-builder-setup.sh",
      "sudo bash iso-builder-setup.sh",
      "chmod +x esxi_ks_iso.sh",
      "if [ ! -f '${var.esxi_iso_filename}' ]; then wget -q ${var.esxi_iso_url} -O ${var.esxi_iso_filename}; fi",
      "sudo ./esxi_ks_iso.sh -i ${var.esxi_iso_filename} -k KS.CFG",
      "sudo cp /dev/shm/esxibuilder/esxi-ks.iso /var/www/html/iso/",
      "sudo chmod 644 /var/www/html/iso/*.iso"
    ]
    on_failure = fail
  }

}

