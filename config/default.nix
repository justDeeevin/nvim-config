{
  # Import all your configuration modules here
  imports = [./remaps.nix ./opts.nix] ++ builtins.map (file: ./. + "/plugins/${file}") (builtins.attrNames (builtins.readDir ./plugins));

  colorschemes.oxocarbon.enable = true;
  highlightOverride = {
    Normal = {bg = "none";};
    NormalFloat = {bg = "none";};
    NormalNC = {bg = "none";};
    LineNr = {bg = "none";};
    SignColumn = {bg = "none";};
  };
}
