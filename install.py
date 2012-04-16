#!/usr/bin/env python
""" Install the files needed for this config to operate on the user's system
correctly"""

import os
import subprocess

# command to run:
# ln -s /home/rharding/configs/vim/vimrc ~/.vimrc
# ln -s /home/rharding/configs/vim/vim ~/.vim


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


def empty_bundles():
    """Need to clear out the bundles to make this reusable"""
    subprocess.call('rm -rf bundle/*', shell=True)


def remove_bundles():
    """Remove the bundle dir from the .vim dir"""
    subprocess.call('rm -rf $HOME/.vim/bundle', shell=True)


def install_bundles():
    """Read bundles file and git clone each repo into .vim/bundle"""
    bundle_list = open('bundle_list')
    git_cmd = '/usr/bin/git clone {0} $HOME/configs/vim/bundle/{1}'
    for b in bundle_list:
        if not b.startswith('#'):
            dirname_idx = b.rfind('/') + 1
            dirname = b[dirname_idx:].strip()
            subprocess.call(git_cmd.format(b.strip(), dirname), shell=True)

    # and finally link to the .vim/bundle dir
    link_location = "%s/%s" % (HOME_PATH, '.vim/bundle')
    is_located = "%s" % (os.path.abspath('bundle'))

    ret = subprocess.call(["cp", "-r", is_located, link_location])
    print "{0} is the status code for linking {1} to {2}".format(ret,
        is_located, link_location)
    return


def fix_xmledit():
    """In order xmledit in html you need to link the file to html.vim"""
    xmledit_path = "$HOME/.vim/bundle/xmledit.git/ftplugin"
    xml = os.path.join(xmledit_path, 'xml.vim')
    html = os.path.join(xmledit_path, 'html.vim')
    mako = os.path.join(xmledit_path, 'mako.vim')

    print xml
    print html
    print mako
    subprocess.call('ln -s {0} {1}'.format(xml, html), shell=True)
    subprocess.call('ln -s {0} {1}'.format(xml, mako), shell=True)


def copy_custom_snippets():
    """We need to add our custom snippets after the plugin is downloaded/setup

    """
    import glob, shutil, os
    copy_to = os.path.expanduser('~/.vim/bundle/snipmate.vim.git/snippets')
    for file in glob.glob("custom_snippets/*.snippets"):
        shutil.copy(file, copy_to)


for conf_file in CONFIG_FILES:
    removefile(conf_file)
    linkfile(conf_file)

empty_bundles()
remove_bundles()
install_bundles()
fix_xmledit()
copy_custom_snippets()
