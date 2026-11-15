#!/usr/bin/env bash
# web-dev-skills installer — OpenCode or Claude Code (macOS, Linux, WSL, Git Bash)
#
# Works two ways:
#   1. From a clone:   bash scripts/install.sh
#   2. One-liner:      curl -fsSL https://raw.githubusercontent.com/yashoramabhat-hash/web-dev-skills/main/scripts/install.sh | bash
#
# In standalone mode it downloads the repository archive and installs from that.
# Installation is ADD-ONLY: existing skills and commands are never overwritten
# or removed. Set FORCE=1 to overwrite files with the same name.
#
#   TARGET=OpenCode bash scripts/install.sh
#   TARGET=Claude FORCE=1 bash scripts/install.sh

set -euo pipefail

TARGET="${TARGET:-Claude}"
FORCE="${FORCE:-0}"
REPO="${REPO:-yashoramabhat-hash/web-dev-skills}"
BRANCH="${BRANCH:-main}"

# ---- resolve skill + command source dirs ----
SOURCE_ROOT=""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/../skills" ]; then
  SOURCE_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

if [ -z "$SOURCE_ROOT" ]; then
  echo "Downloading $REPO@$BRANCH ..."
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  ARCHIVE="$TMP/repo.zip"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.zip" -o "$ARCHIVE"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "https://github.com/$REPO/archive/refs/heads/$BRANCH.zip" -O "$ARCHIVE"
  else
    echo "Need curl or wget to download." >&2; exit 1
  fi
  if command -v unzip >/dev/null 2>&1; then
    unzip -q "$ARCHIVE" -d "$TMP"
  else
    echo "Need unzip to extract." >&2; exit 1
  fi
  SOURCE_ROOT="$(find "$TMP" -maxdepth 1 -type d -name 'web-dev-skills*' | head -n 1)"
  if [ -z "$SOURCE_ROOT" ]; then echo "Could not locate the extracted repository root." >&2; exit 1; fi
fi

case "$TARGET" in
  OpenCode)
    SKILL_DIR="${HOME}/.config/opencode/skills"
    CMD_DIR="${HOME}/.config/opencode/commands"
    ;;
  Claude)
    SKILL_DIR="${HOME}/.claude/skills"
    CMD_DIR="${HOME}/.claude/commands"
    ;;
  *)
    echo "Unknown TARGET '$TARGET' (use Claude or OpenCode)" >&2; exit 1 ;;
esac

echo "web-dev-skills -> $TARGET"
echo "  skills   -> $SKILL_DIR"
echo "  commands -> $CMD_DIR"
echo

mkdir -p "$SKILL_DIR" "$CMD_DIR"

installed=0; skipped=0

for d in "$SOURCE_ROOT"/skills/*/; do
  [ -d "$d" ] || continue
  name="$(basename "$d")"
  dest="$SKILL_DIR/$name"
  if [ -e "$dest" ] && [ "$FORCE" != "1" ]; then
    if [ -f "$dest/SKILL.md" ] && [ -f "$d/SKILL.md" ] && cmp -s "$d/SKILL.md" "$dest/SKILL.md"; then
      echo "  = $name (up to date)"; skipped=$((skipped+1))
    else
      echo "  ! $name (exists - skipped, set FORCE=1 to overwrite)"; skipped=$((skipped+1))
    fi
    continue
  fi
  cp -r "$d" "$dest"
  echo "  + $name"; installed=$((installed+1))
done

for f in "$SOURCE_ROOT"/commands/*.md; do
  [ -f "$f" ] || continue
  name="$(basename "$f")"
  dest="$CMD_DIR/$name"
  if [ -e "$dest" ] && [ "$FORCE" != "1" ]; then
    if cmp -s "$f" "$dest"; then
      echo "  = command $name (up to date)"; skipped=$((skipped+1))
    else
      echo "  ! command $name (exists - skipped, set FORCE=1 to overwrite)"; skipped=$((skipped+1))
    fi
    continue
  fi
  cp "$f" "$dest"
  echo "  + command $name"; installed=$((installed+1))
done

echo
echo "Done. $installed installed, $skipped skipped."
[ "$skipped" -gt 0 ] && echo "Re-run with FORCE=1 to overwrite the skipped items."
echo "Restart your harness (or start a new session) to pick up the new skills and commands."
