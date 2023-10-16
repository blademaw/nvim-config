local status, ultisnips = pcall(require, "ultisnips")
if not status then
  return
end

if vim.g.UltiSnipsJumpForwardTrigger == nil then
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
end

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

ultisnips.setup()
