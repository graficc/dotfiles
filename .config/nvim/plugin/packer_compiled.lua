-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/limbo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/limbo/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/limbo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/limbo/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/limbo/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  edge = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["fcitx.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/opt/fcitx.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  vimcdoc = {
    loaded = true,
    path = "/home/limbo/.local/share/nvim/site/pack/packer/start/vimcdoc"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'fcitx.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
