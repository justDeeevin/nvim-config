{
  plugins.lsp = {
    enable = true;
    servers = {
      tsserver.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
    };
  };

  keymaps = [
    {
      key = "gh";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    }
    {
      key = "<leader>th";
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))<CR>";
    }
  ];

  autoGroups = {
    lsp-highlight = {
      clear = false;
    };
    lsp-detach = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = [ "CursorHold" "CursorHoldI" ];
      group = "lsp-highlight";
      callback = {
        __raw = "vim.lsp.buf.document_highlight";
      };
    }
    {
      event = [ "CursorMoved" "CursorMovedI" ];
      group = "lsp-highlight";
      callback = {
        __raw = "vim.lsp.buf.clear_references";
      };
    }
    {
      event = "LspDetach";
      group = "lsp-detach";
      callback = {
        __raw = ''
          function(event)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({group = "lsp-highlight"})
          end
        '';
      };
    }
  ];
}