{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/compositors/niri.nix 
      ../../modules/desktop.nix
      ../../modules/desktop-apps.nix
      ../../users/abhay/system.nix
    ];

  networking.hostName = "daredevil";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}

