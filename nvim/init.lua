vim.o.number = true
vim.o.wrap = true

vim.o.autoindent = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.o.swapfile = false
vim.g.mapleader = " "

vim.o.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>u', ':undo<CR>')

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y<CR>')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p<CR>')

vim.pack.add({
    {src = "https://github.com/shaunsingh/nord.nvim"},
    {src = "https://github.com/stevearc/oil.nvim"},
    {src = "https://github.com/echasnovski/mini.pick"},
--    {src = "https://github.com/neovim/nvim-lspconfig"},
--    {src = "https://github.com/neoclide/coc.nvim"}
--    {src = "https://github.com/chomosuke/typst-preview.nvim"}
})

vim.cmd [[
    call plug#begin()

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'https://github.com/preservim/nerdtree'

    call plug#end()

]]

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.enable(true, client.id, ev.buf, {atuotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")


require "mini.pick".setup()

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
-- vim.lsp.enable({ "lua_ls" })
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.cmd("colorscheme nord")

vim.keymap.set('i', '(', '()<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '"', '""<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.keymap.set('i', "'", "''<Left>", { noremap = true, silent = true })


