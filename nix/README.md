### Building and Applying Configurations

NixOS:
```
sudo nixos-rebuild switch --flake .#{machine}
```

nix-darwin:
```
sudo darwin-rebuild switch --flake .#{machine}
```

home-manager:
```
home-manager switch --flake .#{user}@{machine}
```
NOTE: on fresh systems, bootstrap Home Manager first:
```
nix-shell -p home-manager
```


### Updating flakes
```
nix flake update
```
