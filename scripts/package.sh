#!/usr/bin/env bash
# Build perfect-arabic.zip for upload to ChatGPT (Skills → Create → Upload).
# The archive contains exactly one top-level folder, and that folder contains SKILL.md.
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out="${1:-$repo_root/perfect-arabic.zip}"

command -v zip >/dev/null || { echo "zip is not installed" >&2; exit 1; }

cd "$repo_root/skills"
rm -f "$out"
zip -r -q "$out" perfect-arabic -x '.*' -x '*/.*'

echo "Wrote $out"
unzip -l "$out"
