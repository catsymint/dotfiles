-- Plugins
vim.pack.add({
    'https://github.com/akinsho/bufferline.nvim.git',
    'https://github.com/folke/noice.nvim.git',
    'https://github.com/folke/snacks.nvim.git',
    'https://github.com/folke/trouble.nvim.git',
    'https://github.com/ibhagwan/fzf-lua.git',
    'https://github.com/lukas-reineke/indent-blankline.nvim.git',
    'https://github.com/MunifTanjim/nui.nvim.git',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-lua/plenary.nvim.git',
    'https://github.com/nvim-lualine/lualine.nvim.git',
    'https://github.com/nvim-neo-tree/neo-tree.nvim.git',
    'https://github.com/nvim-tree/nvim-web-devicons.git',
    'https://github.com/nvim-treesitter/nvim-treesitter.git',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git',
    'https://github.com/rcarriga/nvim-notify.git',
    { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
    { src = 'https://github.com/saghen/blink.cmp.git', version = 'v1.8.0' },
})
require('blink.cmp').setup()
require('bufferline').setup()
require('fzf-lua').setup()
require('ibl').setup({
    scope = { show_end = false, show_start = false },
})
require('lualine').setup({ options = { globalstatus = true }})
require('neo-tree').setup({
    window = {
        width = 30,
    },
})
require('noice').setup({
    lsp = {
    override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
})
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash', 'c', 'caddy', 'cmake', 'cpp', 'css', 'csv', 'diff',
        'dockerfile', 'fish', 'git_config', 'git_rebase', 'gitattributes',
        'gitcommit', 'gitignore', 'go', 'gpg', 'html', 'ini', 'javascript',
        'json', 'lua', 'make', 'markdown', 'markdown_inline', 'nim',
        'printf', 'python', 'query', 'regex', 'requirements', 'ruby', 'rust',
        'toml', 'typescript', 'vim', 'vimdoc', 'xml', 'zig',
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
            },
            selection_modes = {
                ['@class.outer'] = '<c-v>', -- blockwise
                ['@function.outer'] = 'V', -- linewise
            },
        },
        swap = {
            enable = true,
            swap_next = {
                [')c'] = '@class.outer',
                [')f'] = '@function.outer',
                [')b'] = '@block.outer',
            },
            swap_previous = {
                ['(c'] = '@class.outer',
                ['(f'] = '@function.outer',
                ['(b'] = '@block.outer',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']c'] = '@class.outer',
                [']f'] = '@function.outer',
                [']b'] = '@block.outer',
            },
            goto_next_end = {
                [']C'] = '@class.outer',
                [']F'] = '@function.outer',
                [']B'] = '@block.outer',
            },
            goto_previous_start = {
                ['[C'] = '@class.outer',
                ['[f'] = '@function.outer',
                ['[b'] = '@block.outer',
            },
            goto_previous_end = {
                ['[C'] = '@class.outer',
                ['[F'] = '@function.outer',
                ['[B'] = '@block.outer',
            },
        },
    },
})
require('snacks').setup({
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
})
require('trouble').setup()

-- LSP (TODO: enable more servers)
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

-- Theme
vim.cmd.colorscheme('catppuccin')

-- Diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌵',
        },
    },
})

-- General
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.scrolloff = 4
vim.o.sidescrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.showmatch = true
vim.o.smoothscroll = true
vim.o.title = true
vim.opt.virtualedit:append('block')

-- List/whitespace
vim.opt.list = true
vim.opt.listchars = {
    extends = "…",
    nbsp = "␣",
    precedes = "…",
    tab = "⇥ ",
    trail = "·",
}
vim.opt.showbreak = "↳"

-- Formatting
vim.opt.formatoptions:remove('o')
vim.opt.formatoptions:remove('t')
vim.opt.formatoptions:append('jn1')
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Backups
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath('state') .. '/backup//'
vim.o.swapfile = false
vim.o.undofile = true

-- Mappings
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
vim.keymap.set({'n', 'v', 'o'}, '<Leader>y', '"+y')
vim.keymap.set({'n', 'v', 'o'}, '<Leader>p', '"+p')
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('n', '<Leader>q', '<Cmd>q<CR>')
vim.keymap.set('n', '<Leader>w', '<Cmd>bd<CR>')
vim.keymap.set('n', '<Leader>t', '<Cmd>Neotree reveal toggle<CR>')
vim.keymap.set('n', '<Leader>f', FzfLua.files)
vim.keymap.set('n', '<Leader>x', '<Cmd>Trouble diagnostics toggle<CR>')
vim.keymap.set('n', '<Leader>s', '<C-w>s')
vim.keymap.set('n', '<Leader>v', '<C-w>v')
vim.keymap.set('n', '<Leader>1', '<C-w>o')
vim.keymap.set('n', '<Leader><Space>', '<Cmd>noh<CR>')
vim.keymap.set('n', '<Leader><Tab>', '<Cmd>bn<CR>')
vim.keymap.set('n', '<Leader><S-Tab>', '<Cmd>bp<CR>')
vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<Leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
