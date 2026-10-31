log "Installing Claude Code"
install_node
# pipefail: a failed download would otherwise look like success (bash happily runs an empty script).
if ! as_user_sh 'set -o pipefail; curl -fsSL https://claude.ai/install.sh | bash'; then
  log "Native installer failed, falling back to npm"
  npm install -g @anthropic-ai/claude-code
fi
as_user_sh 'claude --version'
if [ -n "${OPT_ANTHROPIC_API_KEY:-}" ]; then persist_env ANTHROPIC_API_KEY "$OPT_ANTHROPIC_API_KEY"; fi
