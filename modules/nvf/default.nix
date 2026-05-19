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

        # Languages
        nix.enable = true;
        bash.enable = true;
        csharp.enable = true;
        typescript.enable = true;
        docker.enable = true;
        css.enable = true;
        scss.enable = true;
        json.enable = true;
        sql.enable = true;
        lua.enable = true;
        markdown.enable = true;
        env.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      spellcheck = {
        enable = true;
      };

      autocomplete = {
        nvim-cmp.enable = true;
      };
    };
  };
}
