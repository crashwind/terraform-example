#!/usr/bin/env bash

#jq -r '.resources[].instances[].attributes | select(.access_ip_v4) | [.name, .access_ip_v4] | @tsv' ../terraform.tfstate


jq -r '{
    "mongo_master": {
        "hosts": [.resources[]["instances"][]["attributes"] | select(.access_ip_v4) | .name ] | sort | .[:1]
    },
    "mongo_replicas": {
        "hosts": [.resources[]["instances"][]["attributes"] | select(.access_ip_v4) | .name ] | sort | .[1:]
    },
    "_meta": {
        "hostvars": [
            [[(.resources[]["instances"][]["attributes"] | select(.access_ip_v4))] | sort_by(.name) | .[:1] | .[] | {(.name): {"ansible_host": .access_ip_v4, "internal_ip": (.network | .[] | select(.access_network == false) | .fixed_ip_v4), "internal_mac": (.network | .[] | select(.access_network == false) | .mac), "mongodb_master": true}}],
            [[(.resources[]["instances"][]["attributes"] | select(.access_ip_v4))] | sort_by(.name) | .[1:] | .[] | {(.name): {"ansible_host": .access_ip_v4, "internal_ip": (.network | .[] | select(.access_network == false) | .fixed_ip_v4), "internal_mac": (.network | .[] | select(.access_network == false) | .mac) }}]
        ] | add | add
    }
}' ../terraform.tfstate
