local status_ok, nvim-autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return "Something failed with Autopairs"
end

local npairs = require('nvim-autopairs')

npairs.setup({fast_wrap = {
     disable_filetype = { "TelescopePrompt", "spectre_panel" },
    map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
}})
