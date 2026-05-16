{ pkgs, ... }: {

  boot = {
    # 1. Silencing the Kernel logs
    kernelParams = [
      "quiet"           # Tells the kernel to shut up about normal logs
      "splash"          # Enables splash screens
      "boot.shell_on_fail" # Drops to shell if boot fails, so you aren't completely blind if things break
      "loglevel=3"      # Only show errors, hide warnings/info
      "rd.systemd.show_status=false" # Hide systemd service startup messages in initrd
      "rd.udev.log_level=3"          # Hide hardware probe warnings
      "udev.log_priority=3"
    ];

    # 2. Hide console messages during boot sequence stages
    consoleLogLevel = 0;
    initrd.verbose = false;

    # 3. Enable Plymouth Boot Splash
    plymouth = {
      enable = true;
      # Choose a theme. "breeze" comes default, or "spinner" is a clean modern circle loader.
      theme = "spinner"; 
    };
  };


  services.displayManager.ly.settings = {
	  clear_tty = true;
	  animation = "matrix"; # Optional: Ly has a neat built-in fire or matrix animation if you like!
  };

  # Brightness
  hardware.brillo.enable = true;
}
