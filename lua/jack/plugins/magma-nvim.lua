local status, magma = pcall(require, "magma-nvim")
if not status then
  return
end

vim.g.magma_image_provider = "none"

magma.setup()
