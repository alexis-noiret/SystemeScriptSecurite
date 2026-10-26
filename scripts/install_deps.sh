#!/bin/bash
# install_deps.sh — installation d'une stack web : Apache, phpMyAdmin, MariaDB, Node.js, npm, Git
# Chaque installation est journalisée dans install.log (affichage ET écriture avec tee -a).
# Usage : sudo ./install_deps.sh

LOG="install.log"

# sudo n'est nécessaire que si on n'est pas déjà root
SUDO=""
[ "$(id -u)" -ne 0 ] && SUDO="sudo"

# Évite les questions interactives de debconf (phpMyAdmin en pose)
export DEBIAN_FRONTEND=noninteractive

# Installe un paquet et journalise le résultat
installer() {
    local paquet="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') Installation de $paquet..." | tee -a "$LOG"

    $SUDO apt-get install -y "$paquet" 2>&1 | tee -a "$LOG"

    # PIPESTATUS[0] = code retour d'apt-get (et non celui de tee)
    if [ "${PIPESTATUS[0]}" -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') OK     $paquet" | tee -a "$LOG"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') ERREUR $paquet" | tee -a "$LOG"
    fi
}

echo "=== Mise à jour de la liste des paquets ===" | tee -a "$LOG"
$SUDO apt-get update 2>&1 | tee -a "$LOG"

for paquet in apache2 phpmyadmin mariadb-server nodejs npm git; do
    installer "$paquet"
done

# afficher_version NOM COMMANDE [ARGUMENTS...]
afficher_version() {
    local nom="$1"
    shift
    if command -v "$1" > /dev/null 2>&1; then
        echo "$nom : $("$@" 2>&1 | head -n 1)"
    else
        echo "$nom : non installé"
    fi
}

echo "=== Versions installées ===" | tee -a "$LOG"
{
    afficher_version apache2 apache2 -v
    afficher_version mysql mysql --version
    afficher_version node node -v
    afficher_version npm npm -v
    afficher_version git git --version
} | tee -a "$LOG"
