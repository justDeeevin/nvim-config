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
}
