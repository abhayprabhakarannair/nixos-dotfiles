{ pkgs, inputs, ... }: {

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono  
	];

  environment.systemPackages = with pkgs; [
    neovim
    vivaldi
    bitwarden-cli
    bitwarden-desktop
    vlc
    kdePackages.kcalc
  ];
}
