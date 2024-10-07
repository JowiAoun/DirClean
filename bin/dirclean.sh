#!/bin/bash

version=1.0.0

# shellcheck disable=SC1091
source ./lib/interface.sh
# shellcheck disable=SC1091
source ./lib/actions.sh

# Main function to the program.
function main() {

  # Set default argument values
  directory=.
  log=false
  dry_run=false
  copy=false
  
  # Read all positional arguments
  while getopts ":hvlncd:" opt; do
    case ${opt} in
      h ) print_help ; exit 0 ;;
      v ) print_version "$version"; exit 0 ;;
      d ) directory=$OPTARG ; echo "Directory to organize: '$directory'" ;;
      l ) log=true ;;
      n ) dry_run=true ;;
      c ) copy=true ;;
      \? ) print_invalid_opt "$OPTARG" ; exit 1 ;;
      : ) print_invalid_value "$OPTARG" ; exit 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  # Create mapping of current directories to new directories
  declare -A _mapping
  create_mapping _mapping "$directory"

  # Organize
  if [[ $dry_run == false ]]; then
    organize _mapping "$log" "$directory" "$copy"
  else
    echo "-------"
    echo "Because this was a dry run, no modifications were completed."
  fi
}

main "$@"
