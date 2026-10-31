# Proxmiu scripts

Install scripts for [Proxmiu](https://github.com/LasseSLambertsen/proxmiu) templates. Each file is the part that runs inside the new guest, after Proxmiu's base setup.

Use one from Proxmiu:

1. Open **Templates → New template**.
2. Set **Install script from** to **GitHub repository**.
3. Use repository `LasseSLambertsen/proxmiu-scripts`, branch `main`, and a path below.
4. Pick resources and options.

| Script | Path | Options |
| --- | --- | --- |
| Claude Code server | `scripts/claude-code.sh` | `ANTHROPIC_API_KEY` + common options |
| Codex server | `scripts/codex.sh` | `OPENAI_API_KEY` + common options |
| AI dev box | `scripts/ai-devbox.sh` | both API keys + common options |
| OpenCode server | `scripts/opencode.sh` | `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, `OPENROUTER_API_KEY` + common options |
| Docker host | `scripts/docker-host.sh` | `TMUX_AUTOATTACH` |

Common options: `TMUX_AUTOATTACH`, `GIT_NAME`, `GIT_EMAIL`, `GITHUB_TOKEN`, `REPO_URL`, `TAILSCALE_AUTHKEY`.

Proxmiu turns each option into an `OPT_<KEY>` environment variable for the script. Secrets are entered in the UI, are not stored in this repository, and are redacted from provisioning logs.

## Helpers available to scripts

Proxmiu prepends `lib/prelude.sh` before every install script and appends `lib/epilogue.sh` after it. Those files are included here for reference. The scripts should not source them again when used through Proxmiu.

Available helpers: `log`, `retry`, `apt_install`, `as_user`, `as_user_sh`, `persist_env`, `install_node`.

## Safety

This repository contains no credentials, tokens, private keys, hostnames, or personal paths. The scripts install software from the projects' official installers:

- Claude Code: <https://claude.ai/install.sh>
- Codex CLI: npm package `@openai/codex`
- OpenCode: <https://opencode.ai/install> or npm package `opencode-ai`
- Docker: <https://get.docker.com>
- GitHub CLI, Tailscale, Node.js: their official installers

Review any script before running it, as you would with any code from the internet.

## License

MIT. See [LICENSE](LICENSE).
