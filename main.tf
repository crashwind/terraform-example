resource "openstack_compute_keypair_v2" "mongo_ubuntu_keypair" {
    provider    = openstack.ovh
    count       = 1
    region      = "GRA7"
    name        = "mongo-ubuntu"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwwCqFTxUxnz8m3sRLxlfNc2a2NUx7RnLCxzD9xPW3xCfzV35JEQcdIVyWC1O8FnT5lTW8pegjtZImep8nisQ4/KGJluWxS3eOEU62kb0/GFtuNvVLVu8u7/3fJubxCtUgpFDwLlP5qA8tqqCbDc03eQ3hGvTztwzZ8DpKTW/l9i1hhNlayJD2D6MSPlwGyDgghi56FeDiGQQmMp1YLfOn5owsgsR5WpBLuwxiXmKKpnxd2W1+EWCA1gjCi7TtE7sZ0O9zqrysU3v+kCNhP5hJBdNJVBufMW2udnbITOFYk5HmJxRxfuuV4VizK87ymv5+VHHT5iL7vqSVJqytJ6OgZZvV9Wq/Ajs6fjYAg+CChbvs/pKrtkSCCfkRqz+2FTvDEGBrv5xWMg0UiQlQso2Y9XJho/afSTV1JR53jptshL1QEdMZSH3HmiJqyzqdPyYhw1nwmKjSdKCCUAMWO+THB7MYn7aQDpBPMwUktLlE0iX1uAl1vT/JH7EktwXrwE4kT371ju4UdGddqkYv+0AUUqrXIdcflPUX+BHEU+ljEJmfNs6hLm8UtDOaq9kzuowO3+3o7/rrMC6nB61YR7iv6vJsSYTZP8//k+cL5JXQGFc5Nc0m/xsjsC6YjODQ7XDJsjvEyrZQaAN/IUTMDjlZQm0pkJ6jl/TU6E24JyasIw== k-petrov@k-petrov-osx.local"
}

module "mongo-0" {
    source = "./bricks/instance"
    providers = {
        openstack.ovh = openstack.ovh
    }

    name            = "mongodb-rs"
    regions         = ["GRA7"]
    network_name    = "test_network1"
    instance_index  = 0

    key_pair        = "mongo-ubuntu"
    flavor_name     = "s1-4"
    image_name      = "Ubuntu 18.04"
    ext_net         = true
    int_network_fixed_ip = [var.Mongo_host_address[0]]
}

module "mongo-1" {
    source = "./bricks/instance"
    providers = {
        openstack.ovh = openstack.ovh
    }

    name            = "mongodb-rs"
    regions         = ["GRA7"]
    network_name    = "test_network1"
    instance_index  = 1

    key_pair        = "mongo-ubuntu"
    flavor_name     = "s1-4"
    image_name      = "Ubuntu 18.04"
    ext_net         = true
    int_network_fixed_ip = [var.Mongo_host_address[1]]
}

module "mongo-2" {
    source = "./bricks/instance"
    providers = {
        openstack.ovh = openstack.ovh
    }

    name            = "mongodb-rs"
    regions         = ["GRA7"]
    network_name    = "test_network1"
    instance_index  = 2

    key_pair        = "mongo-ubuntu"
    flavor_name     = "s1-4"
    image_name      = "Ubuntu 18.04"
    ext_net         = true
    int_network_fixed_ip = [var.Mongo_host_address[2]]
}
