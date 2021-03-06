output "================ You can SSH to the compute instances" {
  value = <<EOF

Compartment OCID = ${data.oci_identity_compartments.compartments1.compartment_id}

VCN OCID = ${oci_core_virtual_network.tf-ukoug-vcn.id}

===== Public IP addresses:
acolvin1  : ${oci_core_instance.tf-ukoug-acolvin1.public_ip}
acolvin2  : ${oci_core_instance.tf-ukoug-acolvin2.public_ip}

===== Using ssh commands with all parameters
acolvin1  : ssh -i ${var.acolvin1_ssh_private_key_file} opc@${oci_core_instance.tf-ukoug-acolvin1.public_ip}
acolvin2  : ssh -o ProxyCommand='ssh -i ${var.acolvin1_ssh_private_key_file} -W %h:%p opc@${oci_core_instance.tf-ukoug-acolvin1.public_ip}' -i ${var.acolvin2_ssh_private_key_file} opc@${oci_core_instance.tf-ukoug-acolvin2.private_ip}

===== OR using the ssh aliases contained in the sshcfg file
ssh -F sshcfg acolvin1
ssh -F sshcfg acolvin2

  EOF
}

resource "local_file" "sshconfig" {
  content = <<EOF
Host acolvin1
    Hostname ${oci_core_instance.tf-ukoug-acolvin1.public_ip}
    User opc
    IdentityFile ${var.acolvin1_ssh_private_key_file}
    #proxycommand corkscrew <proxy-host> <proxy-port> %h %p
Host acolvin2
    Hostname ${oci_core_instance.tf-ukoug-acolvin2.private_ip}
    User opc
    IdentityFile ${var.acolvin2_ssh_private_key_file}
    ProxyCommand  ssh -F sshcfg -W %h:%p acolvin1
EOF

  filename = "sshcfg"
}
