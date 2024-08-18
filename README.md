# Fedora post installation configurations

Set of commands and files to make a fresh install of Fedora Workstation look nice. By [Alan Delgado](https://github.com/Alan7A).

Preview
![Ultrawide2](/Screenshots/Ultrawide2.png)
![Ultrawide](/Screenshots/Ultrawide.png)

## Table of contents

- [Initial settings](#initial-settings)
  - [Enable DNF fastest mirror and update](#enable-dnf-fastest-mirror-and-update)
  - [Settings app](#settings-app)
- [Software Sources](#software-sources)
  - [Enable third party repositories](#enable-third-party-repositories)
  - [Enable rpm-fusion](#enable-rpm-fusion)
  - [Enable flathub](#enable-flathub)
- [NVIDIA Drivers](#nvidia-drivers)
- [Apps installation](#apps-installation)
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

## NVIDIA Drivers

**It is extremely IMPORTANT to restart and select GNOME Xorg in the login screen**

- Download and install NVIDIA drivers:
  ```sh
  sudo dnf install akmod-nvidia
  ```
- **Restart**

## Apps installation

### Kitty terminal

- Install kitty terminal
  ```sh
  sudo dnf install -y kitty
  ```
- Copy the `kitty.conf` file into the `~/.config/kitty` folder

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

### Other apps

- Solaar (Logitech mouse compatibility)
  ```sh
  sudo dnf install solaar
  ```

### Flathub apps

- Google Chrome
  ```sh
  flatpak install flathub com.google.Chrome
  ```
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
- Pinta
  ```sh
  flatpak install flathub com.github.PintaProject.Pinta
  ```
- Microsoft Edge
  ```sh
  flatpak install flathub com.microsoft.Edge
  ```
- Resources
  ```sh
  flatpak install flathub net.nokyan.Resources
  ```
- Mission center
  ```sh
  flatpak install flathub io.missioncenter.MissionCenter
  ```
- Flatseal
  ```sh
  flatpak install flathub com.github.tchx84.Flatseal
  ```
- Easy Effects
  ```sh
  flatpak install flathub com.github.wwmm.easyeffects
  ```
- Obsidian
  ```sh
  flatpak install flathub md.obsidian.Obsidian
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

  - [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
  - [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
  - [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
  - [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

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
    - Brightness 0.60, Sigma: 20, Blur apps: nautilus, terminal, code, discord
  - [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
  - [Color Picker](https://extensions.gnome.org/extension/3396/color-picker/)
  - [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)
    Send to device from nautilus
    ```sh
    sudo dnf install -y nautilus-python nautilus-extensions
    ```
  - [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
    - Disable search, Disable hotcorner, Set Workspace Switcher Size to 10%
  - [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
  - [Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/)
  - [Tray Icons Realoaded](https://extensions.gnome.org/extension/2890/tray-icons-reloaded/)
  - [Pop Shell](https://github.com/pop-os/shell) (system may crash when activated for the first time)
    ```sh
    sudo dnf install gnome-shell-extension-pop-shell xprop
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
- Navigation
  - Hide all normal windows: `Super+D`
  - Move to workspace on the left: `Ctrl+Super+Left`
  - Move to workspace on the right: `Ctrl+Super+Right`
  - Move window one workspace to the left: `Shift+Super+Left`
  - Move window one workspace to the right: `Shift+Super+Right`
- Custom shortcuts
  - Launch terminal: `Super+T` - Code: `kitty`
  - Launch vscode: `Super+V` - Code: `code`
  - Launch discord: `Super+W` - Code: `flatpak run com.discordapp.Discord`
  - Launch gnome text editor: `Super+G` - Code: `gnome-text-editor`
- Tiling
  - Toggles a window between floating and tiling: `Super+H`
- Navigate applications and windows
  - Launch and switch applications: `Super+Space`
  - Switch focus to window left: `Super+Left`

### Terminal colors

- Run the following command to start [Gogh](https://mayccoll.github.io/Gogh/)
  ```sh
  bash -c  "$(curl -sLo- https://git.io/vQgMr)"
  ```

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
- Install plugin [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  ```sh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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

### Fix login screen in wrong monitor

```sh
sudo cp -v ~/.config/monitors.xml /var/lib/gdm/.config/
sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml
```

### Fix bluetooth devices in dualboot

- Follow this [guide](https://github.com/spxak1/weywot/blob/main/guides/bt_dualboot.md)

### Fix postman crashing after login

```sh
openssl req -subj '/C=US/CN=Postman Proxy' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout ~/.var/app/com.getpostman.Postman/config/Postman/proxy/postman-proxy-ca.key -out ~/.var/app/com.getpostman.Postman/config/Postman/proxy/postman-proxy-ca.crt
```

### Gnome Text Editor theme

- Download the [Tokyo Night Theme](https://www.gnome-look.org/p/1997072) and extract the files
- Open the terminal and run the command: `sudo nautilus`
- Go to the following path: /usr/share/gnome-text-editor/styles, then cut and paste the themes files into the folder 'styles'.

### Theme Flatpak apps

- This command makes flatpak apps to use the application's theme
  ```sh
  sudo flatpak override --filesystem=~/.themes
  ```
- Or you can use [stylepak](https://github.com/refi64/stylepak)

### Install Betteriscord

- This command makes flatpak apps to use the application's theme
  ```sh
  curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
  chmod +x betterdiscordctl
  sudo mv betterdiscordctl /usr/local/bin
  betterdiscordctl --d-install flatpak install | uninstall
  ```

### Enable color folders

- Enable color folders for nautilus file manager
  ```sh
  sudo dnf copr enable kleong/folder-color
  sudo dnf install folder-color
  ```

### XAMPP

- Download and install from the [official website](https://www.apachefriends.org/download.html)
- Install missing dependency _libnsl_
  ```sh
  sudo dnf install -y libnsl
  ```
