# Nix Darwin Configuration

A declarative macOS system configuration using [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager). This repository provides a complete development environment with tiling window management, modern terminal setup, and comprehensive development tools.

## Overview

This configuration transforms macOS into a keyboard-driven development powerhouse featuring:

- **Catppuccin Theme**: Consistent color scheme across all applications
- **Window Management**: [Yabai](https://github.com/koekeishiya/yabai) + [skhd](https://github.com/koekeishiya/skhd) for tiling window management
- **Status Bar**: [Sketchybar](https://github.com/FelixKratz/SketchyBar) with custom Lua configuration
- **Terminal**: [Ghostty](https://ghostty.org/) with [tmux](https://github.com/tmux/tmux)
- **Shell**: [Fish shell](https://fishshell.com) with custom prompt ([Starship](https://starship.rs/))
- **Editor**: Neovim with [LazyVim](https://www.lazyvim.org/) configuration
- **Development Tools**: Node.js (via [fnm](https://github.com/Schniz/fnm)), Git, Docker, and more

## Quick Start

### Prerequisites

- macOS (Apple Silicon supported)
- [Nix](https://nixos.org/download.html) package manager
- Command Line Tools for Xcode

### Installation

1. Clone this repository:

```bash
git clone https://github.com/yourusername/nix-config.git ~/nix
cd ~/nix
```

2. Apply the configuration:

```bash
darwin-rebuild switch --flake .#kj-default
```

## Repository Structure

```
.
├── flake.nix                 # Main entry point
├── hosts/                    # System-specific configurations
├── modules/
│   ├── darwin/              # macOS-specific modules
│   │   ├── home/           # User configuration
│   │   ├── homebrew.nix    # Homebrew packages
│   │   └── yabai/          # Window manager config
│   └── shared/              # Cross-platform modules
│       ├── files/          # Dotfiles and configs
│       └── home/           # User packages
├── lib/                      # Helper functions
├── overlays/                 # Package overlays
└── pkgs/                     # Custom packages
```

## Key Features

### Window Management

The configuration uses a sophisticated keyboard-driven window management system:

- **Left hand controls**: Workspace switching (Q-V keys)
- **Right hand controls**: Window focus and movement (H-L keys)
- **Modifiers**: Shift for moving, Alt for stacking operations

See the [keyboard mapping section](#keyboard-wm-keymap) below for detailed shortcuts.

### Development Environment

- **Multiple Language Support**: JavaScript/TypeScript, Python, Rust, Go
- **AI-Powered Coding**: GitHub Copilot and Claude.nvim integration
- **Modern Tooling**: ESLint, Prettier, TypeScript LSP
- **Git Workflow**: Extensive aliases and integrations

### Terminal & Shell

- **Ghostty Terminal**: GPU-accelerated terminal with Catppuccin theme
- **Fish Shell**: Modern shell with autosuggestions and completions
- **Tmux**: Terminal multiplexer with custom status bar
- **Starship Prompt**: Fast, customizable prompt

## Configuration

### Customization

The main user configuration is centralized in `modules/darwin/home/default.nix`. Key areas:

- **Packages**: Add new packages to `modules/shared/home/packages.nix`
- **Shell**: Configure shell in `modules/darwin/home/shell.nix`
- **Git**: Modify aliases in `modules/shared/home/git-aliases.nix`
- **Neovim**: Edit plugins in `modules/shared/files/nvim/lua/plugins/`

### Theme

The entire system uses the [Catppuccin](https://github.com/catppuccin/catppuccin) color scheme (Macchiato variant) for visual consistency across all applications.

## Documentation

- [CLAUDE.md](./CLAUDE.md) - AI assistant instructions and project context

## Keyboard WM Keymap

This keymap is optimized for split keyboards. The left hand controls workspace navigation while the right hand manages window operations.

> **Note**: Split keyboard firmware keymap configuration will be uploaded to a separate repository soon.

### Left Hand - Workspace Control

| Key   | Function          | Shift             | Alt+Shift     |
| ----- | ----------------- | ----------------- | ------------- |
| **Q** | Balance windows   | Mirror X-axis     | Mirror Y-axis |
| **W** | Focus space 7     | Move to space 7   | -             |
| **E** | Focus space 8     | Move to space 8   | -             |
| **R** | Focus space 9     | Move to space 9   | -             |
| **T** | Workspace setup 1 | Workspace setup 2 | -             |
| **A** | Focus monitor 2   | -                 | -             |
| **S** | Focus space 4     | Move to space 4   | -             |
| **D** | Focus space 5     | Move to space 5   | -             |
| **F** | Focus space 6     | Move to space 6   | -             |
| **G** | Float/Grid window | -                 | -             |
| **Z** | Focus monitor 1   | -                 | -             |
| **X** | Focus space 1     | Move to space 1   | -             |
| **C** | Focus space 2     | Move to space 2   | -             |
| **V** | Focus space 3     | Move to space 3   | -             |
| **B** | Maximize window   | -                 | -             |

### Right Hand - Window Control

| Key   | Function            | Shift                    | Alt         |
| ----- | ------------------- | ------------------------ | ----------- |
| **I** | Stack next          | -                        | -           |
| **O** | Stack previous      | -                        | -           |
| **H** | Focus left          | Move left                | Stack left  |
| **J** | Focus down          | Move down                | Stack down  |
| **K** | Focus up            | Move up                  | Stack up    |
| **L** | Focus right         | Move right               | Stack right |
| **N** | Rotate clockwise    | Rotate counter-clockwise | -           |
| **M** | Increase left size  | Decrease left size       | -           |
| **,** | Increase up size    | Decrease up size         | -           |
| **.** | Increase down size  | Decrease down size       | -           |
| **/** | Increase right size | Decrease right size      | -           |

## Maintenance

```bash
# Update flake inputs
nix flake update

# Rebuild after changes
sudo darwin-rebuild switch --flake .#kj-default
```

## References

- [AlexNabokikh/nix-config](https://github.com/AlexNabokikh/nix-config)
- [sudosubin/nixos-config](https://github.com/sudosubin/nixos-config)
- [DavSanchez/nix-dotfiles](https://github.com/DavSanchez/nix-dotfiles)
- [thiagokokada/nix-configs](https://github.com/thiagokokada/nix-configs)
- [khaneliman/khanelinix](https://github.com/khaneliman/khanelinix)

## License

This project is open source and available under the [MIT License](LICENSE).
