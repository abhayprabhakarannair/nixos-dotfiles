{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.nvf.settings.vim = {
    package = pkgs-unstable.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
