# Install neovim
echo 'Are you installing on Mac or Ubuntu?'
echo '1) Mac'
echo '2) Ubuntu'
read platform
if [ $platform = '1' ]; then
    brew install neovim
else
    sudo apt install neovim
fi


# Link config file for neovim
mkdir -p ~/.config/nvim
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim 

# Install plug (https://github.com/junegunn/vim-plug)
if [ $platform = '2' ]; then
    sudo apt install curl
fi
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plug packages
nvim +PlugInstall +qall

# Install python packages
pip3 install \
    python-language-server

# Notify about font
echo "====================================================================================="
echo "\n       Please install the DejaVu Font in this directory for symbols in nvim\n"
echo "====================================================================================="
