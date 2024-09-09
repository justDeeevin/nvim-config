{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    actions-preview-nvim
  ];

  autoCmd = [
    {
      # On startup, silently etup supermaven
      event = "VimEnter";
      command = "lua require('actions-preview').setup({})";
      once = true;
    }
  ];
}
