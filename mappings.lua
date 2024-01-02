-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local buffer = require("astronvim.utils.buffer")

return {
  -- first key is the mode
  v = {
    ["J"] = {":m '>+1<CR>gv=gv"},
    ["K"] = {":m '<-2<CR>gv=gv"},
    ['<leader>d'] = {'"_d', desc='Clear clipboard'},
    ['<leader>y'] = {'"+y', desc = 'Copy to clipboard'},
    ['<leader>Y'] = {'"+Y', desc = 'Copy to clipboard'},
  },
  i = {
    ['<C-c>'] = {'<Esc>'},
    ["<C-y>"] = {  'copilot#Accept("<CR>")' ,
          expr = true,
          replace_keycodes = false
    },
  },
  n = {
    -- second key is the lefthand side of the map
    ["<S-h>"] = {function ()
      buffer.nav(-(vim.v.count > 0 and vim.v.count or 1))
    end,
      desc = "Previous buffer",
    },
    ["<S-l"] = {
      function()
        buffer.nav(vim.v.count > 0 and vim.v.count or 1)
      end,
      desc = "Next buffer",
    },
    ["J"] = {"mzJ`z"},
    ["<C-d>"] = {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"},
    ["n"] = {"nzzzv"},
    ['<leader>p'] ={ "\"_dP", desc = 'Paste from clipboard' },
    ['<leader>y'] = {'"+y', desc = 'Copy to clipboard'},
    ["N"] = {"Nzzzv"},
    ['<leader>Y'] = {'"+Y', desc = 'Copy to clipboard'},
    ['<leader>d'] = {'"_d'},
    ['Q'] = {'<nop>'},
    -- ['<C-k>'] = {'<cmd>cnext<cr>zz'},
    -- ['<C-j>'] = {'<cmd>cprev<cr>zz'},
    ['<leader>k'] = { '<cmd>lnext<cr>zz' , desc = 'Next Location List'},
    ['<leader>j'] = { '<cmd>lprev<cr>zz', desc = 'Previous Location List' },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = 'Substitute Current'},
    ["<leader>x"] = { "<cmd>!chmod +x %<CR>", desc = "Make Executible" },
    ["<leader>fp"] = { "<cmd> lua require('telescope').extensions.projects.projects() <cr>", desc='Find Projects'},

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
