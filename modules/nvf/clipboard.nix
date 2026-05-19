{
  programs.nvf.settings.vim = {
    clipboard.providers.wl-copy.enable = true;

    maps.normal = {
      # Disable arrow keys
      "<left>" = {action = "<cmd>echo \"Use h to move!!\"<CR>";};
      "<right>" = {action = "<cmd>echo \"Use l to move!!\"<CR>";};
      "<up>" = {action = "<cmd>echo \"Use k to move!!\"<CR>";};
      "<down>" = {action = "<cmd>echo \"Use j to move!!\"<CR>";};

      # Only leader keys touch the system clipboard (+)
      "<leader>y" = {
        action = "\"+y";
        desc = "Yank to Wayland clipboard";
      };
      "<leader>p" = {
        action = "\"+p";
        desc = "Paste from Wayland clipboard";
      };
    };

    maps.visual = {
      # Disable arrow keys
      "<left>" = {action = "<cmd>echo \"Use h to move!!\"<CR>";};
      "<right>" = {action = "<cmd>echo \"Use l to move!!\"<CR>";};
      "<up>" = {action = "<cmd>echo \"Use k to move!!\"<CR>";};
      "<down>" = {action = "<cmd>echo \"Use j to move!!\"<CR>";};

      # Visual mode clipboard mappings
      "<leader>y" = {
        action = "\"+y";
        desc = "Yank selection to Wayland clipboard";
      };
      "<leader>p" = {
        action = "\"+p";
        desc = "Paste selection from Wayland clipboard";
      };

      # Quick text movements up & down
      "J" = {
        action = ":m '>+1<CR>gv=gv";
        desc = "Move selection down";
      };
      "K" = {
        action = ":m '<-2<CR>gv=gv";
        desc = "Move selection up";
      };
    };
  };
}
