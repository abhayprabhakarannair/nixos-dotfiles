{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    ../../modules/common.nix
    ../../modules/desktop
    ../../modules/desktop/apps.nix
    ../../modules/virtualisation.nix
    ../../modules/nvf
    ../../users/abhay/system.nix
  ];

  networking.hostName = "daredevil";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.systemd.enable = true;

  boot.initrd.availableKernelModules = ["tpm_tis"];
  boot.kernelParams = ["amd_pstate=active"];

  boot.initrd.luks.devices."enc".crypttabExtraOpts = ["tpm2-device=auto"];
  boot.kernelPackages = pkgs.linuxPackages_zen;

  swapDevices = [{device = "/swap/swapfile";}];

  services.libinput.enable = true;

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  # Enable finger print system wide, but disable for SDDM (its buggy)
  services.fprintd.enable = true;
  security.pam.services.login.fprintAuth = false;
  security.pam.services.kde.fprintAuth = pkgs.lib.mkForce true;

  system.stateVersion = "25.11";
}
