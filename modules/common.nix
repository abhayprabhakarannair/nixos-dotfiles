{ pkgs, ... }: {
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  
  services.openssh.enable = true;

  # Allow any unfree package across the entire fleet
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    vim wget git tree pfetch
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # 3. Centralized log constraints
  services.journald.extraConfig = ''
    SystemMaxUse=1G
    SystemMaxFileSize=200M
  '';


  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;
}
