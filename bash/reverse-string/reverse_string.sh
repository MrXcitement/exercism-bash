#!/usr/bin/env bash

set -o errexit
set -o nounset

reverse_string() {
    in_str="$1"
    out_str=""
    for (( i=${#in_str}-1; i>=0; i-- ))
    do
        out_str="${out_str}${in_str:i:1}"
    done
    echo "$out_str"
}

main() {
    echo reverse_string "$1"
}

main "$@"
