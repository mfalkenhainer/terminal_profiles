# terminal_profiles
Personal terminal profiles for sharing between computers

# Setup
- Installing
  - Ensure zsh is installed
  - Install oh-my-zsh: `https://ohmyz.sh/#install`
  - Install neovim: `https://github.com/neovim/neovim/blob/master/INSTALL.md`

- Configuration
  - Copy zsh config: `cp .zshrc ~/.zshrc`
  - Copy nvim config: `cp -r nvim ~/.config`
    - Install lua for nvim package manager: `sudo apt install lua5.4`
    - Run nvim to ensure all the plugins install

- Theme
  - Install JetBrains NerdFont: `https://www.nerdfonts.com/font-downloads`
    - Find OS specific instructions to install the font package
    - Set up your terminal to use the installed font
  - Update omz's `fwalch` theme
    - Change top line to `PROMPT='%{$fg_bold[green]%} %{$fg[cyan]%}%/: %{$reset_color%}'`
      - Don't worry about the other 4 vars, they are not used

