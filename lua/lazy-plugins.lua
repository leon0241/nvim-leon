-- ╭─────────────────────────────────────────────────────────╮
-- │              Installing Plugins - NO SETUP              │
-- ╰─────────────────────────────────────────────────────────╯

require('lazy').setup({
  -- ╭─────────────────────────────────────────────────────────╮
  -- │                   Pick'n'mix plugins                    │
  -- ╰─────────────────────────────────────────────────────────╯

  {
    'echasnovski/mini.nvim',
    -- Installed Snippets:
    -- mini.comment
    -- mini.cursorword
    -- mini.icons
    -- mini.hipatterns
    -- mini.jump
  },

  -- Pick'n'mix plugins 2
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      lazygit = {enabled = true},
      scope = { enabled = true },
    },
  },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                       Integration                       │
  -- ╰─────────────────────────────────────────────────────────╯

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Vim Tmux integration
  "christoomey/vim-tmux-navigator",

  -- VimTex
  "lervag/vimtex",

  -- Markdown Preview
  {
    -- install without yarn or npm
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Zotero Integration
  {
    "jalvesaq/zotcite",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                         Visual                          │
  -- ╰─────────────────────────────────────────────────────────╯
  --
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',

  "LudoPinelli/comment-box.nvim",
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',

  -- Lualine Status Line
  'nvim-lualine/lualine.nvim',

  -- Dynamic Folding
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' }
  },

  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() vim.cmd.colorscheme 'catppuccin-mocha' end,
  },
  -- ╭─────────────────────────────────────────────────────────╮
  -- │                       Formatting                        │
  -- ╰─────────────────────────────────────────────────────────╯

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },


  -- ╭─────────────────────────────────────────────────────────╮
  -- │                Code and file Navigation                 │
  -- ╰─────────────────────────────────────────────────────────╯

  -- Marks
  "chentoast/marks.nvim",

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-telescope/telescope-bibtex.nvim',
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- ╭─────────────────────────────────────────────────────────╮
  -- │                    LSP Configuration                    │
  -- ╰─────────────────────────────────────────────────────────╯

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- DAP
      {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
      },

      -- Linting
      {
        "mfussenegger/nvim-lint",
        "rshkarin/mason-nvim-lint",
      },

      -- Formatting
      {
        "stevearc/conform.nvim",
        "zapling/mason-conform.nvim",
      },

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- 'folke/lazydev.nvim',
    },
  },
}, {})
