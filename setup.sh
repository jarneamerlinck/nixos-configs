#! /bin/bash
# Setup nixos home manager
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# add home manager requirements
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update


#cd into home
cd /home;
cd "$(find . -maxdepth 1 -type d |grep /)";
mkdir -p .config/nixpkgs;

curl https://raw.githubusercontent.com/jarneamerlinck/nixos-configs/main/home.nix > .config/nixpkgs/home.nix

cp /etc/nixos/configuration.nix /etc/nixos/configuration.nix.preinstall

curl https://raw.githubusercontent.com/jarneamerlinck/nixos-configs/main/nixos/configuration.nix > /etc/nixos/configuration.nix
# rebuild and check configs
nixos-rebuild switch