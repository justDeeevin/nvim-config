{
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "Third Brain";
          path = "~/Documents/Third Brain";
        }
      ];
      daily_notes = {
        folder = "Daily";
        template = "Templates/Daily Note Template.md";
        date_format = "%B %-d, %Y";
      };
      templates.subdir = "Templates";
      disable_frontmatter = true;
    };
  };
}
