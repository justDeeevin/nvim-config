{
  plugins.oil = {
    enable = true;
    settings.view_options.show_hidden = true;
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>Oil<CR>";
      mode = "n";
    }
  ];
}
