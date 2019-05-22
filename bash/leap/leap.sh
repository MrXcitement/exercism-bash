#!/usr/bin/env bash
# leap.sh
# Given a year, report if it is a leap year.

# Mike Barker
# May 22nd, 2019

set -o errexit
set -o nounset

# How do we use this thing?
usage() {
    echo 'Usage: leap.sh <year>'
}

# a leap year is...
# on every year that is evenly divisible by 4
#  except every year that is evenly divisible by 100
#   unless the year is also evenly divisible by 400
is_leap() {
    year="$1"
    if (( year % 4 == 0 )) &&
       (( year % 100 != 0 )) ||
       (( year % 400 == 0 )); then
        echo "true"
    else
        echo "false"
    fi
}

main() {
    # No arguments or too many
    if (( $# == 0 )) || (( $# > 1 )); then
        usage
        return 1
    fi

    # Validate first argument is an integer
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
