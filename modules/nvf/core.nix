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
      netrw_browse_split = 0;
      netrw_banner = 0;
      netrw_winsize = 25;
    };

    extraPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
