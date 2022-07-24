local comment = require "Comment"

comment.setup({
  ---LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    line = 'gcc', ---Line-comment toggle keymap
    block = 'gbc', ---Block-comment toggle keymap
  },

  ---LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line = 'gc', ---Line-comment keymap
    block = 'gb', ---Block-comment keymap
  },
})
