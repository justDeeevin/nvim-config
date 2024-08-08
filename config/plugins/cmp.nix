{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "luasnip"; }
      ];
      # This is the default with noselect removed. This change makes it select the first item automatically.
      completion.completeopt = "menu, menuone";
      mapping = {
        "<CR>" = "require('cmp').mapping.confirm({select = true})";
        "<C-@>" = ''
          function()
            require("cmp").mapping.complete()
          end
        '';
        "<Down>" = ''
          function(fallback)
            if require("cmp").visible() then
              require("cmp").select_next_item()
            else
              fallback()
            end
          end
        '';
        "<Up>" = ''
          function(fallback)
            if require("cmp").visible() then
              require("cmp").select_prev_item()
            else
              fallback()
            end
          end
        '';
        "<C-i>" = ''
          require("cmp").mapping(function()
            local luasnip = require("luasnip")
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, {"i", "s"})
        '';
        "<C-m>" = ''
          require("cmp").mapping(function()
            local luasnip = require("luasnip")
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, {"i", "s"})
        '';
      };
    };
  };
}
