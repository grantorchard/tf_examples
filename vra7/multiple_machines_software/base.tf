provider "vra7" {
#--- Update terraform.tfvars for these details 
    username = "${var.username}"
    password = "${var.password}"
    host     = "${var.host}"
    tenant   = "${var.tenant}"
    insecure = true
}

resource "vra7_resource" "this" {
    catalog_name = "SQL 2016 Enterprise AAG Cluster"

    resource_configuration = {
        SQL2016_Install_2.SA_PWD = "${var.sa_pwd}"
        SQL2016_Install_2.INSTANCE_NAME = "${var.instance_name}"
        SQL2016_Install_AAG_Cluster.AlwaysOnAgName = "${var.alwayson_ag_name}"
        SQL2016_Install_AAG_Cluster.AlwaysOnAgDatabaseName = "${var.alwayson_ag_database_name}"
        Create_Failover_Cluster_1.ClusterIPAddress = "${var.cluster_ip_address}"
        Create_Failover_Cluster_1.ClusterName = "${var.cluster_name}"
        SQL2016_Install_1.SA_PWD = "${var.sa_pwd}"
        SQL2016_Install_1.INSTANCE_NAME = "${var.instance_name}"
  }
}