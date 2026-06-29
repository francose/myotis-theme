<div align="center">

# 🦇 myotis-theme

### Gruvbox Dark for GNOME Terminal + a git-aware zsh prompt — installed with one command.

[![Shell](https://img.shields.io/badge/shell-zsh-1a1a1a?logo=gnu-bash&logoColor=ebdbb2)](https://www.zsh.org/)
[![Terminal](https://img.shields.io/badge/terminal-GNOME-0a0a0a?logo=gnome&logoColor=fe8019)](https://help.gnome.org/users/gnome-terminal/stable/)
[![Theme](https://img.shields.io/badge/theme-Gruvbox%20Dark-fabd2f?logo=data:image/svg+xml;base64,)](#palette)
[![Distro](https://img.shields.io/badge/built%20on-Kali%20Linux-367bf0?logo=kalilinux&logoColor=white)](https://www.kali.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-98971a)](LICENSE)

A portable, version-controlled terminal look: near-black background, warm Gruvbox
palette, an orange accent cursor, and a zsh prompt that shows your git branch and
status at a glance. Clone it on any machine and run one script.

</div>

---

## ✨ Features

- 🌑 **Near-black background** (`#0a0a0a`) — easy on the eyes, OLED-friendly
- 🎨 **Full Gruvbox Dark palette** — all 16 ANSI colors remapped, so `ls`, prompts, and tools all pick it up automatically
- 🧡 **Orange accent cursor** (`#fe8019`) that stands out against the dark
- 🌿 **Git-aware zsh prompt** — branch name, unstaged/staged markers, exit code, and background-job count on the right
- ⚡ **One-command install** — applies the terminal theme *and* wires the prompt into your `~/.zshrc`
- 🔁 **Fully reversible** — revert snippet included; nothing is overwritten silently

## 🎨 Palette

| Role | Color | | Role | Color |
|------|-------|-|------|-------|
| Background | `#0a0a0a` | | Foreground | `#ebdbb2` |
| Red | `#cc241d` | | Bright Red | `#fb4934` |
| Green | `#98971a` | | Bright Green | `#b8bb26` |
| Yellow | `#d79921` | | Bright Yellow | `#fabd2f` |
| Blue | `#458588` | | Bright Blue | `#83a598` |
| Magenta | `#b16286` | | Bright Magenta | `#d3869b` |
| Cyan | `#689d6a` | | Bright Cyan | `#8ec07c` |
| Cursor | `#fe8019` | | Gray | `#928374` |

## 🚀 Install

```sh
git clone git@github.com:francose/myotis-theme.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then open a new terminal (or `source ~/.zshrc`). That's it.

> The installer applies the GNOME Terminal palette via `dconf` and adds a single
> `source` line to your `~/.zshrc`. It's idempotent — safe to run more than once.

## 🧩 What's inside

| Path | Purpose |
|------|---------|
| `gnome-terminal/gruvbox.dconf` | Exported GNOME Terminal profile (palette, background, cursor) |
| `gnome-terminal/apply.sh` | Loads the palette into your default profile via `dconf` |
| `zsh/gruvbox-prompt.zsh` | Right-side prompt: git branch + dirty/staged markers + exit code + jobs |
| `install.sh` | Applies the theme and wires the prompt into `~/.zshrc` |

## ↩️ Revert

```sh
SCHEMA="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \\')/"
for k in use-theme-colors background-color foreground-color palette \
         bold-color-same-as-fg cursor-colors-set cursor-background-color \
         cursor-foreground-color; do gsettings reset "$SCHEMA" "$k"; done
```

To remove the prompt addon, delete the `gruvbox-prompt.zsh` source line from `~/.zshrc`.

## 🙏 Credits

Palette based on the wonderful [Gruvbox](https://github.com/morhetz/gruvbox) by morhetz.

## 📄 License

[MIT](LICENSE) — use it, fork it, make it yours.
