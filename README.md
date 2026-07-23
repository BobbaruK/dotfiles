# dotfiles

Personal Linux development environment.

## Goals

- Declarative configuration using chezmoi
- Idempotent installation
- Easy bootstrap on a fresh machine
- Easy cleanup after use
- Support multiple Linux distributions
- Keep configuration separate from installation

## Structure

```
.
├── docs/
├── home/          # Managed by chezmoi
├── install/       # Package installation
├── packages/      # Package lists
├── scripts/       # Bootstrap / cleanup / utilities
└── README.md
```

## Status

🚧 Work in progress.
