{
  programs.nvf.settings.vim.lsp = {
    enable = true;
    formatOnSave = true;
  };

  programs.nvf.settings.vim.keymaps = [
    {
      key = "<leader>cd";
      mode = "n";
      action = ":lua vim.diagnostic.open_float()<CR>";
      silent = true;
      desc = "[C]ode [D]iagnostic floating message";
    }
  ];
}
