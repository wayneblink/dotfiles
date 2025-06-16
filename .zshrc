bindkey -v

export VISUAL=nvim
export EDITOR="$VISUAL"
export NIX_PATH=nixpkgs=channel:nixos-25.05:nixos-config=/home/wayne/dotfiles/nix/configuration.nix

source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
