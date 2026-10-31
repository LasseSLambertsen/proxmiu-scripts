log "Installing Docker"
curl -fsSL https://get.docker.com | sh
usermod -aG docker "$PM_USER"
systemctl enable --now docker
