# Font Setup
Dejavu Sans Mono is my go to font for development. For this to work
nicely with Vim airline characters as well as developer fonts a number
of extra fonts are needed. For this I created `DejaVu Sans Mono for
Powerline Nerd Font.tff` which contains all the required fonts. To add
this to your Ubuntu font image and keep it up to date with my image you
can soft link to it from your ~/.local/share/fonts/ directory as
follows.

Make sure the correct permissions are added to the downloaded font
(cloned from this repository).

*From the cloned directory*
```bash
    chmod 664 DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font.ttf
```

*From the cloned directory*
```bash
    ln -s DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font.tff ~/.local/share/fonts/DejaVu\ Sans\ Mono\ for\ Powerline\ Nerd\ Font.tff
```
