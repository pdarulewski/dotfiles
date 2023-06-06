local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    {
      -- path completion
      name = "path",
      options = {
        trailing_slash = true
      }
    },
    {
      name = 'nvim_lsp',
      -- disable `[LSP] Text` completions
      entry_filter = function(entry, ctx)
        return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
      end
    },
    { name = "crates" }
  },
  completion = {
    completeopt = "menu,menuone,noinsert"
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
  },
})

vim.keymap.set("i", "<C-Space>", function() cmp.complete() end, { expr = true })
vim.keymap.set("i", "<C-u>", function() cmp.scroll_docs(4) end, { expr = true })
vim.keymap.set("i", "<C-d>", function() cmp.scroll_docs(-4) end, { expr = true })

local ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not ok then
  return
end

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
