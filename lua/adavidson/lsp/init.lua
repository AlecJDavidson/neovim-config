local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "adavidson.lsp.mason"
require("adavidson.lsp.handlers").setup()
require "adavidson.lsp.null-ls"
