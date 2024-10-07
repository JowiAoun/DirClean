#!/bin/bash

# Create a mapping of current file & directory positions, and their new position.
function create_mapping() {
  # declare -A dir_map

  cd "$1" || exit 1;

  files=$(ls)

  echo "$files"
}

function organize() {
  echo "Organize" #TODO
}
