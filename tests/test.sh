stash-clear
stash file*
stash-list | xargs  file

stash-clear
find . -iname "file*" | stash
stash-list | xargs  file

stash-clear
find . -iname "file*" | stash
stash-run file
