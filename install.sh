#!/bin/bash

CONFIG_DIR="$HOME/.config/neovim/"
PROFILE_SCRIPT="$HOME/.neovim_profiles.sh"

if [[ ! -d $CONFIG_DIR ]]; then
    echo "Configuration directory $CONFIG_DIR does not exist."
    exit 1
fi

echo "Generating Neovim profile setup..."

> "$PROFILE_SCRIPT"

for profile in "$CONFIG_DIR"/*; do
    if [[ -d "$profile" ]]; then
        profile_name=$(basename "$profile")
        echo "alias n$profile_name=\"NVIM_APPNAME=neovim/$profile_name nvim\"" >> ~/.neovim_profiles.sh
    fi
done

cat << EOF >> ~/.neovim_profiles.sh

function nvims() {
    items=("default" "\$(ls -d $CONFIG_DIR/*/ | xargs -n 1 basename)")
    config=\$(printf "%s\n" "\${items[@]}" | fzf --prompt="  Neovim Config" --height=~50% --layout=reverse --border --exit-0)
    if [[ -z \$config ]]; then
        echo "Nothing selected"
        return 0
    elif [[ \$config == "default" ]]; then
        config=""
    fi
    NVIM_APPNAME="neovim/\$config" nvim $@
}

EOF

echo "Neovim profile setup generated and saved in $PROFILE_SCRIPT"
echo "Would you like to add a call to it in your shell profile? (y/n)"
read -r response
if [[ $response == "y" ]]; then
    if [[ -f ~/.zshrc ]]; then
        # Check if the line is already present in .zshrc
        if ! grep -Fxq "source $PROFILE_SCRIPT" ~/.zshrc; then
            echo "source $PROFILE_SCRIPT" >> ~/.zshrc
            echo "Neovim profile setup added to .zshrc"
            echo "Please restart your shell or run 'source ~/.zshrc' to apply the changes."
        else
            echo "Neovim profile setup is already sourced in .zshrc"
        fi
    elif [[ -f ~/.bashrc ]]; then
        # Check if the line is already present in .bashrc
        if ! grep -Fxq "source $PROFILE_SCRIPT" ~/.bashrc; then
            echo "source $PROFILE_SCRIPT" >> ~/.bashrc
            echo "Neovim profile setup added to .bashrc"
            echo "Please restart your shell or run 'source ~/.bashrc' to apply the changes."
        else
            echo "Neovim profile setup is already sourced in .bashrc"
        fi
    else
        echo "Could not find a shell profile to add the Neovim profile setup to."
        exit 1
    fi
fi
