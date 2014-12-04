stash
=====

`stash` is a command line productivity booster that makes it easier to work with
files. Essentially, it stores paths to files, and then is able to retrieve the
paths in a command line appropriate format later.

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
$ cp `stash-list` .
$ stash-clear
```

The benefits might not be evident immediately from this example, but note that
the actual `stash` and the subsequent `stash-list` might be run from two
different terminals. So you suddenly avoid doing a lot of clunky copy-pasting.

Todo
====

I should probably rewrite it in Haskell or something else esoteric, but bash
will do for now. Someone should probably also add a zsh autocomplete-plugin.
That would be awesome.
