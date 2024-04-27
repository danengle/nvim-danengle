return {
  "nvimdev/dashboard-nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  event = "VimEnter",

  opts = function()
    local telescope_builtin = require("telescope.builtin")

    local neovim_logo1 = [[
                                                                         
            ████ ██████           █████      ██                    
           ███████████             █████                            
           █████████ ███████████████████ ███   ███████████  
          █████████  ███    █████████████ █████ ██████████████  
         █████████ ██████████ █████████ █████ █████ ████ █████  
       ███████████ ███    ███ █████████ █████ █████ ████ █████ 
      ██████  █████████████████████ ████ █████ █████ ████ ██████
                                                                           
    ]]
    neovim_logo1 = string.rep("\n", 8) .. neovim_logo1 .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(neovim_logo1, "\n"),
        center = {
          {
            action = telescope_builtin.find_files,
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          {
            action = "Telescope frecency workspace=CWD",
            desc = " Frecent Files",
            icon = " ",
            key = "r",
          },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore Session",
            icon = " ",
            key = "s",
          },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
          {
            action = "qa",
            desc = " Quit",
            icon = "󰩈 ",
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,

  config = function(_, opts)
    require("dashboard").setup(opts)
    -- config
    --}
  end,
}
