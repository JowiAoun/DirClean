#!/bin/bash

function print_help() {
  echo "Usage: dirclean [options]
        -h, --help        Show help.
        -v, --version     Show version.
        -d, --directory   Directory to organize. Default: current directory.
        -l, --log         Enable logging.
        -n, --dry-run     Perform dry-run to preview changes.
        -c, --copy        Copy instead of moving directories.
        ">&2
}

function print_version() {
  echo "v$1" >&2
}

function print_invalid_opt() {
  echo "Invalid option: -$1" >&2
}

function print_invalid_value() {
  echo "Option '-$1' requires an argument" >&2
}

function print_invalid_file_or_dir() {
  echo "File '$1' does not exist" >&2
}
