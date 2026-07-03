#!/bin/bash

source ./env.sh

(
    cd OpenTofu/network
    tofu init
    tofu validate
    tofu plan
    tofu apply
)

(
    cd OpenTofu/ceph
    tofu init
    tofu validate
    tofu plan
    tofu apply
)

(
    cd OpenTofu/rke2
    tofu init
    tofu validate
    tofu plan
    tofu apply
)
