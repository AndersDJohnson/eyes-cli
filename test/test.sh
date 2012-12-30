#!/bin/bash

ROOT="$(dirname $(realpath "$0"))/.."
EYES="${ROOT}/bin/eyes"

fail() {
	 echo "Failed test \"$1\""
	 exit 1
}

$EYES "${ROOT}/package.json" || fail "file"
$EYES <( echo "{\"a\":9}" ) || fail "stdin echo"
$EYES <( curl -s "https://api.github.com/users/AndersDJohnson" ) || fail "stdin curl"

echo "No failures!"

