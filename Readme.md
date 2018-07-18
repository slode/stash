stash
=====

`stash` is a command line productivity booster that makes it easier to work with
files. Essentially, it stores strings to a file, and then is able to retrieve the
strings in an xargs friendly way later. It's a bit like a command line clipboard.

It's inspired by ``git stash`` even if it's really not the same.

Install
=======

Installation is easy. Just install Linux, start a terminal, fetch the git
repository and type.

```
cp bin/* /my/bin/folder
```

Examples
========

```
# Adds a file (or several) with full path to the stash-file
$ stash <files>
-> Stashed '/path/to/file'

# Prints the stash-file with newline-separated, whitespace-escaped filenames
$ stash-list
-> ...

$ stash-list | cat
-> ...

# Clear the stash
$ stash-clear
-> Cleared stash.
```


