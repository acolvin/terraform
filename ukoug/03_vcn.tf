# -------- get the list of available ADs
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}

# ------ Create a new VCN
resource "oci_core_virtual_network" "tf-ukoug-vcn" {
  cidr_block     = "${var.cidr_vcn}"
#  compartment_id = "${oci_identity_compartment.compartment1.compartment_id}"
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name   = "UKOUG vcn"
  dns_label      = "tfdemovcn"
}

# ------ Create a new Internet Gategay
resource "oci_core_internet_gateway" "tf-ukoug-ig" {
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name   = "UKOUG internet gateway"
  vcn_id         = "${oci_core_virtual_network.tf-ukoug-vcn.id}"
}

# ====== NETWORK OBJECTS FOR acolvin1

# ------ Create a new Route Table for acolvin1 subnet
resource "oci_core_route_table" "tf-ukoug-acolvin1-rt" {
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.tf-ukoug-vcn.id}"
  display_name   = "UKOUG acolvin1 RT"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.tf-ukoug-ig.id}"
  }
}

# ------ Create a new security list for acolvin1 subnet
resource "oci_core_security_list" "tf-ukoug-acolvin1-sl" {
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name   = "UKOUG acolvin1 seclist"
  vcn_id         = "${oci_core_virtual_network.tf-ukoug-vcn.id}"

  egress_security_rules = [
    {
      protocol    = "all"
      destination = "0.0.0.0/0"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "all"
      source   = "${var.cidr_vcn}"
    },
    {
      protocol = "6"                     # tcp
      source   = "${var.authorized_ips_to_acolvin1}"

      tcp_options {
        "min" = 22        # to allow SSH acccess to the acolvin1 instance from outside world
        "max" = 22
      }
    },
  ]
}

# ------ Create a public subnet for acolvin1
resource "oci_core_subnet" "tf-ukoug-acolvin1-sn" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD_acolvin1 - 1],"name")}"
  cidr_block          = "${var.cidr_subnet_acolvin1}"
  display_name        = "UKOUG acolvin1 subnet"
  dns_label           = "acolvin1"
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.tf-ukoug-vcn.id}"
  route_table_id      = "${oci_core_route_table.tf-ukoug-acolvin1-rt.id}"
  security_list_ids   = ["${oci_core_security_list.tf-ukoug-acolvin1-sl.id}"]
  dhcp_options_id     = "${oci_core_virtual_network.tf-ukoug-vcn.default_dhcp_options_id}"
}

# ====== NETWORK OBJECTS FOR ACOLVIN2

# ------ Create a new Route Table for web server subnet
resource "oci_core_route_table" "tf-ukoug-websrv-rt" {
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.tf-ukoug-vcn.id}"
  display_name   = "UKOUG web server RT"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.tf-ukoug-ig.id}"
  }
}

# ------ Create a new security list for web server subnet
resource "oci_core_security_list" "tf-ukoug-websrv-sl" {
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  display_name   = "UKOUG web server seclist"
  vcn_id         = "${oci_core_virtual_network.tf-ukoug-vcn.id}"

  egress_security_rules = [
    {
      protocol    = "all"
      destination = "0.0.0.0/0"
    },
  ]

  ingress_security_rules = [

    # -- allow HTTP acccess to the web server from all hosts
    {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
        "min" = 80
        "max" = 80
      }
    },

    # -- allow SSH acccess to the web server from the bastion host
    {
      protocol = "6"                     # tcp
      source   = "${var.cidr_subnet_acolvin1}"

      tcp_options {
        "min" = 22
        "max" = 22
      }
    },
  ]
}

# ------ Create a public subnet for acolvin2
resource "oci_core_subnet" "tf-ukoug-acolvin2-sn" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[var.AD_acolvin2 - 1],"name")}"
  cidr_block          = "${var.cidr_subnet_acolvin2}"
  display_name        = "UKOUG web server subnet"
  dns_label           = "web1"
  compartment_id = "${data.oci_identity_compartments.compartments1.compartment_id}"
  vcn_id              = "${oci_core_virtual_network.tf-ukoug-vcn.id}"
  route_table_id      = "${oci_core_route_table.tf-ukoug-websrv-rt.id}"
  security_list_ids   = ["${oci_core_security_list.tf-ukoug-websrv-sl.id}"]
  dhcp_options_id     = "${oci_core_virtual_network.tf-ukoug-vcn.default_dhcp_options_id}"
}
