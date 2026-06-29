# dotfiles

Personal terminal + zsh setup for Kali Linux (GNOME Terminal + zsh).

## What's inside

| Path | Purpose |
|------|---------|
| `gnome-terminal/gruvbox.dconf` | Exported GNOME Terminal profile — Gruvbox Dark palette, near-black `#0a0a0a` background, orange accent cursor |
| `gnome-terminal/apply.sh` | Loads the palette into your default GNOME Terminal profile via `dconf` |
| `zsh/gruvbox-prompt.zsh` | Right-side prompt addon: git branch + dirty/staged markers, exit code, background-job count |
| `install.sh` | Applies the terminal theme and wires the prompt addon into `~/.zshrc` |

## Install

```sh
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then open a new terminal (or `source ~/.zshrc`).

## Theme

**Gruvbox Dark**

- background `#0a0a0a` · foreground `#ebdbb2` · cursor `#fe8019`
- The base Kali two-line prompt picks up Gruvbox automatically because the
  terminal's ANSI palette is remapped; the right-side prompt adds git context.

## Revert the terminal theme

```sh
SCHEMA="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \\')/"
for k in use-theme-colors background-color foreground-color palette \
         bold-color-same-as-fg cursor-colors-set cursor-background-color \
         cursor-foreground-color; do gsettings reset "$SCHEMA" "$k"; done
```
