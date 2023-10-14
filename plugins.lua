local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },
  {
    "nvim-neotest/neotest-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      vim.cmd [[ autocmd FileType python lua require('dapui').setup() ]]
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap"
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = {
              justMyCode = false,
              console = "integratedTerminal",
            },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
            is_test_file = function(file_path)
              return file_path:match "test_.*%.py$" ~= nil
            end,
          },
        },
      }
      require("core.utils").load_mappings "neotest"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "bash",
        "python",
        "julia",
        "go",
        "gosum",
        "gomod",
        "gowork",
        "gitignore",
        "dockerfile",
        "yaml",
        "make",
        "markdown_inline",
        "r",
        "rust",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "tsv",
        "php",
        "pem",
        "julia",
        "java",
        "csv",
        "cpp",
        "cmake",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",
        "svelte",

        "c",
        "zig",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "plugins.configs.telescope"
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }

      return conf
    end,
  },
  {
    "Pocco81/TrueZen.nvim",
    cmd = { "TZAtaraxis", "TZMinimalist" },
    config = function()
      require "custom.configs.truezen"
    end,
  },
  { "elkowar/yuck.vim", lazy = false },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        -- python stuff
        "pyright",
        "black",
        "isort",
        "debugpy",
        "flake8",
        --json stuff
        "json-lsp",
        "jsonlint",
        "jq",
        --bash stuff
        "bash-language-server",
        "shellcheck",
        "beautysh",
        --yaml stuff
        "yaml-language-server",
        "yamllint",
        "prettierd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "Vigemus/iron.nvim",
    ft = { "python", "r", "julia" }, -- only load for these filetypes
    config = function()
      local iron = require "iron.core"

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = { "ipython" },
            },
            julia = {
              command = { "julia" },
            },
          },
          repl_open_cmd = require("iron.view").right(0.4),
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      }
      require("core.utils").load_mappings "iron"
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = { "python" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("venv-selector").setup {
        -- Configuration options
        auto_refresh = true,
        search_venv_managers = false,
        search_workspace = true,
        -- Anaconda paths and configurations
        anaconda_base_path = "~/miniconda3",
        anaconda_envs_path = "~/miniconda3/envs",
        anaconda = {
          python_executable = "python",
          python_parent_dir = "bin",
        },
      }
      require("core.utils").load_mappings "venv_selector"
    end,
  },
}

return plugins
