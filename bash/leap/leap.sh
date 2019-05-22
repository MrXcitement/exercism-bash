#!/usr/bin/env bash
# leap.sh
# Given a year, report if it is a leap year.
# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     unless the year is also evenly divisible by 400

# Mike Barker
# May 22nd, 2019

set -o errexit
set -o nounset

usage() {
    echo 'Usage: leap.sh <year>'
}

is_leap() {
    year="$1"
    if [[ $(( year % 4 )) -eq 0 ]] &&
       [[ $(( year % 100 )) -ne 0 ]] ||
       [[ $(( year % 400 )) -eq 0 ]]; then
        echo "true"
    else
        echo "false"
    fi
}

main() {
    # No arguments or too many
    if [[ $# -eq 0 || $# -gt 1 ]]; then
        usage
        return 1
    fi

    # Validate first argument is a number
    re_is_int='^[0-9]+$'
    if [[ ! "$1" =~ $re_is_int ]]; then
        usage
        return 1
    fi

    # Check if the year is a leap year
    is_leap "$1"

    return 0
}

main "$@"
