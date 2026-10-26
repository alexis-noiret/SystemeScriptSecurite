#!/bin/bash
# surveillance.sh — collecte périodique des ressources système dans ressources.csv
# Colonnes : Timestamp, CPU(%), Mem_Total(MB), Mem_Used(MB), Mem_Libre(MB)

FICHIER="ressources.csv"
NB_MESURES=5
INTERVALLE=2

echo "Timestamp,CPU(%),Mem_Total(MB),Mem_Used(MB),Mem_Libre(MB)" > "$FICHIER"

for i in $(seq 1 "$NB_MESURES"); do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    # CPU utilisé = 100 - %idle (top en mode batch, non interactif)
    # LC_ALL=C : séparateur décimal en point, quelle que soit la langue du système
    CPU=$(LC_ALL=C top -bn1 | grep "Cpu(s)" | sed 's/.*[ ,]\([0-9.]*\) id.*/\1/' | awk '{printf "%.2f", 100 - $1}')
    [ -z "$CPU" ] && CPU="N/A"

    # Mémoire en Mo : 2e ligne de "free -m" (total, utilisé, libre)
    MEM=$(free -m | awk 'NR==2 {print $2","$3","$4}')

    echo "$TIMESTAMP,$CPU,$MEM" >> "$FICHIER"

    # Pas d'attente après la dernière mesure
    [ "$i" -lt "$NB_MESURES" ] && sleep "$INTERVALLE"
done

echo "Mesures enregistrées dans $FICHIER"
