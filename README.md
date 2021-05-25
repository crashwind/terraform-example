# about

terraform with ansible example (ovh)

## files
```
openrc  - ENV file from OVH web interface (auth url, tenant id, etc...)
tokens  - OVH_APPLICATION_KEY, OVH_APPLICATION_SECRET, OVH_CONSUMER_KEY
```

## prerequisites
ovh works well with terraform v0.12
```
$ brew install terraform@0.12
$ brew info terraform@0.12|grep export # on your own

$ terraform --version
Terraform v0.12.30
```

# terraform
`terraform.tfstate` - state file. corruption of this file leads to big problems.

## init
```
$ terraform init
```

## refresh local state
```
$ terraform refresh
$ terraform state list
openstack_compute_keypair_v2.mongo_ubuntu_keypair[0]
module.mongo-0.openstack_compute_instance_v2.instance_ext[0]
module.mongo-1.openstack_compute_instance_v2.instance_ext[0]
module.mongo-2.openstack_compute_instance_v2.instance_ext[0]
```

## mark for recreation
```
$ terraform taint [object path from 'state list' output]
```

## check plan
```
$ terraform plan
```

expected: `No changes. Infrastructure is up-to-date.`

## apply changes
`-auto-approve` may be dangerous, use it carefully
```
$ terraform apply -auto-approve
```

## destroy
destroy all resources, ssh key pairs, VMs, networks, etc...
```
$ terraform destroy
```
or with limits:
```
$ terraform destroy -target=[object path from 'state list' output]
```
