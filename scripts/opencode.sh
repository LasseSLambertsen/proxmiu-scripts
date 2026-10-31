log "Installing OpenCode"
install_node
apt_install ripgrep
# pipefail: a failed download would otherwise look like success (bash happily runs an empty script).
if ! as_user_sh 'set -o pipefail; curl -fsSL https://opencode.ai/install | bash'; then
  log "Native installer failed, falling back to npm"
  npm install -g opencode-ai
fi
as_user_sh 'export PATH="$HOME/.opencode/bin:$HOME/.local/bin:$PATH"; opencode --version'

if [ -n "${OPT_ANTHROPIC_API_KEY:-}" ]; then persist_env ANTHROPIC_API_KEY "$OPT_ANTHROPIC_API_KEY"; fi
if [ -n "${OPT_OPENAI_API_KEY:-}" ]; then persist_env OPENAI_API_KEY "$OPT_OPENAI_API_KEY"; fi
if [ -n "${OPT_OPENROUTER_API_KEY:-}" ]; then persist_env OPENROUTER_API_KEY "$OPT_OPENROUTER_API_KEY"; fi
