output "nodes" {
    value = var.ext_net ? zipmap(
        openstack_compute_instance_v2.instance_ext.*.name,
        openstack_compute_instance_v2.instance_ext.*.access_ip_v4,
    ) : zipmap(
        openstack_compute_instance_v2.instance_int.*.name,
        openstack_compute_instance_v2.instance_int.*.access_ip_v4,
    )
}

