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
    ["<leader>a"] = { desc=" Chat GPT"},
    ["<leader>ap"] = { "<cmd>ChatGPT<cr>", desc="Chat GPT Prompt"},
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc="Complete Code"},
    ["<leader>aa"] = { "<cmd>ChatGPTActAs<cr>", desc="Chat GPT Act As"},
    ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>", desc="Explain Code"},
    ["<leader>as"] = { "<cmd>ChatGPTRun summarize_code<cr>", desc="Summarize Code"},
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc="Fix Bugs"},
    ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<cr>", desc="Optimize Code"},
    ["<leader>ar"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", desc="Code Readability Analysis"},
    ["<leader>at"] = { "<cmd>ChatGPTRun add_tests<cr>", desc="Add Tests"},
    ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<cr>", desc="Add Docstring"},
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
    ["<leader>fp"] = { "<cmd> lua require('telescope').extensions.projects.projects() <cr>", desc='Find Projects'},
    ["<leader>pl"] = { "<cmd> lua require('nvim-dap-projects').search_project_config() <cr>", desc='Load Project'},

    -- Chat GPT
    ["<leader>a"] = { desc="󰭹 Chat GPT"},
    ["<leader>ap"] = { "<cmd>ChatGPT<cr>", desc="Chat GPT Prompt"},
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc="Complete Code"},
    ["<leader>aa"] = { "<cmd>ChatGPTActAs<cr>", desc="Chat GPT Act As"},
    ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>", desc="Explain Code"},
    ["<leader>as"] = { "<cmd>ChatGPTRun summarize_code<cr>", desc="Summarize Code"},
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc="Fix Bugs"},
    ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<cr>", desc="Optimize Code"},
    ["<leader>ar"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", desc="Code Readability Analysis"},
    ["<leader>at"] = { "<cmd>ChatGPTRun add_tests<cr>", desc="Add Tests"},
    ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<cr>", desc="Add Docstring"},


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
