#/bin/bash
# Define variables
DOWNLOADS_PATH="$HOME/Downloads"

echo
echo *** installing stuff in the blue ***
echo *** but first some house cleaning ***
rpm-ostree override remove firefox firefox-langpacks toolbox gnome-tour openssh-server
echo
flatpak uninstall --noninteractive org.gnome.Characters org.gnome.Contacts org.gnome.Connections org.gnome.Cheese org.gnome.Weather org.gnome.baobab org.gnome.clocks org.gnome.Maps org.gnome.Calendar org.fedoraproject.MediaWriter org.gnome.Logs
echo
echo
rpm-ostree update
rpm-ostree install mpv neovim alacritty exa fish distrobox gnome-tweaks pop-shell neovim amd-gpu-firmware nvidia-gpu-firmware virt-install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer guestfs-tools libguestfs-tools python3-libguestfs virt-top libvirt-devel bridge-utils edk2-ovmf
echo
echo *** defining fish as default shell ***
sudo usermod -s /bin/fish $USERNAME
echo *** adding flathub
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
echo
echo *** installing flatpaks ***
flatpak install --user --noninteractive flathub org.gtk.Gtk3theme.Adwaita-dark
flatpak install --user --noninteractive flathub com.brave.Browser
flatpak install --user --noninteractive flathub com.mattjakeman.ExtensionManager
flatpak install --user --noninteractive flathub com.github.tchx84.Flatseal
flatpak install --user --noninteractive flathub org.videolan.VLC
flatpak install --user --noninteractive flathub org.remmina.Remmina
flatpak install --user --noninteractive flathub com.usebottles.bottles
flatpak install --user --noninteractive flathub com.visualstudio.code
flatpak install --user --noninteractive flathub com.microsoft.Edge
flatpak install --user --noninteractive flathub org.darktable.Darktable
flatpak install --user --noninteractive flathub md.obsidian.Obsidian
flatpak install --user --noninteractive flathub com.bitwarden.desktop
flatpak install --user --noninteractive flathub io.github.giantpinkrobots.flatsweep
flatpak install --user --noninteractive flathub flathub org.videolan.VLC
flatpak install --user --noninteractive flathub flathub org.nickvision.tubeconverter
flatpak install --user --noninteractive flathub flathub org.flameshot.Flameshot
flatpak install --user --noninteractive flathub flathub com.github.flxzt.rnote
echo
echo *** pcloud ***
cd "$DOWNLOADS_PATH"
wget https://p-lux2.pcloud.com/cBZp6tCiqZo18Wj77ZZZvK8HykZ2ZZpnXZkZ40JxVZKRZf7ZEFZd5ZBHZN5ZVFZsLZqpZ8RZ3pZnVZsJZvRZpL8AVZ8r5gRpv2snjod0iQflIN5B88zu3X/pcloud
echo *** creating some folders ***
mkdir $HOME/Applications/
mkdir -p $HOME/.config/alacritty/
mkdir -p $HOME/.config/fish/
echo
mv ./pcloud $HOME/Applications 
chmod u+x $HOME/Applications/pcloud
echo *** cloning my own git repo for this project ***
git clone https://github.com/tonybeyond/fedorablue.git
cd fedorablue/
cp ./alacritty.yml $HOME/.config/alacritty/
cp ./dracula.yml $HOME/.config/alacritty/
cp ./config.fish $HOME/.config/fish/
echo "Let's try to install nerd font from Github"
cd "$DOWNLOADS_PATH"
echo "Cloning repo from GitHub"
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts
echo "Installing with embedded script from the repo"
./install.sh
echo "done"
cd "$DOWNLOADS_PATH"
echo *** ***
echo "reboot with systemctl reboot"
