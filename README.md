# Instalation

- Clone repo
- Create simlinks for each file
- Config files should start with `.` in Linux/OS and with `_` in Windows

**On Windows**

From `$HOME`:

`mklink .\_vimrc .\projects\dotfiles\vimrc`

**On Mac**

`ln -s ~/projects/dotfiles/vimrc ~/.vimrc`

# List of files 

- **vimrc**: vim dot file. 
- **vsvimrc**: VsVim (Visual Studio Vim extension) dot file.
- **ledgerrc**: Ledger config file
