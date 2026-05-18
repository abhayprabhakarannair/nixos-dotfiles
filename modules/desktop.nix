{ pkgs, ... }: {

  boot = {
    kernelParams = [
      "quiet"           # Tells the kernel to shut up about normal logs
      "splash"          # Enables splash screens
      "boot.shell_on_fail" # Drops to shell if boot fails, so you aren't completely blind if things break
      "loglevel=3"      # Only show errors, hide warnings/info
      "rd.systemd.show_status=false" # Hide systemd service startup messages in initrd
      "rd.udev.log_level=3"          # Hide hardware probe warnings
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
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  services.fwupd.enable = true;

  hardware.enableAllFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
}
