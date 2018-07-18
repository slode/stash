#!/bin/bash
# stash filename1 filename2
# stash-list => filename1 filename2 filename3
# stash-clear

# set -x

stash_file=~/.stash

function print_stash {
  touch $stash_file
  cat $stash_file | sort -u | sed 's/ /\\ /g '
}

function run_stash {
  touch $stash_file
  cat $stash_file | sort -u | tr '\n' '\0' | xargs -0 -n1 $@
}

function clear_stash {
  echo -n "" > $stash_file
  echo "Cleared stash."
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
  stash-run)
    run_stash $@
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
