stash-clear
stash file*
stash-list | xargs  file

stash-clear
find . -iname "file*" | stash
stash-list | xargs  file
stash-run file
stash-run cat
stash-run echo


stash-clear
find . -iname "file*" | stash
tmpfolder=`mktemp -d`
stash-run cp -t $tmpfolder
ls $tmpfolder | wc -l
