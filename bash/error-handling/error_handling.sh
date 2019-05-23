#!/usr/bin/env bash
# error_handling.sh
# Implement various kinds of error handling and resource management.

# Mike Barker
# May 22nd, 2019

set -o errexit
set -o nounset

usage() {
    echo "Usage: ./${0%.*} <greetee>"
}

main() {
    if (( $# == 0 )) || (( $# > 1 )); then
        usage
        return 1
    fi

    echo "Hello, $1"
    return 0
}
main "$@"
