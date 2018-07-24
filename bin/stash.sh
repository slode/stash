#!/bin/bash
# stash filename1 filename2
# stash-list => filename1 filename2 filename3
# stash-clear

# set -x

stash_file=~/.stash

function print_stash {
  touch $stash_file
  cat $stash_file | sed 's/ /\\ /g '
}

function run_stash {
  touch $stash_file
  cat $stash_file | xargs -d "\n" -n1 $@
}

function pop_stash {
  # for a nice mark/recall feature, add
  # alias stash-go='cd $(stash-pop)'
  # to your .bashrc
  touch $stash_file
  last_line=`tail -n1 $stash_file`
  truncate -s -"$(echo $last_line | wc -c)" $stash_file
  echo -n "$last_line"
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
  stash-pop)
    pop_stash
    ;;
  stash-do)
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
