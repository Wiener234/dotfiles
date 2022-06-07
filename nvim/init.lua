--[[ init.lua ]]

local cmd = vim.api.nvim_command

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS: Add this section
require'colorizer'.setup{
DEFAULT_OPTIONS = {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = true;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
  }
}

require('todotxt-nvim').setup({

  todo_file = "/home/nils/Nextcloud/Notizen/ToDo.todo.txt",
  sidebar = {
    width = 40,
    position = "right", -- default: "right"
  },
  capture = {
    prompt = "> ",
    -- Percentage is percentage of width of the whole editor
    -- Integer is number of columns
    width = "75%",
    position = "50%",
    -- Styled after https://swiftodoapp.com/todotxt-syntax/priority/
    -- With this, if you include any of the below keywords it will
    -- automatically use the associated priority and remove that
    -- keyword from the final task.
    alternative_priority = {
      A = "now",
      B = "next",
      C = "today",
      D = "this week",
      E = "next week",
    },
  },
  -- Highlights used in both capture prompt and tasks sidebar
  -- Each highlight type can be a table with 'fg', 'bg' and 'style'
  -- options or a string referencing an existing highlight group.
  -- highlights = {
  --   project = "Identifier",
  -- }
  highlights = {
    project = {
      fg = "magenta",
      bg = "NONE",
      style = "NONE",
    },
    context = {
      fg = "cyan",
      bg = "NONE",
      style = "NONE",
    },
    date = {
      fg = "NONE",
      bg = "NONE",
      style = "underline",
    },
    done_task = {
      fg = "gray",
      bg = "NONE",
      style = "NONE",
    },
    priorities = {
      A = {
        fg = "red",
        bg = "NONE",
        style = "bold",
      },
      B = {
        fg = "magenta",
        bg = "NONE",
        style = "bold",
      },
      C = {
        fg = "yellow",
        bg = "NONE",
        style = "bold",
      },
      D = {
        fg = "cyan",
        bg = "NONE",
        style = "bold",
      },
    },
  },
  -- Keymap used in sidebar split
  keymap = {
    quit = "q",
    toggle_metadata = "m",
    delete_task = "dd",
    complete_task = "<space>",
    edit_task = "ee",
  },

})

-- empty setup using defaults: add your own options
require'nvim-tree'.setup {
}

-- OR

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
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
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS

-- The setup config table shows all available config options with their default values:
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
