# Ghostty shell integration for Bash. This should be at the top of your bashrc!
# for mac
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/bash/ghostty.bash"
fi

set -o vi

export NIX_PATH=nixpkgs=channel:nixos-24.11:nixos-config=/home/wayne/dotfiles/nix/configuration.nix

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

eval "$(direnv hook bash)"
