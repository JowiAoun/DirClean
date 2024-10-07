#!/bin/bash

# shellcheck disable=SC1091
source ./lib/interface.sh

LOG_DIR=logs

# Create a mapping of current file & directory positions, and their new position.
function create_mapping() {
  declare -n mapping="$1"

  cd "$2" || exit 1;

  files=$(ls)

  while IFS= read -r line; do
    if [[ -f "$line" ]]; then
      # extension="${line##*.}"

      mapping["$line"]="someDir/$line" #TODO: define a new directory based on extension

      # echo "$line -> ${mapping[$line]}"

    elif [[ -d "$line" ]]; then
      mapping["$line"]="directories/$line"

      # echo "$line -> ${mapping[$line]}"

    else
      print_invalid_file_or_dir "$line" ; exit 1
    fi
  done <<< "$files"
}

function organize() {
  # shellcheck disable=SC2178
  declare -n mapping="$1"

  current_datetime=$(date +"%Y-%m-%d-%H:%M:%S")

  echo "Organizing..."

  if [[ "$2" == true && ! -d $LOG_DIR ]]; then
    mkdir $LOG_DIR
  fi

  for key in "${!mapping[@]}"; do
    echo "$key -> ${mapping[$key]}" | tee -a "$LOG_DIR/$current_datetime.log"
  done
}
