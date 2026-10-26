#!/bin/bash
# api_meteo.sh — température actuelle à Paris via l'API Open-Meteo (HTTPS, gratuite, sans clé)
# Chaque requête et chaque réponse sont horodatées dans api.log.
# Permissions conseillées : chmod 700 api_meteo.sh (seul le propriétaire peut l'exécuter)

# Arrêt dès la première erreur, variable non définie ou échec dans un pipe
set -euo pipefail

# Le journal ne doit être lisible que par son propriétaire
umask 077

API_URL="${API_URL:-https://api.open-meteo.com/v1/forecast?latitude=48.8566&longitude=2.3522&current_weather=true}"
LOG_FILE="api.log"

log() {
    # log NIVEAU message...
    local niveau="$1"
    shift
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$niveau] $*" >> "$LOG_FILE"
}

log "INFO" "Requête : $API_URL"

# --max-time 10 : abandon après 10 s ; -s silencieux ; -f échec sur code HTTP >= 400
REPONSE=$(curl -sf --max-time 10 "$API_URL") || {
    log "ERREUR" "API injoignable ou réponse invalide"
    echo "Erreur : l'API est injoignable (voir $LOG_FILE)." >&2
    exit 1
}

log "INFO" "Réponse : $REPONSE"

# Extraction de la température actuelle dans le JSON
TEMPERATURE=$(printf '%s' "$REPONSE" | python3 -c 'import sys, json; print(json.load(sys.stdin)["current_weather"]["temperature"])' 2>/dev/null) || {
    log "ERREUR" "JSON inattendu, température introuvable"
    echo "Erreur : réponse inattendue de l'API (voir $LOG_FILE)." >&2
    exit 1
}

log "INFO" "Température actuelle à Paris : ${TEMPERATURE}°C"
echo "Température actuelle à Paris : ${TEMPERATURE}°C"
