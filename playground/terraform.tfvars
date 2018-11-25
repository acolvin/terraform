# ========== PLEASE UPDATE LINES BELOW TO MATCH YOUR OCI TENANT, COMPARTEMENT AND REGION
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa227qmmyla6dp7vubahwucb2bmk6lfp4yn5miw3qclyqltishu6pq"
user_ocid        = "ocid1.user.oc1..aaaaaaaalqyl73kfs5zacnfqtsq6knnx4on5ktftr6o4dzissn72srpk64mq"
fingerprint      = "23:75:d2:13:91:c9:76:3c:72:b1:72:39:78:7e:90:2a"
private_key_path = "api_key_acolvin.pem"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaa5ge55kvuy3q2quigik4uleyo5tr4zetpmh22yp3cf7z4ulbl2xbq"
region           = "us-ashburn-1"

authorized_ips_to_bastion    = "104.186.179.65/32"

# ========== NO NEED TO UPDATE LINES BELOW

# ---- availability domain (1, 2 or 3)
AD_bastion                   = "1"
AD_websrv1                   = "2"
AD_websrv2                   = "3"
AD_dbsrv                     = "2"

# ---- IP addresses
cidr_vcn                     = "10.0.0.0/16"
cidr_subnet_bastion          = "10.0.0.0/24"
cidr_subnet1_lb              = "10.0.10.0/24"
cidr_subnet2_lb              = "10.0.20.0/24"
cidr_subnet_websrv1          = "10.0.30.0/24"
cidr_subnet_websrv2          = "10.0.40.0/24"
cidr_subnet_dbsrv            = "10.0.50.0/24"
ip_bastion                   = "10.0.0.9"

# ---- Authorized public IPs ingress
authorized_ips_to_lb         = "0.0.0.0/0"

# ---- Load Balancer
load_balancer_shape          = "100Mbps"

# ---- Bastion compute instance
bastion_instance_shape       = "VM.Standard2.1"
bastion_bootstrap            = "bootstrap_bastion.sh"
bastion_ssh_public_key_file  = "sshkey_bastion.pub"
bastion_ssh_private_key_file = "sshkey_bastion"

# ---- Web server compute instance
websrv_instance_shape        = "VM.Standard2.1"
websrv_bootstrap             = "bootstrap_websrv.sh"
websrv_ssh_public_key_file   = "sshkey_websrv.pub"
websrv_ssh_private_key_file  = "sshkey_websrv"

# ---- DB server compute instance
dbsrv_instance_shape         = "VM.Standard1.1"
dbsrv_bootstrap              = "bootstrap_dbsrv.sh"
dbsrv_ssh_public_key_file    = "sshkey_dbsrv.pub"
dbsrv_ssh_private_key_file   = "sshkey_dbsrv"
