# ------ Create a compute instance BASTION HOST from the most recent Oracle Linux 7.x image
resource "oci_core_instance" "tf-ukoug-acolvin2" {
  availability_domain  = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD_acolvin2 - 1],"name")}"
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name         = "UKOUG acolvin2"
  shape                = "${var.acolvin2_instance_shape}"
  preserve_boot_volume = "true"

  source_details {
    source_type = "image"
    source_id   = "${var.acolvin2_instance_image_id}"
  }

  create_vnic_details {
    subnet_id      = "${oci_core_subnet.tf-ukoug-acolvin2-sn.id}"
    hostname_label = "acolvin2"
    private_ip     = "${var.ip_acolvin2}"
  }

  metadata {
    ssh_authorized_keys = "${file(var.acolvin2_ssh_public_key_file)}"
    user_data           = "${base64encode(file(var.acolvin2_bootstrap))}"
  }
}
