{ config, pkgs, ... }: {
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

  programs.foot = {
	  enable = true;
	  settings = {
		  main = {
			  term = "xterm-256color";
			  font = "JetBrainsMono Nerd Font:size=11";
			  dpi-aware = "yes";
		  };
		  mouse = {
			  hide-when-typing = "yes";
		  };
		  colors = {
			  alpha = "0.95"; # Easy transparency tweak
		  };
		  scrollback = {
			  lines = 100000;
		  };
	  };
  };


  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -larth";
    };
  };

  home.sessionVariables = {
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
  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/niri";
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-dotfiles/config/waybar";
}
