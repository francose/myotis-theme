#!/usr/bin/env bash
# Install/apply this dotfiles setup on a machine.
set -euo pipefail
DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Applying GNOME Terminal Gruvbox theme"
bash "$DOTFILES/gnome-terminal/apply.sh" || echo "  (skipped: gsettings/dconf unavailable)"

echo "==> Wiring zsh prompt addon into ~/.zshrc"
SRC_LINE="[ -f \"$DOTFILES/zsh/gruvbox-prompt.zsh\" ] && source \"$DOTFILES/zsh/gruvbox-prompt.zsh\""
if ! grep -qF "gruvbox-prompt.zsh" ~/.zshrc 2>/dev/null; then
  {
    echo ""
    echo "# Gruvbox prompt addon (managed in ~/dotfiles)"
    echo "$SRC_LINE"
  } >> ~/.zshrc
  echo "  added source line to ~/.zshrc"
else
  echo "  already present in ~/.zshrc"
fi

echo "==> Done. Open a new terminal or run: source ~/.zshrc"
