require("lazy-lsp").setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  -- Alternatively specify preferred servers for a filetype (others will be ignored).
  preferred_servers = {
    markdown = {},
    python = { "pyright", "ruff_lsp" },
  },
  prefer_local = true, -- Prefer locally installed servers over nix-shell
  -- Default config passed to all servers to specify on_attach callback and other options.
  default_config = {
    flags = {
      debounce_text_changes = 150,
    },
    -- on_attach = on_attach,
    -- capabilities = capabilities,
  },
}
