
local function check_network()
  -- Ping a reliable server (e.g., Google DNS) and check the return code
  local exit_code = os.execute("ping -c 1 8.8.8.8 > /dev/null 2>&1")
  return exit_code == 0
end

-- Check network connectivity
if not check_network() then
  print("Error: Network is not available. Please check your connection.")
  return
end

-- Define the path to the lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check if the plugin is already installed
if not vim.loop.fs_stat(lazypath) then
  -- Clone the repository if it's not installed
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- Prepend the plugin path to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Check if Lazy Plugin has been installed
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("Error: lazy.nvim plugin not found!")
  return
end

-- Run Plugins
local opts = {}
require("vim-options")
require("lazy").setup("plugins")



