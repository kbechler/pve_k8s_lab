#!/bin/bash

source ./env.sh

(
    cd OpenTofu/network
    tofu init
    tofu validate
    tofu plan
    tofu apply
    tofu output -json > ../../Ansible/files/tofu_network.json
)

(
    cd OpenTofu/ceph
    tofu init
    tofu validate
    tofu plan
    tofu apply
    tofu output -json > ../../Ansible/files/tofu_ceph.json
)

(
    cd OpenTofu/rke2
    tofu init
    tofu validate
    tofu plan
    tofu apply
    tofu output -json > ../../Ansible/files/tofu_rke2.json
)

(
    cd Ansible
    python3 scripts/gen_inventory.py
    ansible-playbook -i inventory ./network.yml
    ansible-playbook -i inventory ./ceph.yml
    ansible-playbook -i inventory ./rke2.yml
)
