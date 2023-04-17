local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspc_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspc_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "hls",
    "marksman",
    "pylsp",
    "lua_ls",
    "rust_analyzer",
  }
})

