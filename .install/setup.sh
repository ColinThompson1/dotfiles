#!/bin/zsh

# Step 1: Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Step 2: Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Step 3: Run Brewfile
if [ -f "$HOME/.install/Brewfile" ]; then
    echo "Running Brewfile..."
    brew bundle --file="$HOME/.install/Brewfile"
else
    echo "Brewfile not found. Please ensure you have a Brewfile in your home directory."
fi

# Step 4: Install Vim plugins
echo "Installing Vim plugins..."
vim +PlugInstall +qall


# Step 5: Installing Lanugage Servers 
echo "Installing language servers..."
go install golang.org/x/tools/gopls@latest

echo "Setup complete!"
