variable user {
  type    = "string"
  default = "administrator@vsphere.local"
}

variable password {
  type    = "string"
  default = ""
}

variable vsphere_server {
  type    = "string"
  default = ""
}

variable allow_unverified_ssl {
  default = true
}

variable datacenters {
  type    = "list"
  default = []
}

variable resource_pools {
  type    = "list"
  default = []
}

variable hosts {
  type    = "list"
  default = []
}

variable datastores {
  type    = "list"
  default = []
}

variable port_groups {
  type    = "list"
  default = []
}

variable templates {
  type    = "list"
  default = []
}

variable vms {
  type    = "list"
  default = []
}

variable virtual_machine_name_prefix {
  type    = "string"
  default = "tf-"
}

variable adapter_type {
  type    = "string"
  default = "vmxnet3"
}

variable ipaddress {
  type    = "list"
  default = []
}

variable gateway {
  type    = "string"
  default = ""
}

variable domain {
  type    = "string"
  default = ""
}
