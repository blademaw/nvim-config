local status, _ = pcall(vim.cmd, "colorscheme kanagawa") -- set colorscheme
-- local status, _ = pcall(vim.cmd, "colorscheme gruvbox") -- set colorscheme
if not status then
  print("Colorscheme not found")
  return
end

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
