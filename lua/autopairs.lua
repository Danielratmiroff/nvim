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
