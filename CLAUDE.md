# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Nix configuration repository for managing a macOS system declaratively using nix-darwin and home-manager. The configuration provides a complete development environment with tiling window management, terminal customization, and development tools.

## Essential Commands

### System Configuration
```bash
# Apply system configuration changes
darwin-rebuild switch --flake .#kj-default

# Format Nix files (install first if needed)
nix profile install github:kamadorueda/alejandra/3.1.0
alejandra .

# Nix language server (install first if needed)  
nix profile install github:oxalica/nil
```

## Architecture

### Directory Structure
- `flake.nix` - Main entry point defining the Darwin system configuration
- `hosts/aarch64-darwin@kj-default/` - System-specific configuration profile
- `modules/darwin/` - macOS-specific configurations (system, homebrew, services)
- `modules/shared/` - Cross-platform configurations (shell, packages, dotfiles)
- `lib/` - Helper functions for building configurations
- `overlays/` - Custom package overlays
- `pkgs/` - Custom package definitions

### Key Components
- **Window Management**: Yabai + skhd + jankyborders for tiling window management
- **Status Bar**: Sketchybar with custom Lua configuration
- **Shell**: Nushell with Starship prompt and Catppuccin theming
- **Terminal**: Ghostty terminal emulator
- **Editor**: Neovim with LazyVim configuration
- **Input**: Karabiner-Elements for keyboard customization
- **Automation**: Hammerspoon for macOS automation

### Configuration Pattern
The repository uses a modular approach where:
- System-level configs are in `modules/darwin/`
- User-level configs use home-manager in `modules/shared/home/`
- The `lib/mkUserConfig` helper centralizes user configuration
- Catppuccin theme is applied consistently across applications

## Development Environment

### Installed Development Tools
- **Node.js**: Managed via fnm (Fast Node Manager)
- **Git**: Extensive alias configuration in `modules/shared/files/nushell/git-alias.nu`
- **Editor**: Neovim with LazyVim, Mason, ESLint, Prettier, TypeScript support (자세한 내용은 [neovim.md](./neovim.md) 참조)
- **Terminal Multiplexer**: tmux with custom configuration
- **System Monitor**: btop for resource monitoring

### Key Keyboard Shortcuts
The system uses extensive keyboard-driven workflow with yabai:
- Left hand: workspace switching (W/E/R for spaces 7/8/9, S/D/F for spaces 4/5/6, X/C/V for spaces 1/2/3)
- Right hand: directional window control (H/J/K/L for focus/move, N/M/,/. for resize)
- Modifiers: Shift for moving windows, Alt for stacking operations

## Documentation

- **Neovim Configuration**: [neovim.md](./neovim.md) - Neovim 설정에 대한 상세한 한국어 문서
- **Cheatsheet**: [cheatsheet.md](./cheatsheet.md) - 자주 사용하는 명령어와 키보드 단축키 모음

## Important Notes

- Target system: aarch64-darwin (Apple Silicon Mac)
- User: gangjun
- No project-specific development shells configured
- System changes require `darwin-rebuild switch` to apply
- Configuration follows declarative Nix principles