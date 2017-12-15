provider "vsphere" {
    user     = "administrator@vsphere.local"
    password = "VMware1!"
    vsphere_server = "vcsa-01a.corp.local"
    allow_unverified_ssl = true
}