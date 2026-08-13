# GenePad Homebrew Tap

Homebrew cask for **GenePad** — a lightweight, cross-platform DNA sequence viewer and editor.

## Install

```bash
brew install genepad/tap/genepad
```

Equivalently:

```bash
brew tap genepad/tap
brew install --cask genepad
```

Update later with `brew upgrade genepad` (or `brew upgrade --cask genepad`).

## Notes

- macOS **arm64 (Apple Silicon)** only for now. Intel is not yet supported.
- The app is currently **unsigned**; on first launch macOS may prompt — right-click → Open, or run
  `xattr -dr com.apple.quarantine /Applications/GenePad.app`.
- Homepage: https://genepad.cn · Source: https://github.com/Masterchiefm/GenePad
