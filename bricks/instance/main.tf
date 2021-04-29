provider "openstack" {
    alias = "ovh"
}

variable "name" {}
variable "regions" {}
variable "network_name" {}
variable "key_pair" {}
variable "instance_index" {
    default = 0
}
variable "flavor_name" {
    default = "s1-2"
}
variable "image_name" {
    default = "Ubuntu 18.04"
}
variable "ext_net" {
    default = false
}
variable "int_network_fixed_ip" {
    default = []
}

resource "openstack_compute_instance_v2" "instance_ext" {
    count = var.ext_net ? length(var.regions) : 0
    region = element(var.regions, count.index)
    name = format("%s-%s.%s", var.name, var.instance_index, lower(element(var.regions, count.index)))

    provider = openstack.ovh
    image_name = var.image_name
    flavor_name = var.flavor_name

    key_pair = var.key_pair

    network {
        name            = "Ext-Net"
        access_network  = true
    }
    network {
        name        = var.network_name
        fixed_ip_v4 = length(var.int_network_fixed_ip)>0 ? element(var.int_network_fixed_ip, count.index) : ""
    }
}

resource "openstack_compute_instance_v2" "instance_int" {
    count = var.ext_net ? 0 : length(var.regions)
    region = element(var.regions, count.index)
    name = format("%s-%s.%s", var.name, var.instance_index, lower(element(var.regions, count.index)))

    provider = openstack.ovh
    image_name = var.image_name
    flavor_name = var.flavor_name

    key_pair = var.key_pair

    network {
        name        = var.network_name
        fixed_ip_v4 = length(var.int_network_fixed_ip)>0 ? element(var.int_network_fixed_ip, count.index) : ""
    }
}
