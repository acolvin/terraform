# ------ Create a compute instance acolvin1 for SSH access from the most recent Oracle Linux 7.x image
resource "oci_core_instance" "tf-ukoug-acolvin1" {
  availability_domain  = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD_acolvin1 - 1],"name")}"
  compartment_id       = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name         = "UKOUG acolvin1"
  shape                = "${var.acolvin1_instance_shape}"
  preserve_boot_volume = "true"

  source_details {
    source_type = "image"
    source_id   = "${var.acolvin1_instance_image_id}"
  }

  create_vnic_details {
    subnet_id      = "${oci_core_subnet.tf-ukoug-acolvin1-sn.id}"
    hostname_label = "acolvin1"
    private_ip     = "${var.ip_acolvin1}"
  }

  metadata {
    ssh_authorized_keys = "${file(var.acolvin1_ssh_public_key_file)}"
    user_data           = "${base64encode(file(var.acolvin1_bootstrap))}"
  }
}
