{ config, pkgs, lib, ... }:

let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "custom-wallpaper";
    src = ../assets/wallpaper.jpg;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out
      cp $src $out/background.jpg
    '';
  };
in
{
  boot = {
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    consoleLogLevel = 0;
    initrd.verbose = false;

    plymouth = {
      enable = true;
      theme = "spinner"; 
    };
  };

  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    theme = "breeze";
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background = "${background-package}/background.jpg"
    '')
  ];

  services.desktopManager.plasma6.enable = true;
  services.fwupd.enable = true;
  hardware.enableAllFirmware = true;
}
