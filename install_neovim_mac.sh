# Install neovim
brew install neovim

# Link config file for neovim
mkdir -p ~/.config/nvim
ln -s $(pwd)/nvim/init.vim ~/.config/nvim/init.vim 

# Install plug (https://github.com/junegunn/vim-plug)
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
