{ pkgs, pkgs-unstable, ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim.package = pkgs-unstable.neovim-unwrapped;
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.leaderKey = " ";
      
      vim.options = {
        number = true;
        relativenumber = true;
      };


      vim.lsp = {
        enable = true;
      };
    };
  };
}
