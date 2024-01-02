
  return {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    lazy=false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "pysan3/neorg-templates",
        dependencies = {
          "L3MON4D3/LuaSnip"
        },
      },
      { "nvim-neorg/neorg-telescope"},
      { "pritchett/neorg-capture"},
      { "skbolton/neorg-taskwarrior"}
    },
    config = function()
      require("neorg").setup ({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.journal"] = {
            config = {
              strategy = "flat"
            }
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              default_workspace = 'kryses',
              use_popup = true,
              workspaces = {
                kryses = "~/notes/kryses",
              },
            },
          },
          ["external.templates"] = {},
          ["external.capture"] = {
            config = {
              templates = {
                description = "Default Capture",
                name = 'default',
                file = 'refile.norg',
                enabled = function()
                  return true
                end,
                datetree = true,
                headline = "Capture",
                path = {"Save", "refile"},
                query = "(headline1) @neorg-capture-target"
              }
            }
          },
          ["core.integrations.telescope"] = {},
        },
        {
          "andythigpen/nvim-coverage",
          dependencies = "nvim-lua/plenary.nvim",
        }
      })
    end,
  }
