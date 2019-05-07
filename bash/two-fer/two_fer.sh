#!/usr/bin/env bash
# two-fer.sh --- "One for X, one for me."
# Mike Barker
# May 7th, 2019

# When no name is given display
# One for you, one for me.
# When a name is given display
# One for 'name', one for me.
# For example if the name is Alice, display
# One for Alice, one for me.

set -o errexit
set -o nounset

main() {
	local name
	name=you
	if [[ $# -gt 0 ]]; then
		name="$*"
	fi
	echo "One for ${name}, one for me."
}

main "$@"
