#!/bin/bash

# Set the custom Zsh directory
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Function to check the success of a command
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed."
        exit 1
    fi
}

# Initialize a flag to check if anything was done
anything_done=false

# Check if zsh-autosuggestions is already cloned
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Cloning zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    check_command "git clone zsh-autosuggestions"
    anything_done=true
else
    echo "zsh-autosuggestions plugin is already cloned."
fi

# Check if spaceship-prompt is already cloned
if [ ! -d "$ZSH_CUSTOM/themes/spaceship-prompt" ]; then
    echo "Cloning spaceship-prompt theme..."
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    check_command "git clone spaceship-prompt"
    anything_done=true
else
    echo "spaceship-prompt theme is already cloned."
fi

# Check if the symlink for spaceship.zsh-theme exists
if [ ! -L "$ZSH_CUSTOM/themes/spaceship.zsh-theme" ]; then
    echo "Creating symlink for spaceship.zsh-theme..."
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    check_command "creating symlink for spaceship.zsh-theme"
    anything_done=true
else
    echo "Symlink for spaceship.zsh-theme already exists."
fi

# Final message based on whether anything was done
if [ "$anything_done" = true ]; then
    echo "Installation completed successfully."
else
    echo "All components are already set up. No changes were made."
fi
