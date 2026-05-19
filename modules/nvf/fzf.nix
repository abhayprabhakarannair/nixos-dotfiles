{
  programs.nvf.settings.vim.fzf-lua.enable = true;

  programs.nvf.settings.vim.maps.normal = {
    "<leader>sh" = {
      action = "<cmd>FzfLua helptags<cr>";
      desc = "[S]earch [H]elp";
    };
    "<leader>sk" = {
      action = "<cmd>FzfLua keymaps<cr>";
      desc = "[S]earch [K]eymaps";
    };
    "<leader>sf" = {
      action = "<cmd>FzfLua files<cr>";
      desc = "[S]earch [F]iles";
    };
    "<leader>ss" = {
      action = "<cmd>FzfLua<cr>";
      desc = "[S]earch [S]elect FZF Lua";
    };
    "<leader>sw" = {
      action = "<cmd>FzfLua grep<cr>";
      desc = "[S]earch current [W]ord";
    };
    "<leader>sg" = {
      action = "<cmd>FzfLua live_grep<cr>";
      desc = "[S]earch by [G]rep";
    };
    "<leader>sd" = {
      action = "<cmd>FzfLua diagnostics_document<cr>";
      desc = "[S]earch [D]iagnostics";
    };
    "<leader>s." = {
      action = "<cmd>FzfLua oldfiles<cr>";
      desc = "[S]earch Recent Files (\".\" for repeat)";
    };
    "<leader>sr" = {
      action = "<cmd>FzfLua resume<cr>";
      desc = "[S]earch [R]esume";
    };
    "<leader><leader>" = {
      action = "<cmd>FzfLua buffers<cr>";
      desc = "[ ] Find existing buffers";
    };
    "<leader>/" = {
      action = "<cmd>FzfLua lgrep_curbuf<cr>";
      desc = "[/] Fuzzily search in current buffer";
    };

    "<leader>sc" = {
      action = ''
        function()
          require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      lua = true;
      desc = "[S]earch files in [C]urrent directory";
    };
  };
}
