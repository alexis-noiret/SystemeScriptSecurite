#!/bin/bash
# mises_a_jour.sh — mise à jour interactive du système (Debian)

echo "Mise à jour de la liste des paquets..."
sudo apt update

# Nombre de paquets pouvant être mis à jour
NB=$(apt list --upgradable 2>/dev/null | grep -c upgradable)

if [ "$NB" -gt 0 ]; then
    echo "$NB mise(s) à jour disponible(s)."
    read -r -p "Installer les mises à jour ? (o/n) " REPONSE

    if [ "$REPONSE" = "o" ] || [ "$REPONSE" = "O" ]; then
        sudo apt upgrade -y
        echo "Mises à jour installées."
    else
        echo "Mise à jour annulée."
    fi
else
    echo "Le système est déjà à jour."
fi
