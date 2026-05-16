{ pkgs, ... }: {
  programs.sway.enable = true;  
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
