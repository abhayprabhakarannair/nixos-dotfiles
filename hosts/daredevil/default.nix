{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/desktop.nix
      ../../modules/desktop-apps.nix
      ../../modules/virtualisation.nix
      ../../users/abhay/system.nix
    ];

  networking.hostName = "daredevil";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.fprintd = {
  	enable = true;
  };

  system.stateVersion = "25.11";
}

