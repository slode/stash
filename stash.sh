#!/bin/bash
# stash filename1 filename2
# stash-list => filename1 filename2 filename3
# stash-clear

# set -x

stash_file=~/.stash

function print_stash {
  while read i; do echo "\"$i\""; done < <( sort "$stash_file" | uniq )
}

function clear_stash {
  (rm "$stash_file" 2>&1 /dev/null  && echo "Cleared stash.") || (echo "No stash." && exit )
}

function add_to_stash {
  for i in "$@"; do
    full_path=$(readlink -f "$i")
    echo -e $full_path >> $stash_file
    echo "Stashed '$full_path'."
  done
}

case $(basename "$0") in
  stash-list)
    print_stash
    ;;
  stash-clear)
    clear_stash
    ;;
  stash)
    if [ $# -eq 0 ]; then
      while read INPUT
      do
        add_to_stash "$INPUT"
      done
    else
      add_to_stash "$@"
    fi
    ;;
esac
