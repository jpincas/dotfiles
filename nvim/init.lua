-- BASICS

-- Options
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.shell = "zsh"
vim.opt.compatible = false
vim.opt.swapfile = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true
vim.opt.path:append("**")
vim.opt.completeopt:remove("preview")
vim.g.mapleader = " "

-- Disable numbers in terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})

vim.cmd("filetype plugin on")

-- KEYBINDINGS
--
-- Insert blank lines
vim.api.nvim_create_autocmd("CmdwinEnter", {
    callback = function()
        vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
    end
})

vim.keymap.set("n", "<up>", "<c-w>k")
vim.keymap.set("n", "<down>", "<c-w>j")
vim.keymap.set("n", "<left>", "<c-w>h")
vim.keymap.set("n", "<right>", "<c-w>l")
vim.keymap.set("i", "<up>", "<Esc><c-w>k")
vim.keymap.set("i", "<down>", "<Esc><c-w>j")
vim.keymap.set("i", "<left>", "<Esc><c-w>h")
vim.keymap.set("i", "<right>", "<Esc><c-w>l")
vim.keymap.set("n", "<tab>", "<c-^>")
vim.keymap.set("n", "<c-s>", ":w<CR>")
vim.keymap.set("i", "<c-s>", "<Esc>:w<CR>")
vim.keymap.set("v", "<c-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<CR>", "o<Esc>")
vim.keymap.set("n", "<S-CR>", "O<Esc>")
vim.keymap.set("n", "_", "cw_<Esc>")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>y", "yyp")
vim.keymap.set("n", "<leader>d", ":bnext | if bufnr('#') != -1 | bdelete # | else | enew | endif<CR>")
vim.keymap.set("n", "<leader>t", ":vsplit term://zsh<CR> :vertical resize 40<CR>i")
vim.keymap.set("n", "<leader>z", ":vertical resize 40<CR>")
vim.keymap.set("n", "<leader>r", ":so $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>s", ":Scratch<CR>")
vim.keymap.set("n", "<leader>bj", "i`json:\"\" bson:\"\"`<Esc>4F\"a")
vim.keymap.set("n", "<leader>f", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NERDTreeRefreshRoot<CR>")
vim.keymap.set("n", "<leader>0", "\"0p")
vim.keymap.set("i", "<c-z>z", "<Esc>zzi")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Tab navigation with numbers
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, i .. "gt")
end

-- PLUGIN MANAGER (using `vim-plug` in Lua)
vim.cmd [[
call plug#begin('~/local/share/nvim/plugged')
    Plug 'itchyny/lightline.vim'
    Plug 'vim-scripts/Toggle'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'numToStr/Comment.nvim'
    Plug 'tpope/vim-surround'
    Plug 'elmcast/elm-vim'
    Plug 'bkad/CamelCaseMotion'
    Plug 'gcmt/taboo.vim'
    Plug 'preservim/nerdtree'
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'github/copilot.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'dense-analysis/ale'
call plug#end()
]]
--
-- PLUGIN SETTINGS
-- Ale
vim.g.ale_fix_on_save = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_set_quickfix = 1

vim.g.ale_fixers = {
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    python = { "yapf" },
    json = { "prettier" },
    sql = { "sqlfluff" },
    go = { "goimports" },
    typescript = { "deno" },
    typescriptreact = { "deno" }
}

vim.g.ale_linters = {
    go = { "gopls" },
    sql = { "sqlfluff" },
    typescript = { "deno" },
    typescriptreact = { "deno" }
}

-- ALE Keybindings
-- Go to next error: Ctrl+]
-- Go to previous error: Ctrl+[
-- Go to definition: gd
-- Hover: K
vim.keymap.set("n", "<c-]>", ":ALENext<CR>")
vim.keymap.set("n", "<c-[>", ":ALEPrevious<CR>")
vim.keymap.set("n", "gd", ":ALEGoToDefinition<CR>")
vim.keymap.set("n", "K", ":ALEHover<CR>")

-- Colourscheme
vim.cmd("colorscheme nightfly")
vim.g.lightline = { colorscheme = "nightfly" }

-- Comment.nvim setup
require("Comment").setup()

-- Taboo
vim.g.taboo_tab_format = " %N:%f%m "
vim.g.taboo_renamed_tab_format = " [%N:%l]%m "

-- CamelCaseMotion
vim.g.camelcasemotion_key = "<leader>"

-- NERDTree
vim.g.NERDTreeWinSize = 26

-- Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "lua", "markdown", "json", "go", "css" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


