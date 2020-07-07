# ArchBasicSetup
The way I install and configure my Arch Linux

#Installing Arch  
-edit `/etc/makepkg.conf`  
-replace PKGEXT='.pkg.tar.xz' SRCEXT='.src.tar.gz'  
-with PKGEXT='.pkg.tar' SRCEXT='.src.tar'  

#Downloading Programs  
-Alacritty  
-Spotify  
-Firefox  
-lf file browser  
-OhMyZsh  
-Zsh  
-PowerLevel10k  
-BetterDiscord  
-KDE Plasma  
-Kvantum  
  
#ZSH  
Install ZSH. Wget is for the plugins.  
`# pacman -S git wget zsh`  
  
Install OhMyZsh and the 'syntax highlighitng' and 'autosuggestions' plugins.  
`sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`  
  
`$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`  
  
`$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`  
  
Add plugins to zsh config  
`# vim ~/.zshrc`  
  
Find the `plugins(git)` line  
  
Replace it with 
```
plugins=(  
    archlinux  
    git  
    history-substring-search  
    colored-man-pages  
    zsh-autosuggestions  
    zsh-syntax-highlighting  
)
```
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
  
#Alacritty  
replace `~/.config/alacritty`  
with the `alacritty` folder provided.  
  
#Spotify  
Download spotify from the AUR  
`$ gpg --recv-key ${keyfromerror}`  
You must log into spotify in order for this to work  
`git clone https://aur.archlinux.org/spicetify-cli.git`  
install spicetify  
`git clone https://aur.archlinux.org/spicetify-themes-git.git`  
install spicetify themes  
`cd spicetify-themes  
cp -r * ~/.config/spicetify/Themes`  
set your permissions  
`sudo chmod a+wr /opt/spotify  
sudo chmod a+wr /opt/spotify/Apps -R`  
applying the theme  
`cd "$(dirname "$(spicetify -c)")/Themes/Dribbblish"` |  
`cp dribbblish.js ../../Extensions` |  
`spicetify config extensions dribbblish.js` |  
`spicetify config current_theme Dribbblish color_scheme Dracula` |  
`spicetify config inject_css 1 replace_colors 1 overwrite_assets 1` |  
`spicetify apply`  
  
#BetterDiscord  
`curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl`  
`chmod +x betterdiscordctl`  
`sudo mv betterdiscordctl /usr/local/bin`  
`sudo betterdiscordctl upgrade`  
`betterdiscordctl install`  
replace ~/.config/betterdiscord with the folder provided  
  
#KDEPlasma  
-Load Kvantum theme "KvGlass" - use defualts  
-Theme: Sweet  
-Plasma Style: Sweet  
-Applicatoin Style: Breeze  
-Window Decoration: Sweet KDE Transparent  
-Fonts: defaults +2  
-Icons: Candy Icons  
-Cursors: Sweet Cursors  
-Desktop Background: *Provided*  
