log "Installing OpenAI Codex CLI"
install_node
npm install -g @openai/codex
as_user_sh 'codex --version'
if [ -n "${OPT_OPENAI_API_KEY:-}" ]; then
  persist_env OPENAI_API_KEY "$OPT_OPENAI_API_KEY"
  printf '%s' "$OPT_OPENAI_API_KEY" | as_user codex login --with-api-key >/dev/null 2>&1 || true
fi
