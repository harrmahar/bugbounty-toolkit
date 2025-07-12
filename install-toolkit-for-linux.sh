#!/bin/bash

# Function to display messages
function print_message {
    echo "==========================================="
    echo "$1"
    echo "==========================================="
}

# Function to check if a command is installed
function is_installed {
    command -v "$1" >/dev/null 2>&1 || [ -f "/usr/bin/$1" ] || [ -f "/usr/local/bin/$1" ]
}

# --- Dependency Installation ---
function install_dependencies {
    print_message "Checking and installing dependencies..."
    
    # Update package list
    sudo apt update -y

    # Install essential build tools
    sudo apt install -y build-essential

    # Install Git
    if ! is_installed git; then
        print_message "Installing Git..."
        sudo apt install git -y
    else
        print_message "Git is already installed."
    fi

    # Install CMake and libpcap
    if ! is_installed cmake; then
        print_message "Installing CMake..."
        sudo apt install cmake -y
    else
        print_message "CMake is already installed."
    fi

    if ! dpkg -s libpcap-dev &>/dev/null; then
        print_message "Installing libpcap-dev..."
        sudo apt install libpcap-dev -y
    else
        print_message "libpcap-dev is already installed."
    fi

    # Install Python and pip
    if ! is_installed python3; then
        print_message "Installing Python 3..."
        sudo apt install python3 -y
    else
        print_message "Python 3 is already installed."
    fi

    if ! is_installed pip3; then
        print_message "Installing pip3..."
        sudo apt install python3-pip -y
    else
        print_message "pip3 is already installed."
    fi

    # Install Golang
    if ! is_installed go; then
        print_message "Installing Golang..."
        sudo apt install golang-go -y
    else
        print_message "Golang is already installed."
    fi
    
    # Install Unzip
    if ! is_installed unzip; then
        print_message "Installing unzip..."
        sudo apt install unzip -y
    else
        print_message "unzip is already installed."
    fi
}

# --- Tool Installation Functions ---

function install_subfinder {
    print_message "Installing Subfinder..."
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    sudo cp ~/go/bin/subfinder /usr/local/bin/
}

function install_assetfinder {
    print_message "Installing Assetfinder..."
    go install -v github.com/tomnomnom/assetfinder@latest
    sudo cp ~/go/bin/assetfinder /usr/local/bin/
}

function install_shosubgo {
    print_message "Installing Shosubgo..."
    go install -v github.com/incogbyte/shosubgo@latest
    sudo cp ~/go/bin/shosubgo /usr/local/bin/
}

function install_github-subdomains {
    print_message "Installing Github-Subdomains..."
    go install -v github.com/gwen001/github-subdomains@latest
    sudo cp ~/go/bin/github-subdomains /usr/local/bin/
}

function install_chaos-client {
    print_message "Installing Chaos Client..."
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
    sudo cp ~/go/bin/chaos /usr/local/bin/
}

function install_ffuf {
    print_message "Installing FFUF..."
    go install -v github.com/ffuf/ffuf/v2@latest
    sudo cp ~/go/bin/ffuf /usr/local/bin/
}

function install_gobuster {
    print_message "Installing Gobuster..."
    go install -v github.com/OJ/gobuster/v3@latest
    sudo cp ~/go/bin/gobuster /usr/local/bin/
}

function install_naabu {
    print_message "Installing Naabu..."
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    sudo cp ~/go/bin/naabu /usr/local/bin/
}

function install_gau {
    print_message "Installing GAU..."
    go install -v github.com/lc/gau/v2/cmd/gau@latest
    sudo cp ~/go/bin/gau /usr/local/bin/
    print_message "Downloading .gau.toml..."
    wget -q https://raw.githubusercontent.com/lc/gau/refs/heads/master/.gau.toml -O ~/.gau.toml
}

function install_waybackurls {
    print_message "Installing Waybackurls..."
    go install -v github.com/tomnomnom/waybackurls@latest
    sudo cp ~/go/bin/waybackurls /usr/local/bin/
}

function install_katana {
    print_message "Installing Katana..."
    go install -v github.com/projectdiscovery/katana/cmd/katana@latest
    sudo cp ~/go/bin/katana /usr/local/bin/
}

function install_hakrawler {
    print_message "Installing Hakrawler..."
    go install -v github.com/hakluke/hakrawler@latest
    sudo cp ~/go/bin/hakrawler /usr/local/bin/
}

function install_gf {
    print_message "Installing GF..."
    go install -v github.com/tomnomnom/gf@latest
    sudo cp ~/go/bin/gf /usr/local/bin/
}

function install_qsreplace {
    print_message "Installing QSReplace..."
    go install -v github.com/tomnomnom/qsreplace@latest
    sudo cp ~/go/bin/qsreplace /usr/local/bin/
}

function install_httpx {
    print_message "Installing Httpx..."
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    sudo cp ~/go/bin/httpx /usr/local/bin/
}

function install_httprobe {
    print_message "Installing Httprobe..."
    go install -v github.com/tomnomnom/httprobe@latest
    sudo cp ~/go/bin/httprobe /usr/local/bin/
}

function install_anew {
    print_message "Installing Anew..."
    go install -v github.com/tomnomnom/anew@latest
    sudo cp ~/go/bin/anew /usr/local/bin/
}

function install_unfurl {
    print_message "Installing Unfurl..."
    go install -v github.com/tomnomnom/unfurl@latest
    sudo cp ~/go/bin/unfurl /usr/local/bin/
}

function install_subzy {
    print_message "Installing Subzy..."
    go install -v github.com/PentestPad/subzy@latest
    sudo cp ~/go/bin/subzy /usr/local/bin/
}

function install_freq {
    print_message "Installing Freq..."
    go install -v github.com/takshal/freq@latest
    sudo cp ~/go/bin/freq /usr/local/bin/
}

function install_kxss {
    print_message "Installing Kxss..."
    go install -v github.com/Emoe/kxss@latest
    sudo cp ~/go/bin/kxss /usr/local/bin/
}

function install_xsschecker {
    print_message "Installing XSSChecker..."
    go install -v github.com/rix4uni/xsschecker@latest
    sudo cp ~/go/bin/xsschecker /usr/local/bin/
}

function install_crtsh {
    print_message "Installing CRTSH..."
    git clone https://github.com/YashGoti/crtsh.py.git
    cd crtsh.py
    mv crtsh.py crtsh
    chmod +x crtsh
    sudo cp crtsh /usr/local/bin/
    cd ..
    rm -rf crtsh.py
}

function install_dirsearch {
    print_message "Installing Dirsearch..."
    apt install dirsearch
}

function install_arjun {
    print_message "Installing Arjun..."
    git clone https://github.com/s0md3v/Arjun.git
    cd Arjun
    pip3 install . --break-system-packages
    cd ..
    rm -rf Arjun
}

function install_dirhunt {
    print_message "Installing Dirhunt..."
    pip3 install dirhunt --break-system-packages --ignore-installed click
}

function install_bhedak {
    print_message "Installing Bhedak..."
    pip3 install bhedak --break-system-packages
}

function install_paramspider {
    print_message "Installing Paramspider..."
    git clone https://github.com/devanshbatham/paramspider
    cd paramspider
    pip3 install . --break-system-packages
    cd ..
    rm -rf paramspider
}

function install_urldedupe {
    print_message "Installing URLDedupe..."
    git clone https://github.com/ameenmaali/urldedupe.git
    cd urldedupe
    cmake CMakeLists.txt
    make
    sudo cp urldedupe /usr/local/bin
    cd ..
    rm -rf urldedupe
}

function install_lucek {
    print_message "Installing LUcek..."
    git clone https://github.com/rootbakar/LUcek.git
    cd LUcek
    # Assuming bash requirement-mac.sh is a mistake and should be for linux
    # If there is a requirement-linux.sh, it should be used.
    # For now, we will just copy the file as the original script did.
    sudo cp lucek.py /usr/local/bin/lucek
    cd ..
    rm -rf LUcek
}

function install_rustscan {
    print_message "Installing RustScan..."
    wget -q https://github.com/RustScan/RustScan/releases/download/2.3.0/rustscan-2.3.0-x86_64-linux.zip
    unzip -q rustscan-2.3.0-x86_64-linux.zip
    sudo cp rustscan-2.3.0-x86_64-linux/rustscan /usr/local/bin/
    rm -rf rustscan-2.3.0-x86_64-linux.zip rustscan-2.3.0-x86_64-linux
}

function install_nuclei {
    print_message "Installing Nuclei..."
    go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    sudo cp ~/go/bin/nuclei /usr/local/bin/
}


# --- Main Menu and Logic ---

function main_menu {
    tools=(
        "subfinder" "assetfinder" "shosubgo" "github-subdomains" "chaos-client"
        "ffuf" "gobuster" "naabu" "gau" "waybackurls" "katana" "hakrawler" "gf"
        "qsreplace" "httpx" "httprobe" "anew" "unfurl" "subzy" "freq" "kxss"
        "xsschecker" "crtsh" "dirsearch" "arjun" "dirhunt" "bhedak"
        "paramspider" "urldedupe" "lucek" "rustscan" "nuclei"
    )

    while true; do
        clear
        print_message "Bug Bounty Toolkit Installer"
        echo "Please choose which tools to install:"
        
        # Display tools in two columns
        for i in $(seq 0 $((${#tools[@]} - 1))); do
            printf "%2d) %-20s" $((i+1)) "${tools[$i]}"
            if [ $(( (i+1) % 2 )) -eq 0 ]; then
                echo
            fi
        done
        echo
        
        echo
        echo "all) Install all tools"
        echo "q)   Quit"
        echo

        read -p "Enter your choice (number, name, 'all', or 'q'): " choice

        case "$choice" in
            q|Q)
                print_message "Exiting."
                exit 0
                ;;
            all|ALL)
                install_all_tools
                ;;
            *)
                install_selected_tool "$choice"
                ;;
        esac
        read -p "Press Enter to continue..."
    done
}

function install_all_tools {
    print_message "Installing all tools..."
    for tool in "${tools[@]}"; do
        install_tool "$tool"
    done
    print_message "All tools have been installed."
}

function install_selected_tool {
    local choice=$1
    local tool_name=""

    # Check if the choice is a number
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le ${#tools[@]} ]; then
        tool_name=${tools[$((choice-1))]}
    else
        # Check if the choice is a valid tool name
        for t in "${tools[@]}"; do
            if [ "$t" == "$choice" ]; then
                tool_name=$t
                break
            fi
        done
    fi

    if [ -n "$tool_name" ]; then
        install_tool "$tool_name"
    else
        echo "Invalid choice. Please try again."
    fi
}

function install_tool {
    local tool_name=$1
    if is_installed "$tool_name"; then
        print_message "$tool_name is already installed."
    else
        "install_$tool_name"
    fi
}


# --- Script Execution ---

# Ensure the script is run as root
# if [[ $EUID -ne 0 ]]; then
#    echo "This script must be run as root" 
#    exit 1
# fi

# Create tools directory
mkdir -p ~/BUG_BOUNTY_TOOLS
cd ~/BUG_BOUNTY_TOOLS

install_dependencies
main_menu
