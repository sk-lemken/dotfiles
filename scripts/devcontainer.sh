#!/bin/zsh --login

mkdir -p "$XDG_CONFIG_HOME"

if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
    git clone "https://gitlab.com/s.koenen/nvim-conf.git" "$XDG_CONFIG_HOME/nvim"
else
    (cd "$XDG_CONFIG_HOME/nvim" && git reset --hard && git stash && git pull)
fi

if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
    git clone "https://gitlab.com/s.koenen/zsh-conf.git" "$XDG_CONFIG_HOME/zsh"
    ln -sf "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
else
    (cd "$XDG_CONFIG_HOME/zsh" && git reset --hard && git stash && git pull)
fi
