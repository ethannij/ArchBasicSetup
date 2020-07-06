# ArchBasicSetup
The way I install and configure my Arch Linux

#Installing Arch

#Downloading Programs
-Alacritty
-Spotify
-Firefox
-lf file browser
-OhMyZsh
-Zsh
-PowerLevel10k

#ZSH
Install ZSH. Wget is for the plugins.
`# pacman -S get wget zsh`

Install OhMyZsh and the 'syntax highlighitng' and 'autosuggestions' plugins.
`sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

`$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

`$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

Add plugins to zsh config
`# vim ~/.zshrc`

Find the `plugins(git)` line

Replace it with `plugins=(
    archlinux
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)`
If the file is empty, type `$ zsh` into the terminal and run the configuration.

`source ~/zshrc` to apply changes.

#PowerLevel10k
Start by downloading PowerLevel10k for ohmyzsh
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`

In ~/.zshrc
replace `ZSH_THEME="robbyrussell"`
with `ZSH_THEME="powerlevel10k/powerlevel10k"`
`source ~/.zshrc`
type `p10k configure` into your command line
if there are graphical errors with the symbols, install the provided `p10k fonts`
