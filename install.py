#!/usr/bin/env python
""" Install the files needed for this config to operate on the user's system
correctly"""

import os
import subprocess

# command to run:
# ln -s /home/rharding/configs/pyvim/vimrc ~/.vimrc
# ln -s /home/rharding/configs/pyvim/vim ~/.vim


CONFIG_FILES = ['.vimrc', '.vim']
HOME_PATH = os.path.expanduser('~')


def removefile(filename):
    removing_link = "%s/%s" % (HOME_PATH, filename)
    ret = subprocess.call(["rm", "-rf", removing_link])
    print "%s is the status code for removing %s" % (ret, removing_link)
    return


def linkfile(filename):
    link_location = "%s/%s" % (HOME_PATH, filename)
    is_located = "%s" % (os.path.abspath(filename))

    ret = subprocess.call(["ln", "-s", is_located, link_location])
    print "%s is the status code for linking %s to %s" % (ret,
            is_located,
            link_location)
    return



for conf_file in CONFIG_FILES:
    removefile(conf_file)
    linkfile(conf_file)
