#!/usr/bin/env python
import os, sys, os

stash_file = os.path.expanduser("~/.stash")

def shellquote(s):
    return "" + s.replace(' ', '\ ') + ""

def print_stash():
    arguments = []
    with open(stash_file, 'r') as stash:
        for line in stash:
            arguments.append(shellquote(line.strip()))
    print(" ".join(arguments))

def clear_stash():
    os.remove(stash_file)
    print("Removed {0}.".format(stash_file))

def add_to_stash(files):
    with open(stash_file, 'a') as stash:
        for f in files:
            absolute_path = os.path.abspath(f)
            stash.write(absolute_path)
            stash.write("\n")
            print("Stashed '{0}'.".format(absolute_path))

if __name__ == "__main__":
    script_name = os.path.basename(sys.argv[0])

    try:
        if script_name == "stash-list":
            print_stash()
        elif script_name == "stash-clear":
            clear_stash()
        elif script_name == "stash":
            add_to_stash(sys.argv[1:])
        else:
            pass
    except IOError:
        print("No stash file found.")
    except OSError:
        print("No stash file found.")


            

