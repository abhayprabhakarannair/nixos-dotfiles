{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      package = pkgs-unstable.neovim-unwrapped;
      viAlias = true;
      vimAlias = true;

      globals = {
        mapleader = " ";
      };

      options = {
        number = true;
        relativenumber = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
      };
    };
  };
}
