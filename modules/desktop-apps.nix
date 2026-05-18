{ pkgs, pkgs-unstable, inputs, ... }: {

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono  
	];

  environment.systemPackages = 
  (with pkgs; [
    vivaldi
    bitwarden-cli
    bitwarden-desktop
    vlc
    kdePackages.kcalc
    kdePackages.plasma-browser-integration
    kdePackages.sddm-kcm
  ])
  ++
  (with pkgs-unstable; [
    neovim
  ]);

}
