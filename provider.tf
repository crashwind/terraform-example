# Configure the OpenStack provider hosted by OVH
provider "openstack" {
    auth_url = "https://auth.cloud.ovh.net/v3" # Authentication URL
    alias = "ovh"
    domain_name = "default" # Domain Name - Always "default" for OVH
}

provider "ovh" {
    alias = "ovh"
    endpoint           = "ovh-ca"
}

provider "ovh" {
    endpoint           = "ovh-ca"
}
