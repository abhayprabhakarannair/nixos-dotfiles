{
  programs.nvf.enable = true;

  imports = [
    ./core.nix
    ./options.nix
    ./lsp.nix
    ./languages.nix
    ./git.nix
    ./fzf.nix
    ./autocomplete.nix
    ./spellcheck.nix
    ./undo.nix
    ./clipboard.nix
    ./mini.nix
  ];
}
