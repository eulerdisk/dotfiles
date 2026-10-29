
IMAGE_NAME=zephyr
# podman image rm --force localhost/$IMAGE_NAME
podman build -t $IMAGE_NAME .

distrobox rm -f $IMAGE_NAME
mkdir -p ~/homes/$IMAGE_NAME
distrobox create --name $IMAGE_NAME \
  --image localhost/$IMAGE_NAME \
  --home ~/homes/$IMAGE_NAME \
  --pre-init-hooks "export SHELL=/bin/bash"
