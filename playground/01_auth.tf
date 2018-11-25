# ---- use variables defined in terraform.tfvars file
variable "tenancy_ocid" {}

variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

variable "AD_bastion" {}
variable "AD_websrv1" {}
variable "AD_websrv2" {}
variable "AD_dbsrv" {}
variable "cidr_vcn" {}
variable "cidr_subnet_bastion" {}
variable "cidr_subnet1_lb" {}
variable "cidr_subnet2_lb" {}
variable "cidr_subnet_websrv1" {}
variable "cidr_subnet_websrv2" {}
variable "cidr_subnet_dbsrv" {}
variable "ip_bastion" {}
variable "authorized_ips_to_bastion" {}
variable "authorized_ips_to_lb" {}
variable "load_balancer_shape" {}
variable "bastion_instance_shape" {}
variable "bastion_bootstrap" {}
variable "bastion_ssh_public_key_file" {}
variable "bastion_ssh_private_key_file" {}
variable "websrv_instance_shape" {}
variable "websrv_bootstrap" {}
variable "websrv_ssh_public_key_file" {}
variable "websrv_ssh_private_key_file" {}
variable "dbsrv_instance_shape" {}
variable "dbsrv_bootstrap" {}
variable "dbsrv_ssh_public_key_file" {}
variable "dbsrv_ssh_private_key_file" {}

# ---- provider
provider "oci" {
  region           = "${var.region}"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
}
