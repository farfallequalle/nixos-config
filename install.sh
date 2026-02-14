#!/usr/bin/env bash
set -euo pipefail

HOST="${1:?Usage: install.sh <hostname>}"
REPO="/home/farfallequalle/nixos-config"

if [ ! -d "$REPO" ]; then
  git clone https://github.com/farfallequalle/nixos-config.git "$REPO"
fi

nixos-generate-config --show-hardware-config > "$REPO/hosts/$HOST/hardware-configuration.nix"
sudo nixos-rebuild switch --flake "$REPO#$HOST"
