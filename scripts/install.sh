#!/usr/bin/env bash
# web-dev-skills installer — Claude Code / OpenCode (macOS, Linux)
#
# Add-only. Never removes or overwrites existing skills/commands with a
# different name.
#
# Usage:
#   bash scripts/install.sh
#   TARGET=OpenCode bash scripts/install.sh
#   FORCE=1 bash scripts/install.sh

set -euo pipefail

TARGET="${TARGET:-Claude}"
FORCE="${FORCE:-0}"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

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

echo "Installing web-dev-skills -> $TARGET"
echo "  skills   -> $SKILL_DIR"
echo "  commands -> $CMD_DIR"
echo

mkdir -p "$SKILL_DIR" "$CMD_DIR"

installed=0; skipped=0

for d in "$REPO_ROOT"/skills/*/; do
  name="$(basename "$d")"
  if [ -e "$SKILL_DIR/$name" ] && [ "$FORCE" != "1" ]; then
    echo "  = $name (exists, skipped)"
    skipped=$((skipped+1))
  else
    cp -r "$d" "$SKILL_DIR/$name"
    echo "  + $name"
    installed=$((installed+1))
  fi
done

for f in "$REPO_ROOT"/commands/*.md; do
  name="$(basename "$f")"
  if [ -e "$CMD_DIR/$name" ] && [ "$FORCE" != "1" ]; then
    echo "  = command $name (exists, skipped)"
    skipped=$((skipped+1))
  else
    cp "$f" "$CMD_DIR/$name"
    echo "  + command $name"
    installed=$((installed+1))
  fi
done

echo
echo "Done. $installed installed, $skipped skipped."
echo "Restart your harness (or start a new session) to pick up the new skills and commands."
