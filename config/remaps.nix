{
  globals.mapleader = " ";

  keymaps = [
  {
    # Colemak rebinding
      key = "m";
      action = "h";
    }
    {
      key = "n";
      action = "j";
    }
    {
      key = "e";
      action = "k";
    }
    {
      key = "i";
      action = "l";
    }
    {
      key = "k";
      action = "n";
    }
    {
      key = "K";
      action = "N";
    }
    {
      key = "l";
      action = "u";
    }
    {
      key = "u";
      action = "i";
    }
    {
      key = "U";
      action = "I";
      mode = "v";
    }

    # Move selected lines up and down
    {
      key = "E";
      action = ":m '<-2<CR>gv=gv";
      mode = "v";
    }
    {
      key = "N";
      action = ":m '>+1<CR>gv=gv";
      mode = "v";
    }

    {
      key = "en";
      action = "<Esc>";
      mode = "i";
    }
    {
      key = "<leader>e";
      action = "<cmd>Oil<CR>";
      mode = "n";
    }
    {
      key = "<F2>";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      mode = "n";
    }
    {
      key = "<leader>v";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      mode = "n";
    }
  ];
}
