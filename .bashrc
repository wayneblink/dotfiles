set -o vi

export NIX_PATH=nixpkgs=channel:nixos-24.11:nixos-config=/home/wayne/dotfiles/nix/configuration.nix

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
