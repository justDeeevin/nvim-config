{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources =[
        {name = "nvim_lsp";}
        {name = "path";}
	{name = "luasnip";}
      ];
      # This is the default with noselect removed. This change makes it select the first item automatically.
      completion.completeopt = "menu, menuone";
      mapping = {
        "<CR>" = "cmp.mapping.confirm({select = true})";
	"<C-Space>" = ''
          function()
            cmp.mapping.complete()
          end
	'';
	"<Down>" = ''
	  function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    else
	      fallback()
	    end
	  end
	'';
	"<Up>" = ''
	  function(fallback)
	    if cmp.visible() then
	      cmp.select_next_item()
	    else
	      fallback()
	    end
	  end
	'';
      };
    };
  };
  }
