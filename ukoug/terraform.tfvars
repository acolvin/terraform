# ========== PLEASE UPDATE LINES BELOW TO MATCH YOUR OCI TENANT, COMPARTEMENT AND REGION
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa227qmmyla6dp7vubahwucb2bmk6lfp4yn5miw3qclyqltishu6pq"
user_ocid        = "ocid1.user.oc1..aaaaaaaalqyl73kfs5zacnfqtsq6knnx4on5ktftr6o4dzissn72srpk64mq"
fingerprint      = "23:75:d2:13:91:c9:76:3c:72:b1:72:39:78:7e:90:2a"
private_key_path = "api_key_acolvin.pem"
#compartment_ocid = "ocid1.compartment.oc1..aaaaaaaa5ge55kvuy3q2quigik4uleyo5tr4zetpmh22yp3cf7z4ulbl2xbq"
region           = "us-ashburn-1"
compartment_name = "acolvin40"

#authorized_ips_to_acolvin1    = "104.186.179.65/32"
authorized_ips_to_acolvin1    = "209.116.210.58/32"

# ========== NO NEED TO UPDATE LINES BELOW

# ---- availability domain (1, 2 or 3)
AD_acolvin1                  = "1"
AD_acolvin2                  = "2"
AD_websrv2                   = "3"
AD_dbsrv                     = "2"

# ---- IP addresses
cidr_vcn                     = "10.0.0.0/16"
cidr_subnet_acolvin1         = "10.0.0.0/24"
cidr_subnet_acolvin2         = "10.0.1.0/24"
ip_acolvin1                  = "10.0.0.44"
ip_acolvin2                  = "10.0.1.10"

# ---- acolvin1 compute instance
acolvin1_instance_shape       = "VM.Standard2.2"
acolvin1_bootstrap            = "bootstrap_acolvin1.sh"
acolvin1_ssh_public_key_file  = "sshkey_acolvin1.pub"
acolvin1_ssh_private_key_file = "sshkey_acolvin1"
acolvin1_instance_image_id    = "ocid1.image.oc1.iad.aaaaaaaa2mnepqp7wn3ej2axm2nkoxwwcdwf7uc246tcltg4li67z6mktdiq"

# ---- acolvin2 compute instance
acolvin2_instance_shape       = "VM.Standard2.1"
acolvin2_bootstrap            = "bootstrap_acolvin2.sh"
acolvin2_ssh_public_key_file  = "sshkey_acolvin2.pub"
acolvin2_ssh_private_key_file = "sshkey_acolvin2"
acolvin2_instance_image_id    = "ocid1.image.oc1.iad.aaaaaaaa2mnepqp7wn3ej2axm2nkoxwwcdwf7uc246tcltg4li67z6mktdiq"
