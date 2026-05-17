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
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.systemd.enable = true;

  boot.initrd.availableKernelModules = [ "tpm_tis" ];
  boot.kernelParams = [ "amd_pstate=active" ];
 
  boot.initrd.luks.devices."enc".crypttabExtraOpts = [ "tpm2-device=auto" ];

  swapDevices = [ { device = "/swap/swapfile"; } ];

  services.btrfs.autoScrub = {
   enable = true;
   interval = "weekly"; 
};

  services.fprintd = {
  	enable = true;
  };

  system.stateVersion = "25.11";
}

