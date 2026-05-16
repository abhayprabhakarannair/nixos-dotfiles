{ pkgs, inputs, ... }: {

	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono  
	];

  # Standard user GUI tools
  environment.systemPackages = with pkgs; [
    foot
    neovim
    vivaldi
    fuzzel
    swaylock
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    waybar
    brightnessctl
    bitwarden-cli
  ];
}
