{ pkgs, ... }: {
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.openssh.enable = true;

  # Allow any unfree package across the entire fleet
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    vim wget git tree pfetch
  ];
}
