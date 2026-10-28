
# podman image rm --force localhost/embedded
podman build -t embedded .

distrobox rm -f embedded
mkdir -p ~/homes/embedded
distrobox create --name embedded \
  --image localhost/embedded \
  --home ~/homes/embedded \
  --pre-init-hooks "export SHELL=/bin/bash"
