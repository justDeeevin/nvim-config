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
  ];
}
