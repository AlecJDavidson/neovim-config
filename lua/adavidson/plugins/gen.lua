local M = {}

M.setup = function()
  require("gen").setup({
    model = "devstral:24b", -- The default model to use.
    quit_map = "q",         -- set keymap to close the response window
    retry_map = "<c-r>",    -- set keymap to re-send the current prompt
    accept_map = "<c-cr>",  -- set keymap to replace the previous selection with the last result
    host = "10.3.1.13",     -- The host running the Ollama service.
    port = 11434,           -- The port on which the Ollama service is listening.
    display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
    show_prompt = false,    -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
    show_model = false,     -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false,  -- Never closes the window automatically.
    file = false,           -- Write the payload to a temporary file to keep the command short.
    hidden = false,         -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
    -- init = function(options)
    --     pcall(io.popen, "ollama serve > /dev/null 2>&1 &") -- Function to initialize Ollama
    -- end,
    command = function(options)
      local body = { model = options.model, stream = true }
      return string.format(
        "curl --no-buffer -X POST http://%s:%d/api/generate -d '%s'",
        options.host,
        options.port,
        vim.fn.json_encode(body)
      )
    end,
    result_filetype = "markdown", -- Configure filetype of the result buffer
    debug = true,                -- Prints errors and the command which is run.
  })
end

return M
