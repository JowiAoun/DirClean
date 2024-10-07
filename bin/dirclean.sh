#!/bin/bash

version=1.0.0

# shellcheck disable=SC1091
source ./lib/interface.sh
# shellcheck disable=SC1091
source ./lib/actions.sh

# Main function to the program.
function main() {

  # Create default argument values
  directory=.
  log=false
  dry_run=false
  
  # Read all positional arguments
  while getopts ":hvlnd:" opt; do
    case ${opt} in
      h ) print_help ; exit 0 ;;
      v ) print_version "$version"; exit 0 ;;
      d ) directory=$OPTARG ; echo "Directory to organize: '$directory'" ;;
      l ) log=true ;;
      n ) dry_run=true ;;
      \? ) print_invalid_opt "$OPTARG" ; exit 1 ;;
      : ) print_invalid_value "$OPTARG" ; exit 1 ;;
    esac
  done
  shift $((OPTIND - 1))

  # Create mapping of current directories to new directories
  create_mapping "$directory" "$log"

  # Organize
  if [[ $dry_run == false ]]; then
    organize #TODO: provide mapping
  else
    echo "This was a dry run, therefore no modifications were completed."
  fi
}

main "$@"
