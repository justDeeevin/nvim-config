{
  # Import all your configuration modules here
  imports = [ ./remaps.nix ./opts.nix ] ++ builtins.map (file: ./. + "/plugins/${file}") (builtins.attrNames (builtins.readDir ./plugins));

  colorschemes.cyberdream.enable = true;
  colorschemes.cyberdream.settings.transparent = true;
}