{pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    formattersByFt = {
      lua = [ "stylua" ];
      python = [ "black" ];
      javascript = [ "prettierd" ];
      javascriptreact = [ "prettierd" ];
      typescript = [ "prettierd" ];
      typescriptreact = [ "prettierd" ];
      json = [ "prettierd" ];
      html = [ "prettierd" ];
      css = [ "prettierd" ];
      markdown = [ "prettierd" ];
      yaml = [ "yamlfmt" ];
      toml = [ "taplo" ];
      svelte = [ "prettierd" ];
      nix = [ "nixpkgs_fmt" ];
      scss = [ "prettierd" ];
      sh = [ "beautysh" ];
      tex = [ "latexindent" ];
      rust = [ "rustfmt" ];
    };
    formatOnSave = {};
  };

  extraPackages = with pkgs; [
    stylua
    black
    prettierd
    yamlfmt
    taplo
    nixpkgs-fmt
    beautysh
    texlivePackages.latexindent
  ];
}
