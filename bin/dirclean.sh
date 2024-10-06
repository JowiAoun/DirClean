#!/bin/bash

n=4

echo "I love clean repositories!"

if (( $n > 5 )); then
  echo "Does not error out, but should be picked up by ShellCheck!"
fi
