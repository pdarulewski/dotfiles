local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    {
      name = "path",
      options = {
        trailing_slash = true
      }
    },
    { name = 'nvim_lsp' },
  },
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    ["<S-Space>"] = cmp.mapping.complete(),

    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

vim.keymap.set("i", "<C-Space>", function() cmp.complete() end, { expr = true })
vim.keymap.set("i", "<C-u>", function() cmp.scroll_docs(4) end, { expr = true })
vim.keymap.set("i", "<C-d>", function() cmp.scroll_docs(-4) end, { expr = true })
