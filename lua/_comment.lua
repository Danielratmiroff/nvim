local comment = require "Comment"

comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = '<Leader>c',
    ---Block-comment toggle keymap
    --block = 'hey',
  },
  opleader = {
    ---Line-comment keymap
    --line = 'gc',
    ---Block-comment keymap
    block = '<Leader>cb',
  },
})
