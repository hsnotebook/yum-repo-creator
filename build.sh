#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

script_home=$(cd $(dirname "${0}"); pwd)

main() {
    docker buildx build -t repo-creator -f Dockerfile .
}

main "${@}"
