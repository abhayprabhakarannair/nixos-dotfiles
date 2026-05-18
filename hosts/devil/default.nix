{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/common.nix
      ../../modules/desktop.nix
      ../../modules/desktop-apps.nix
      ../../modules/virtualisation.nix
      ../../modules/gaming.nix
      ../../users/abhay/system.nix
    ];

  networking.hostName = "devil";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.systemd.enable = true;

  boot.initrd.availableKernelModules = [ "tpm_tis" ];
  boot.kernelParams = [ "amd_pstate=active" "edac_report=decode" ];
 
  boot.initrd.luks.devices."enc".crypttabExtraOpts = [ "tpm2-device=auto" ];
  boot.kernelPackages = pkgs.linuxPackages_zen;


  swapDevices = [ { device = "/swap/swapfile"; } ];

  services.btrfs.autoScrub = {
   enable = true;
   interval = "weekly"; 
};

  system.stateVersion = "25.11";
}

