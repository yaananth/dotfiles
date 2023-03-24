# remove .zshrc if it exists
SCRIPT_PATH=$(dirname $(readlink -f $0))

if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
fi

if [ -h ~/.zshrc ]; then
    rm ~/.zshrc
fi

# create symlink to zshrc, codespace automatically symlinks starting with ".", but we are taking over to gain control, so no ".zshrc" file
ln -s $SCRIPT_PATH/zshrc ~/.zshrc

# clone zsh-autosuggestions if it doesn't exist
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "Cloning zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

echo "Done!"

# if codei is already linked, remove it
if [ -h /usr/local/bin/codei ]; then
    echo "Removing existing codei symlink"
    sudo rm /usr/local/bin/codei
fi

# if /usr/local/bin/code-insiders exists, create a symlink to it as "codei"
if [ -f /usr/local/bin/code-insiders ]; then
    if [ ! -f /usr/local/bin/codei ]; then
        echo "code-insiders found, linking codei to code-insiders"
        sudo ln -s /usr/local/bin/code-insiders /usr/local/bin/codei
    fi
else
    echo "code-insiders not found, but, linking codei to code"
    sudo ln -s /usr/local/bin/code /usr/local/bin/codei
fi