#!/bin/bash
set -e  # Exit on error

echo "preperation"

# Define paths
PKGDIR=/etc/scc
WORKDIR=/tmp/scc-install

# Ensure clean temp directory
rm -rf "$PKGDIR"
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR" "$PKGDIR"

echo "cloning"

# Clone repo to temp
git clone --depth=1 https://github.com/hady-khann/SCC.git "$WORKDIR"

echo "checking system"

# Always overwrite /etc/scc/.sources
cp "$WORKDIR/sources" "$PKGDIR/.sources"
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
bash "$WORKDIR/bashrc/dkr_bashrc"
bash "$WORKDIR/bashrc/dc_bashrc"
bash "$WORKDIR/bashrc/git_bashrc"
bash "$WORKDIR/bashrc/tmx_bashrc"
bash "$WORKDIR/bashrc/k8s_bashrc"
bash "$WORKDIR/bashrc/sys_bashrc"
bash "$WORKDIR/bashrc/scc_bashrc"
bash "$WORKDIR/bashrc/kuber_bashrc"

echo "reload bash ....."

# Reload shell environments
source /etc/bash.bashrc
source ~/.bashrc

echo "cleanup"

# Ensure clean temp directory
rm -rf "$WORKDIR"



echo -e "\n\033[1;32mInstallation complete!\033[0m"
echo "To apply changes, run:"
echo "  source /etc/bash.bashrc && source ~/.bashrc"