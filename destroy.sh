#!/bin/bash

source ./env.sh

(
    cd OpenTofu/rke2
    tofu destroy
)

(
    cd OpenTofu/ceph
    tofu destroy
)

(
    cd OpenTofu/network
    tofu destroy
)
