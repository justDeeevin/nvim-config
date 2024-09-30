{inputs, ...}: {
  extraPlugins = [inputs.codeshot-nvim.packages.x86_64-linux.default];
  extraPackages = [inputs.sss.packages.x86_64-linux.code];

  autoCmd = [
    {
      # On startup, setup codeshot
      event = "VimEnter";
      command = "lua require('codeshot').setup({copy = '%c | wl-copy'})";
      once = true;
    }
  ];
}
