# about

ansible with dynamic inventory
```
hosts.sh            - dynamic inventory
hosts               - static inventory
mongo.yml           - configure mongo replica set
netplan.yml         - configure instance network
requirements.yml    - ansible roles/plugins
```

# prerequisites
## jq
`jq` is a cli tool required to parse json

## ansible-galaxy
```
$ ansible-galaxy install -r requirements.yml
Starting galaxy role install process
- downloading role 'netplan', owned by mrlesmithjr
- downloading role from https://github.com/mrlesmithjr/ansible-netplan/archive/v0.3.0.tar.gz
- extracting mrlesmithjr.netplan to /Users/k-petrov/work/git/tf1/ansible/roles/mrlesmithjr.netplan
- mrlesmithjr.netplan (v0.3.0) was installed successfully
- downloading role 'mongodb', owned by undergreen
- downloading role from https://github.com/UnderGreen/ansible-role-mongodb/archive/v2.7.0.tar.gz
- extracting undergreen.mongodb to /Users/k-petrov/work/git/tf1/ansible/roles/undergreen.mongodb
- undergreen.mongodb (v2.7.0) was installed successfully

$ ansible-galaxy role list
- mrlesmithjr.netplan, v0.3.0
- undergreen.mongodb, v2.7.0

$ tree -L 1 roles/
roles/
├── mrlesmithjr.netplan
└── undergreen.mongodb
```

# network
## access
check access
```
$ ansible all -m ping
...
    "ping": "pong"
...
```

## configure network on instances
```
$ ansible-playbook netplan.yml
```

# mongo
configure mongo replica set
```
$ ansible-playbook mongo.yml

$ ansible all -m shell -a 'mongo --quiet --eval "rs.status()[\"ok\"]"'
mongodb-rs-2.gra7 | CHANGED | rc=0 >>
1
mongodb-rs-0.gra7 | CHANGED | rc=0 >>
1
mongodb-rs-1.gra7 | CHANGED | rc=0 >>
1
```
