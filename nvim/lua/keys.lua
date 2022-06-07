-- [[ keys.lua ]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})

-- remap the key used to leace visual mode
map('v', 'jk', '<Esc>', {})

-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle]], {})

-- open terminal horizontal
map('n', 'm', [[:below 10sp term://bash]], {})

-- move between windows
map('n', 'ö', '<C-w>', {})

-- exit terminal insert mode
map('t', 'jk', [[<C-\><C-n>]], {})

-- Toggle Colorizer
map('n', 'ä', [[:ColorizerToggle]], {})

-- add ToDo
map('n', 'ta', [[:ToDoTxtCapture]], {})

-- Toggle ToDo
map('n', 'ts', [[:ToDoTxtTasksToggle]], {})
