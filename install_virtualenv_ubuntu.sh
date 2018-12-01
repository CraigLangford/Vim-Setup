# Install python pip3
sudo apt install python3-pip

# Install virtualenv and virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper

# Add config to .bashrc
cat >> ~/.bashrc <<- END

# virtualenvwrapper config for python
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh
END

# Reload .bashrc
cat << END
=========================================================================

    virtualenvwrapper installed; please run the following to complete

    $ source ~/.bashrc

=========================================================================
END