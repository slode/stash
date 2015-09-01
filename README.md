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
cp stash/stash /my/bin/folder
ln -s /my/bin/folder/stash /my/bin/folder/stash-list
ln -s /my/bin/folder/stash /my/bin/folder/stash-clear
```

Examples
========

There really is a broad range of simple and complex tasks that can be made
easier using `stash`, but the below example reflects the original use-case, and
I consider it sort of canonical.

```
$ cd /some/long/and/complex/path
$ stash file1 file2 file2
$ cd /move/to/some/other/funky/path
$ stash-list | xargs cp {} .
$ stash-clear
```

The benefits might not be evident immediately from this example, but note that
the actual `stash` and the subsequent `stash-list` might be run from two
different terminals. So you suddenly avoid doing a lot of clunky copy-pasting.

You could really substitute stash with a few trivial lines of bash, but stash
can save you a few key-strokes.
