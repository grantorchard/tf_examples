provider "vra7" {
#--- Update terraform.tfvars for these details 
    username = "${var.username}"
    password = "${var.password}"
    host     = "${var.host}"
    tenant   = "${var.tenant}"
    insecure = true
}

resource "vra7_resource" "this" {
    catalog_name = "Linux VM"

    catalog_configuration = {
        lease_days = 1
    }

    resource_configuration = {
        machine_0.cpu    = 1
        machine_0.memory = 1024
  }
}