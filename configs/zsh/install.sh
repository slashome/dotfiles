#!/bin/bash

# Install Oh-My-Zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

createLink zsh/zshrc $HOME/.zshrc
createLink zsh/zsh_aliases $HOME/.zsh_aliases

