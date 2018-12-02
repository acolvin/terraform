resource "oci_identity_compartment" "compartment1" {
  name           = "${var.compartment_name}"
  description    = "compartment created by terraform"
  compartment_id = "${var.tenancy_ocid}"
  enable_delete  = true                              // true will cause this compartment to be deleted when running `terrafrom destroy`
}

data "oci_identity_compartments" "compartments1" {
  compartment_id = "${oci_identity_compartment.compartment1.id}"

  filter {
    name   = "name"
    values = ["${var.compartment_name}"]
  }
}

