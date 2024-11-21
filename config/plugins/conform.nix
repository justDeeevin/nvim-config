{pkgs, ...}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        lua = ["stylua"];
        python = ["black"];
        javascript = ["prettierd"];
        javascriptreact = ["prettierd"];
        typescript = ["prettierd"];
        typescriptreact = ["prettierd"];
        json = ["prettierd"];
        html = ["prettierd"];
        css = ["prettierd"];
        markdown = ["prettierd"];
        yaml = ["yamlfmt"];
        toml = ["taplo"];
        svelte = ["prettierd"];
        nix = ["alejandra"];
        scss = ["prettierd"];
        sh = ["beautysh"];
        tex = ["latexindent"];
        rust = ["rustfmt"];
        java = {
          lsp_format = "never";
        };
      };
      format_on_save = {
        lsp_format = "fallback";
      };
    };
  };

  extraPackages = with pkgs; [
    stylua
    black
    prettierd
    yamlfmt
    taplo
    alejandra
    beautysh
    texlivePackages.latexindent
  ];
}
