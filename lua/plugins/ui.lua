return {
  -- Feedback do LSP
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end
  },

  -- Sinais do Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- Tema Tokyo Night
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({ style = "night" })
      vim.cmd.colorscheme("tokyonight")
    end
  },

  -- Indentação colorida
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        scope = { enabled = false }
      })
    end
  },

  -- Barra de status
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { "NvimTree" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "filename", path = 1 },
            { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          },
          lualine_x = {
            { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", info = " ", hint = " " } },
            function() return " LSP" end,
            "encoding",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "nvim-tree" },
      })
    end
  },

  -- NvimTree (Configuração Corrigida)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local function get_project_name()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end

      require("nvim-tree").setup({
        hijack_netrw = true,
        view = {
          width = 35,
          side = "left",
        },
        renderer = {
          group_empty = false,
          root_folder_label = function()
            return " " .. get_project_name()
          end,
          indent_markers = {
            enable = true,
            icons = {
              corner = "└ ",
              edge = "│ ",
              none = "  ",
            }
          },
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "",
                arrow_open = "",
              }
            }
          },
          highlight_git = true,
        },
        update_focused_file = {
          enable = true,
          update_root = true
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          if vim.fn.argc() == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == "directory" then
              require("nvim-tree.api").tree.open({ path = vim.fn.argv(0) })
            end
          end
        end
      })

      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus/Toggle Explorer" })
    end
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "slope",
          show_close_icon = false,
          color_icons = true,
          diagnostics = "nvim_lsp",
          offsets = {
            { 
              filetype = "NvimTree",
              text = " Explorer",
              highlight = "Directory",
              padding = 1,
              text_align = "left"
            }
          },
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
          end
        }
      })
    end
  },
}