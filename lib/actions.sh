#!/bin/bash

# shellcheck disable=SC1091
source ./lib/interface.sh

LOG_DIR=logs

# Create a mapping of current file & directory positions, and their new position.
function create_mapping() {
  declare -n mapping="$1"
  declare -A ext_mapping

  cd "$2" || exit 1;

  files=$(ls)

  while IFS=":" read -r key value; do
    key_lowercase="${key,,}"
    ext_mapping[$key_lowercase]=$value
  done < ./config/ext_mapping.txt

  while IFS= read -r line; do
    if [[ -f "$line" ]]; then
      extension="${line##*.}"

      if [[ -z "${ext_mapping[$extension]}" ]]; then
        mapping["$line"]="Others/$line"
      else
        mapping["$line"]="${ext_mapping[$extension]}/$line"
      fi

      echo "$line -> ${mapping[$line]}"

    elif [[ -d "$line" ]]; then
      mapping["$line"]="Directories/$line"

      echo "$line -> ${mapping[$line]}"
      
    else
      print_invalid_file_or_dir "$line" ; exit 1
    fi
  done <<< "$files"
}

function organize() {
  # shellcheck disable=SC2178
  declare -n mapping="$1"

  current_datetime=$(date +"%Y-%m-%d-%H:%M:%S")

  echo "Difference"
  echo "----------"

  if [[ "$2" == true ]]; then
    mkdir -p $LOG_DIR
  fi

  for key in "${!mapping[@]}"; do
    file_output="$key -> ${mapping[$key]}"
    if [[ "$2" == true ]]; then
      echo "$file_output" | tee -a "$LOG_DIR/$current_datetime.log"
    else
      echo "$file_output"
    fi
  done

  for key in "${!mapping[@]}"; do
    target_path="${mapping[$key]}"
    target_dir=$(dirname "$target_path")

    mkdir -p "$target_dir"

    if [[ -f "$key" || -d "$key" ]]; then
      cp -r "$key" "$target_dir"
    else
      echo "File '$key' does not exist -> Skipping"
    fi
  done
}
