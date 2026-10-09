

# Clone the repo using the private key "id_github_eulerdisk"
# Clone into ~/.local/share/chezmoi
git clone \
  -c "core.sshCommand=ssh -i ~/.ssh/id_github_eulerdisk -F /dev/null" \
  git@github.com:eulerdisk/dotfiles.git \
  ~/.local/share/chezmoi

chezmoi apply

