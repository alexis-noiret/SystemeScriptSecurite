#!/bin/bash
# sauvegarde.sh — sauvegarde automatique avec historique et rotation
# Archive SOURCE en .tar.gz horodaté, journalise le résultat et ne garde que les 5 dernières sauvegardes.

SOURCE="${1:-$HOME/Documents/Plateforme}"
BACKUP_DIR="$HOME/sauvegardes"
LOG_FILE="$BACKUP_DIR/historique.log"
NB_A_GARDER=5

if [ ! -d "$SOURCE" ]; then
    echo "Erreur : le dossier source '$SOURCE' n'existe pas." >&2
    exit 1
fi

# Crée le dossier de sauvegardes s'il n'existe pas déjà
mkdir -p "$BACKUP_DIR"

# Nom d'archive unique grâce à l'horodatage
ARCHIVE="$BACKUP_DIR/backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

# $? = code retour de tar (0 = succès)
if [ $? -eq 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') SUCCES  $ARCHIVE" >> "$LOG_FILE"
    echo "Sauvegarde créée : $ARCHIVE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') ECHEC   $SOURCE" >> "$LOG_FILE"
    echo "Erreur : la sauvegarde a échoué." >&2
    exit 1
fi

# Rotation : on garde uniquement les $NB_A_GARDER archives les plus récentes
cd "$BACKUP_DIR" || exit 1
ls -t backup_*.tar.gz 2>/dev/null | tail -n +$((NB_A_GARDER + 1)) | xargs -r rm --
