# ---- use variables defined in terraform.tfvars file
variable "tenancy_ocid" {}
variable "compartment_name" {}

variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
#variable "compartment_ocid" {}
variable "region" {}

variable "AD_acolvin1" {}
variable "cidr_vcn" {}
variable "cidr_subnet_acolvin1" {}
variable "ip_acolvin1" {}
variable "authorized_ips_to_acolvin1" {}
variable "acolvin1_instance_shape" {}
variable "acolvin1_bootstrap" {}
variable "acolvin1_ssh_public_key_file" {}
variable "acolvin1_ssh_private_key_file" {}
variable "acolvin1_instance_image_id" {}

variable "AD_acolvin2" {}
variable "ip_acolvin2" {}
variable "cidr_subnet_acolvin2" {}
variable "acolvin2_instance_shape" {}
variable "acolvin2_bootstrap" {}
variable "acolvin2_ssh_public_key_file" {}
variable "acolvin2_ssh_private_key_file" {}
variable "acolvin2_instance_image_id" {}

# ---- provider
provider "oci" {
  region           = "${var.region}"
  tenancy_ocid     = "${var.tenancy_ocid}"
  user_ocid        = "${var.user_ocid}"
  fingerprint      = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
}
