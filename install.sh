#!/bin/bash
set -e  # Exit on error

echo "preperation"

# Define paths
PKGDIR=/etc/scc
WORKDIR=/tmp/scc-install

# Ensure clean temp directory
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR" "$PKGDIR"

echo "cloning"

# Clone repo to temp
git clone https://github.com/hady-khann/SCC.git "$WORKDIR"

echo "checking system"

# Always overwrite /etc/scc/.sources
cp "$WORKDIR/_sources" "$PKGDIR/.sources"
chmod 644 "$PKGDIR/.sources"

# Ensure /etc/bash.bashrc sources /etc/scc/.sources only once
if ! grep -q "$PKGDIR/.sources" /etc/bash.bashrc; then
  cat << EOF >> /etc/bash.bashrc

# Auto-sourcing custom system-wide bash extensions
if [ -f $PKGDIR/.sources ]; then
  source $PKGDIR/.sources
fi

EOF
fi

echo "install....."
# Run modular bashrc scripts (these modify files in /etc/)
bash "$WORKDIR/bashrc/dkr-bashrc"
bash "$WORKDIR/bashrc/dc-bashrc"
bash "$WORKDIR/bashrc/git-bashrc"
bash "$WORKDIR/bashrc/tmx-bashrc"
bash "$WORKDIR/bashrc/k8s-bashrc"

echo "reload bash ....."

# Reload shell environments
source /etc/bash.bashrc
source ~/.bashrc

echo "cleanup"

# Ensure clean temp directory
rm -rf "$WORKDIR"