{ pkgs, ... }: {
  programs.niri.enable = true;
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
