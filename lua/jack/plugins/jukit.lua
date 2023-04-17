local status, jukit = pcall(require, "jukit")
if not status then
  return
end

vim.g.jukit_terminal = 'tmux'
vim.g.jukit_mappings = 0

vim.g.jukit_savefig_dpi = 330
vim.g.jukit_inline_plotting = 1

jukit.setup()
