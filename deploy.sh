#!/bin/bash
set -e
set -x

HOST="10.10.200.53"
USER="root"
TARGET_DIR="/root/rise-2026"
CONTAINER_NAME="rise-container"
IP="10.30.0.35"
NETWORK="macvlan0" # Assuming this is the existing VLAN network name
IMAGE_NAME="rise-2026"

echo "Deploying to $HOST..."

# Rsync source code
rsync -avz -e "ssh -o StrictHostKeyChecking=no" --exclude 'node_modules' --exclude '.git' --exclude '.svelte-kit' . $USER@$HOST:$TARGET_DIR

# Build and Run on Host
ssh -o StrictHostKeyChecking=no $USER@$HOST << EOF
  cd $TARGET_DIR
  
  echo "Building image..."
  podman build -t $IMAGE_NAME .
  
  echo "Stopping old container..."
  podman rm -f $CONTAINER_NAME || true
  
  echo "Starting new container..."
  # Ensure macvlan network exists or find the right one if name is different
  # Assuming 'macvlan0' for now based on prompt context.
  
  podman run -d \
    --name $CONTAINER_NAME \
    --net=$NETWORK \
    --ip=$IP \
    -v $TARGET_DIR/data:/data \
    -e DATABASE_PATH=/data/rise.db \
    --restart unless-stopped \
    $IMAGE_NAME
    
  echo "Deployment successful!"
EOF
