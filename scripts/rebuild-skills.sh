#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/dist"
mkdir -p "$OUT"
shopt -s nullglob

decode_base64() {
  if base64 --help 2>&1 | grep -q -- '--decode'; then
    base64 --decode
  else
    base64 -D
  fi
}

rebuild() {
  local edition="$1"
  local filename="$2"
  local parts=("$ROOT/downloads/$edition"/*.txt)
  if [ "${#parts[@]}" -eq 0 ]; then
    echo "No Base64 parts found for $edition" >&2
    exit 1
  fi

  local tmp
  tmp="$(mktemp "${TMPDIR:-/tmp}/pzh-skill-${edition}.XXXXXX")"
  trap 'rm -f "$tmp"' RETURN
  cat "${parts[@]}" | decode_base64 > "$tmp"
  unzip -tqq "$tmp"
  mv "$tmp" "$OUT/$filename"
  trap - RETURN
  echo "Rebuilt $OUT/$filename"
}

rebuild base "pzh-image-to-editable-ppt-base.skill"
rebuild cross "pzh-image-to-editable-ppt-cross.skill"
