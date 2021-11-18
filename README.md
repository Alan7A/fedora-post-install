# Fedora post installation configurations

Set of commands and files to make a fresh install of Fedora Workstation look nice. By [Alan Delgado](https://github.com/Alan7A).

Day Theme (Nord)
![Nord](/Screenshots/Nord.png)

Night Theme (Tokyo Night)
![Nord](/Screenshots/TokyoNight.png)

## Table of contents

  - [Initial settings](#initial-settings)
    - [Enable DNF fastest mirror and update](#enable-dnf-fastest-mirror-and-update)
    - [Settings app](#settings-app)
  - [Software Sources](#software-sources)
    - [Enable third party repositories](#enable-third-party-repositories)
    - [Enable rpm-fusion](#enable-rpm-fusion)
    - [Enable flathub](#enable-flathub)
    - [Microsoft core fonts](#microsoft-core-fonts)
  - [NVIDIA Drivers](#nvidia-drivers)
  - [Apps installation](#apps-installation)
    - [Google Chrome](#google-chrome)
    - [Visual Studio Code](#visual-studio-code)
    - [Vim](#vim)
    - [Java](#java)
    - [Other apps via Flathub](#other-apps-via-flathub)
  - [Customization](#customization)
    - [Cursor, icons and themes](#cursor-icons-and-themes)
    - [Fonts](#fonts)
    - [Gnome Tweaks](#gnome-tweaks)
    - [Gnome Extensions](#gnome-extensions)
    - [Keyboard Shortcuts](#keyboard-shortcuts)
    - [Pywal](#pywal)
    - [Terminal colors](#terminal-colors)
    - [Shell](#shell)
  - [Extras](#extras)
    - [Git configurations](#git-configurations)
    - [rEFInd](#refind)
    - [Gedit Nord theme](#gedit-nord-theme)
    - [Theme Flatpak apps](#theme-flatpak-apps)
    - [XAMPP](#xampp)

## Initial settings

### Enable DNF fastest mirror and update

- Edit `/etc/dnf/dnf.conf` and append the following lines
    ```sh
    fastestmirror=true
    deltarpm=true
    ```
 - Run
    ```sh
    sudo dnf up
    ```

### Settings app

- `Sharing:` Enable sharing, file sharing and change computer name
- `Power:` Change blank screen timer and set power button behavior to `Power Off` 
- `Displays:` Set resolution, refresh rate and scale 
- `Mouse and Touchpad:` Set mouse speed
- `Keyboard:` Set input source to `English (Intl., with AltGr dead keys)`.
- `Region and languaje:` set Formats to `México`
- `Users:` Change user image to **image**
- `Time:` Set Time Format to `AM / PM`

## Software Sources

### Enable third party repositories

 - `Software` -> `Software Repositories` -> `Third Party Repositories` -> `Enable All`
 - From the list below, enable required repositories such as google-chrome, nvidia-drivers, steam, etc.

### Enable rpm-fusion

 - Free
    ```sh
    sudo rpm -Uvh https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    ```
 - Non-free
    ```sh
    sudo rpm -Uvh https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    ```

### Enable flathub
- Enable flathub support
    ```sh
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ```

### Microsoft core fonts

 - Add repository and install additional fonts
    ```sh
    sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
    sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
    ```

## NVIDIA Drivers

**It is extremely IMPORTANT to restart and select GNOME Xorg in the login screen**

- Download and install NVIDIA drivers:
    ```sh
    sudo dnf install akmod-nvidia
    ```
- **Restart**

## Apps installation

### Google Chrome

- Open the `Software app` then search for `Google Chrome` and install

### Visual Studio Code
 - Run the following commands
   ```sh
   sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
   sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
   sudo dnf check-update
   sudo dnf install -y code
   ```
- Turn on settings Sync
- Enable "Open in Code" context menu for Nautilus. [source](https://github.com/harry-cpp/code-nautilus)
  ```sh
  wget -qO- https://raw.githubusercontent.com/cra0zy/code-nautilus/master/install.sh | bash

  ```

### Vim

- Install Vim
    ```sh
    sudo dnf install -y vim
    ```
    - Copy the `.vim` folder and `.vimrc` file to the `Home` directory
    - Open any file with vim and run `PlugInstall`

### Java

- Install Java OpenJDK
    ```sh
    sudo dnf install -y java-latest-openjdk
    java -version
    ```

### Other apps via Flathub

- Geary email client
    ```sh
    flatpak install flathub org.gnome.Geary
    ```
- Discord
    ```sh
    flatpak install flathub com.discordapp.Discord
    ```
- Celluloid video player
    ```sh
    flatpak install flathub io.github.celluloid_player.Celluloid
    ```

- OnlyOffice office suite
    ```sh
    flatpak install flathub org.onlyoffice.desktopeditors
    ```

## Customization

### Cursor, icons and themes

- Install breeze cursors
    ```sh
    sudo dnf install -y breeze-cursor-theme
    ```
- Numix Circle Icons
    ```sh
    sudo dnf install -y numix-icon-theme-circle
    ```
- Themes: Copy the `.themes` folder into the `Home` folder

### Fonts

- Fira Sans
    ```sh
    sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'
    ```
- Meslo Nerd Font, download these four ttf files and double click on them:

    - [MesloLGS NF Regular.ttf](
        https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    - [MesloLGS NF Bold.ttf](
        https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    - [MesloLGS NF Italic.ttf](
        https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    - [MesloLGS NF Bold Italic.ttf](
        https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

### Gnome Tweaks

- Open the `Software app` then search for `Tweaks`, install and open.
- `Appearance:` 
    - Cursor: `Breeze_Snow`
    - Icons: `Numix-Circle`
- `Fonts:`
    - Interface Text: `Fira Sans Book 11`
    - Document Text: `Arial Regular 12`
    - Monospace Text: `MesloLGS NF Regular 10`
    - Legacy Window Tiles: `Fira Sans Semibold 11`
- `Top Bar:` 
    - Activities overview hot corner: Off
    - Battery percentage: On
- `Window Titlebars`: Maximize and Minimize On. Placement Right
- `Windows:` 
    - Center new windows: On
    - Resize with secondary-click: On

### Gnome Extensions

- Install Extensions app
    ```sh
    flatpak install flathub org.gnome.Extensions
    ```
- Disable extension version validation for Pop Shell
    ```sh
    gsettings set org.gnome.shell disable-extension-version-validation "true"
    ```
- Go to the [Gnome Extensions](https://extensions.gnome.org/) website and search and activate the following extensions
    - [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
        - Brightness 0.60, Sigma: 20, Uncheck panel
    - [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
    - [Color Picker](https://extensions.gnome.org/extension/3396/color-picker/)
    - [Tray Icons](https://extensions.gnome.org/extension/1503/tray-icons/)
    - [Dynamic Panel Transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)
    - [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)
    - [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
        - Disable search, Disable hotcorner, Set Workspace Switcher Size to 10%
    - [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
    - [Night Theme Switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher/)
        - `Schedule:` Uncheck automatic time source, Check Always show on-demand controls, Manual schedule from 9:00 to 20:00. Keyboard shortcut: `Shift+Ctrl+Super+T`. Button location `None`
        - `GTK Theme:` Check Manual variants. Day variant: `Nordic-Polar`. Night variant: `TokyoNight`
        - `Shell Theme:` Check Manual variants. Day variant: `Nordic-Polar`. Night variant: `TokyoNight`
        - `Backgrounds:` Check Switch Backgrounds and select day and night background
    - [Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/)
    - [Screenshot Tool](https://extensions.gnome.org/extension/1112/screenshot-tool/)
        - Auto-Copy to Clipboard: Imgage Data. 
        - Default Filename: `{N}-{Y}{m}{d}-{w}x{h}`. 
        - Keybindings Select Area: `Shift+Super+S`
    - [Pop Shell](https://github.com/pop-os/shell) (system may crash when activated for the first time)
        ```sh
        sudo dnf install gnome-shell-extension-pop-shell
        ```
        - Check Show active hint. Hint color is `#7AA2F6`

### Keyboard Shortcuts

Open `Settings` and go to `Keyboard` -> `Keyboard shortcuts`

- Accesibility
    - Turn zoom on or off: `Alt+Super+=`
    - Zoom in: `Shift+Alt+Super++`
- Launchers
    - Launch calculator: `Super+C`
    - Launch settings: `Super+S`
- Navigate applications and windows
    - Launch and switch applications: `Super+Space`
- Navigation
    - Hide all normal windows: `Super+D`
    - Move to workspace on the left: `Ctrl+Super+Left`
    - Move to workspace on the right: `Ctrl+Super+Right`
    - Move window one workspace to the left: `Shift+Super+Left`
    - Move window one workspace to the right: `Shift+Super+Right`

### Pywal

- Install [Piwal](https://github.com/dylanaraps/pywal)
    ```sh
    sudo pip3 install pywal
    ```
- Generate any theme
    ```sh
    cd ~/Pictures/Wallpapers
    wal -i "yourWallpaper"
    ```
- Copy the files `colors` and `colors.json` into `~/.cache/wal/` and then:
    ```sh
    wal -R
    ```

### Terminal colors

- Run the following command to start [Gogh](https://mayccoll.github.io/Gogh/)
    ```sh
    bash -c  "$(curl -sLo- https://git.io/vQgMr)" 
    ```
    - Themes to install: **42 53 132 140 141 197**

Terminal colors based on the *Flat Remix* color scheme.

### Shell

- Install ZSH and set as default shell
    ```sh
    sudo dnf install -y zsh
    sudo chsh -s $(which zsh)
    echo $SHELL
    # The trailing should change from $ to %
    ```

- Install [Oh My Zsh](https://ohmyz.sh/#install)
    ```sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
- Install plugin [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) 
    ```sh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
- Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme
    ```sh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
- Replace the files `.p10k.zsh` and `.zshrc` into the `Home` folder

## Extras

### Git configurations

```sh
git config --global init.defaultBranch main
git config --global core.editor "vim"
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### Install OpenSSL

- GSConnect requires to install OpenSSL to work
    ```sh
    sudo dnf install openssl
    ```


### rEFInd

- Download the most recent version of [refind](https://sourceforge.net/projects/refind/files/) and then install:
  ```sh
  sudo rpm -Uvh refind-0.13.2-1.x86_64.rpm
  sudo refind-install
  ```
- Install [rEFInd theme Regular](https://github.com/bobafetthotmail/refind-theme-regular#refind-theme-regular)
  ```sh
  sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"
  ```
  
### Fix dualboot showing different times
    ```sh
    timedatectl set-local-rtc 1
    ```

### Gedit Nord theme

- Copy the `nord.xml` file into `~/.local/share/gedit/styles`

### Theme Flatpak apps

- This command makes flatpak apps to use the application's theme
    ```sh
    sudo flatpak override --filesystem=~/.themes
    ```

### Enable color folders

- Enable color folders for nautilus file manager
    ```sh
    sudo dnf copr enable kleong/folder-color
    sudo dnf install folder-color-common folder-color-nautilus
    ```

### XAMPP
- Download and install from the [official website](https://www.apachefriends.org/download.html)
- Install missing dependency *libnsl*
    ```sh
    sudo dnf install -y libnsl
    ```
