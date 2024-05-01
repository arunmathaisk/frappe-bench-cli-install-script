#!/bin/bash

# Install Git, Python 3, Python 3 development tools, Pip3, and Redis
sudo apt update
sudo apt install -y git python3-dev python3-pip redis-server

# Install MariaDB (for Ubuntu 20.04 and later)
sudo apt install -y mariadb-server mariadb-client

# Secure MariaDB installation
sudo mysql_secure_installation

# Install MariaDB development files
sudo apt-get install -y mariadb-client

# Configure MariaDB for UTF-8
echo "[mysqld]" | sudo tee -a /etc/mysql/my.cnf
echo "character-set-client-handshake = FALSE" | sudo tee -a /etc/mysql/my.cnf
echo "character-set-server = utf8mb4" | sudo tee -a /etc/mysql/my.cnf
echo "collation-server = utf8mb4_unicode_ci" | sudo tee -a /etc/mysql/my.cnf
echo "[mysql]" | sudo tee -a /etc/mysql/my.cnf
echo "default-character-set = utf8mb4" | sudo tee -a /etc/mysql/my.cnf

# Restart MySQL service
sudo service mysql restart

# Install Node.js version 18 using nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 18

# Verify Node.js installation
node -v

# Install Yarn using npm
npm install -g yarn

# Install wkhtmltopdf
sudo apt-get install -y xvfb libfontconfig wkhtmltopdf

# Install Bench CLI via pip3
pip3 install frappe-bench

echo "Installation completed successfully!"

