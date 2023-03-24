
# see https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles
# codespace looks for install.sh in the root of the repo, and runs it
SCRIPT_PATH=$(dirname $(readlink -f $0))

# install oh-my-zsh if it doesn't exist
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
    # for vscode, do "terminal.integrated.shell.linux": "/usr/bin/zsh", so that it's default
fi

# install github-copilot-cli if it doesn't exist
if [ ! -f /usr/local/bin/github-copilot-cli ]; then
    echo "Installing github-copilot-cli"
    npm install -g @githubnext/github-copilot-cli
fi

# remove .zshrc if it exists
if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
fi

if [ -h ~/.zshrc ]; then
    rm ~/.zshrc
fi

# create symlink to zshrc, codespace automatically symlinks starting with ".", but we are taking over to gain control, so no ".zshrc" file
# see https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles
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