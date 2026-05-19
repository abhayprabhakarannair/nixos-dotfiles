{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
  ];

  home.username = "abhay";
  home.homeDirectory = "/home/abhay";
  home.stateVersion = "25.11";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "abhayprabhakarannair";
        email = "abhayprabhakarannair@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {enable = true;};
    syntaxHighlighting = {enable = true;};
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreAllDups = true;
    };

    shellAliases = {
      ll = "ls -larth";
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/nixos-dotfiles#\$(cat /etc/hostname)";
      nrb = "sudo nixos-rebuild boot --flake /etc/nixos/nixos-dotfiles#\$(cat /etc/hostname)";
    };

    sessionVariables = {
      EDITOR = "nvim";
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
    };
  };

  services.ssh-agent.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${config.home.homeDirectory}/.ssh/github_ed25519";
      };
    };
  };

  # Symlinks config (Better for non nix configs)
  # xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/niri";
  home.file.".config/vivaldi/NativeMessagingHosts/org.kde.plasma.browser_integration.json".source = "${pkgs.kdePackages.plasma-browser-integration}/etc/chromium/native-messaging-hosts/org.kde.plasma.browser_integration.json";
}
