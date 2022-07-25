require('nvim-rooter').setup {
  rooter_patterns = { '.git', '=src', 'main.go' },
  trigger_patterns = { '*' },
  manual = true,
}
