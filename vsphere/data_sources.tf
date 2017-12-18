data "vsphere_datacenter" "this" {
  count = "${length(var.datacenters)}"
  name  = "${var.datacenters[count.index]}"
}

data "vsphere_resource_pool" "this" {
  count         = "${length(var.resource_pools)}"
  name          = "${var.resource_pools[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.this.id}"
}

data "vsphere_host" "this" {
  count         = "${length(var.hosts)}"
  name          = "${var.hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.this.id}"
}

data "vsphere_datastore" "this" {
  count         = "${length(var.datastores)}"
  name          = "${var.datastores[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.this.id}"
}

data "vsphere_distributed_virtual_switch" "this" {
  name          = "RegionA01-vDS-COMP"
  datacenter_id = "${data.vsphere_datacenter.this.id}"
}

data "vsphere_virtual_machine" "this" {
  count         = "${length(var.templates)}"
  name          = "${var.templates[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.this.id}"
}
