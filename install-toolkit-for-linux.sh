#!/bin/bash

# Function to display messages
function print_message {
    echo "==========================================="
    echo "$1"
    echo "==========================================="
}

# Function to check if a command is installed
function is_installed {
    command -v "$1" >/dev/null 2>&1

    if [ -f "/usr/bin/$1" ] || [ -f "/usr/local/bin/$1" ]; then
        return 0
    else
        return 1
    fi
}

# Pastikan hanya dijalankan di Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Script ini hanya untuk Linux. Sistem operasi Anda tidak didukung."
    exit 1
fi

# Memperbarui daftar paket
print_message "Memperbarui daftar paket untuk Linux..."
sudo apt update -y

# Deleting command using apt
print_message "Remove cmake, libpcap-dev..."
sudo apt remove cmake -y
sudo apt remove -y libpcap-dev
sudo apt remove ffuf -y
sudo rm -rf /usr/local/go
cd ~/

# Menginstal CMake dan libpcap
if ! is_installed cmake; then
    print_message "Menginstal CMake..."
    sudo apt install cmake -y
else
    print_message "CMake sudah terinstal."
fi

if ! is_installed libpcap-dev; then
    print_message "Menginstal libpcap..."
    sudo apt install libpcap-dev -y
else
    print_message "libpcap sudah terinstal."
fi

# Menginstal Python 3.11
if ! is_installed "python$python_version"; then
    print_message "Menginstal Python $python_version..."
    sudo apt install python3.13 -y
    python3.13 -m pip install --upgrade pip
else
    print_message "Python $python_version sudah terinstal."
fi

# Creating folder for bug bounty tools
print_message "Creating BUG_BOUNTY_TOOLS directory..."
mkdir -p ~/BUG_BOUNTY_TOOLS
cd ~/BUG_BOUNTY_TOOLS

# Installing Golang
if ! is_installed go; then
    print_message "Installing Golang..."
    sudo apt install golang-go -y
else
    print_message "Golang is already installed."
fi

# Installing Golang tools
print_message "Installing Golang tools..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Copying Go tools to /usr/local/bin
print_message "Copying Go tools to /usr/local/bin..."
cd /usr/local/bin
sudo rm -f subfinder assetfinder shosubgo github-subdomains chaos ffuf gobuster naabu gau waybackurls katana hakrawler gf qsreplace httpx httprobe anew unfurl subzy freq kxss xsschecker arjun dirhunt urldedupe lucek rustscan crtsh 
sudo apt autoremove -y
cd ~/go/bin
sudo cp * /usr/local/bin/

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing CRTSH
if ! is_installed crtsh; then
    print_message "Installing CRTSH..."
    git clone https://github.com/YashGoti/crtsh.py.git
    cd crtsh.py
    mv crtsh.py crtsh
    chmod +x crtsh
    sudo cp crtsh /usr/local/bin/
else
    print_message "CRTSH is already installed."
fi

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing Dirsearch
if ! is_installed dirsearch; then
    print_message "Installing Dirsearch..."
    sudo python3.13 -m pip install dirsearch --break-system-packages
else
    print_message "Dirsearch is already installed."
fi

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing Arjun
print_message "Installing Arjun..."
git clone https://github.com/s0md3v/Arjun.git
cd Arjun
sudo python3.13 -m pip install . --break-system-packages

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing Dirhunt
print_message "Installing Dirhunt..."
sudo python3.13 -m pip install dirhunt --break-system-packages --ignore-installed click

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing Bhedak
sudo python3.13 -m pip install bhedak --break-system-packages

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Download .gau.toml
print_message "Downloading .gau.toml..."
wget https://raw.githubusercontent.com/lc/gau/refs/heads/master/.gau.toml
mv .gau.toml ~/

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing ParamsPider
if ! is_installed paramspider; then
    print_message "Installing ParamsPider..."
    git clone https://github.com/devanshbatham/paramspider
    cd paramspider
    sudo python3.13 -m pip install . --break-system-packages
else
    print_message "ParamsPider is already installed."
fi

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing URLDedupe
if ! is_installed urldedupe; then
    print_message "Installing URLDedupe..."
    git clone https://github.com/ameenmaali/urldedupe.git
    cd urldedupe
    cmake CMakeLists.txt
    make
    sudo cp urldedupe /usr/local/bin
else
    print_message "URLDedupe is already installed."
fi

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing LUcek
if ! is_installed LUcek; then
    print_message "Installing LUcek..."
    git clone https://github.com/rootbakar/LUcek.git
    cd LUcek
    bash requirement-mac.sh
    sudo cp lucek.py /usr/local/bin/lucek
else
    print_message "LUcek is already installed."
fi

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

# Installing RustScan
if ! is_installed rustscan; then
    print_message "Installing RustScan..."
    wget https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan-2.3.0-x86_64-linux.zip
    unzip rustscan-2.3.0-x86_64-linux.zip
    cd tmp
    cd rustscan-2.3.0-x86_64-linux
    sudo cp rustscan /usr/local/bin/
    sudo rm -f rustscan-2.3.0-x86_64-linux.zip
else
    print_message "RustScan is already installed."
fi

go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
cd ~/go/bin
sudo cp nuclei /usr/local/bin

# Returning to BUG_BOUNTY_TOOLS directory
cd ~/BUG_BOUNTY_TOOLS

print_message "All bug bounty toolkit have been successfully installed."
