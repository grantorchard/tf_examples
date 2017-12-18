provider "vsphere" {
  user                 = "${var.user}"
  password             = "${var.password}"
  vsphere_server       = "${var.vsphere_server}"
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
}

resource "vsphere_distributed_port_group" "this" {
  count                           = "${length(var.port_groups)}"
  name                            = "${var.port_groups[count.index]}"
  distributed_virtual_switch_uuid = "${data.vsphere_distributed_virtual_switch.this.id}"
}

resource "vsphere_virtual_machine" "this" {
  count            = "${length(var.vms)}"
  name             = "${var.virtual_machine_name_prefix}${count.index}"
  resource_pool_id = "${data.vsphere_resource_pool.this.id}"
  host_system_id   = "${data.vsphere_host.this.*.id[0]}"
  datastore_id     = "${data.vsphere_datastore.this.id}"

  num_cpus = 2
  memory   = 1024

  guest_id = "${data.vsphere_virtual_machine.this.*.guest_id[0]}"

  network_interface {
    network_id   = "${vsphere_distributed_port_group.this.*.id[0]}"
    adapter_type = "${var.adapter_type}"
  }
  disk {
    name = "${var.virtual_machine_name_prefix}${count.index}.vmdk"
    size = "${data.vsphere_virtual_machine.this.*.disks.0.size[0]}"
  }
  clone {
    template_uuid = "${data.vsphere_virtual_machine.this.*.id[0]}"

    customize {
      linux_options {
        host_name = "${var.virtual_machine_name_prefix}${count.index}"
        domain    = "${var.domain}"
      }

      network_interface {
        ipv4_address = "${var.ipaddress[count.index]}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "${var.gateway}"
    }
  }
}
