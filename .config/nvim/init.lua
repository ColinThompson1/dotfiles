-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python3"

local function should_skip(line)
  local l = line:lower()
  if l:match("^%s*syntax%s+enable") then
    return true
  end
  if l:match("^%s*filetype%s+plugin") or l:match("^%s*filetype%s+indent") then
    return true
  end
  return false
end

local function source_vimrc_before_plugins()
  local vimrc = vim.fn.expand("~/.vimrc")
  local tmpfile = vim.fn.tempname()

  local lines = {}
  for line in io.lines(vimrc) do
    if line:match("=>%s*Plugins") then
      break
    end

    if not should_skip(line) then
      table.insert(lines, line)
    end
  end

  local f = io.open(tmpfile, "w")
  f:write(table.concat(lines, "\n"))
  f:close()

  vim.cmd("source " .. vim.fn.fnameescape(tmpfile))
end

source_vimrc_before_plugins()

vim.opt.expandtab = true      
vim.opt.tabstop = 2          
vim.opt.shiftwidth = 2      
vim.opt.softtabstop = 2    
