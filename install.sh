#!/bin/bash
set -e  # Exit on error

# Define paths
PKGDIR=/etc/scc
WORKDIR=/tmp/scc_install

# Ensure clean temp directory
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR" "$PKGDIR"

# Clone repo to temp
git clone https://github.com/your-username/SCC.git "$WORKDIR"

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

# Run modular bashrc scripts (these modify files in /etc/)
bash "$WORKDIR/bashrc/dkr_bashrc"
bash "$WORKDIR/bashrc/doco_bashrc"
bash "$WORKDIR/bashrc/git_bashrc"
bash "$WORKDIR/bashrc/tmx_bashrc"
bash "$WORKDIR/bashrc/k8s_bashrc"

# Reload shell environments
source /etc/bash.bashrc
source ~/.bashrc


# Ensure clean temp directory
rm -rf "$WORKDIR"