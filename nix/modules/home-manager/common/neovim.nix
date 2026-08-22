{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withRuby = false;
    withPython3 = false;

    # Keep managing ~/.config/nvim via mkOutOfStoreSymlink in default.nix:
    # sideload HM-generated lua through the wrapper instead of writing
    # nvim/init.lua into the symlinked directory (build fails on conflict).
    sideloadInitLua = true;
  };
}
