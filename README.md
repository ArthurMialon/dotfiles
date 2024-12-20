# Dotfiles

## Installation

### From scratch (new mac)

```
curl -fsSL https://raw.githubusercontent.com/arthurmialon/dotfiles/main/.scripts/install.sh | bash
```

### From existing

**Requirements**

- [Dot CLI](https://github.com/ArthurMialon/dot)
- [Homebrew](https://brew.sh/)

```bash
dot init git@github.com:ArthurMialon/dotfiles.git
```

Once the installation is done you can refresh your terminal.

## 🔐 Setup secrets package

I'm using an ignored folder to keep files with secrets but keep Dot symlinks.

```bash
dot add ~/.config/secrets.zsh secrets
```

Use it for `.aws/credentials` too for example;

```bash
dot add ~/.aws/credentials secrets
```

### Export new dependencies to Brewfile

```bash
brew bundle dump --force
```
