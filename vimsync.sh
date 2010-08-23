#! /bin/zsh

# add to ~/bin: ln -s ~/configs/pyvim/vimsync.sh ~/bin/vimsync.sh

# Sync my vim config to a remote host specified.
# Steps:
#   1. cd ~/configs/pyvim
#   2. git co portable
#   3. rsync -avz --delete -e ssh ~/configs/pyvim dc:~
#   4. ln -s vim/vim .vim
#   5. ln -s vim/.vimrc .vimrc

# Notes:
#   Using a git branch since some stuff I run locally won't be on remote hosts
#   This setups the files in a directory on the host called vim and then it
#       symlinks the .vimrc and vim directory to the user's home dir
#   This currently syncs the git stuff as well, at some point should probably do
#       some fancy export to a tmp dir and rsync those files over instead

VIMCONF="/home/rharding/configs/pyvim"
VIMBRANCH="portable"

cd $VIMCONF
git checkout $VIMBRANCH

# get the hostname
if [ $# -ne 1 ]
then
    echo "Usage: vimsync HOSTNAME"
    return 65
fi

HOSTNAME=$1

rsync -avz --delete -e ssh ~/configs/pyvim $HOSTNAME:~/

ssh $HOSTNAME 'rm -r ~/.vimrc ~/.vim ; ln -s pyvim/vim .vim && ln -s pyvim/vimrc .vimrc'

# make sure we restore our local vim config to master
git checkout master

# @todo move the above into a shell function, setup a list of hosts, and loop
# through them to sync all hosts at once
