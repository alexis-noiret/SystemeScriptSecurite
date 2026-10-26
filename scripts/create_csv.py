#!/usr/bin/env python3
"""Crée le fichier personnes.csv (en-tête + 4 lignes de données).

Extraction des villes avec awk (3e champ, en ignorant l'en-tête) :
    awk -F',' 'NR>1 {print $3}' personnes.csv
"""
import csv

FICHIER = "personnes.csv"

LIGNES = [
    ["nom", "age", "ville"],
    ["Alice", 25, "Paris"],
    ["Bob", 30, "Lyon"],
    ["Claire", 28, "Marseille"],
    ["David", 35, "Toulouse"],
]

with open(FICHIER, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerows(LIGNES)

print(f"{FICHIER} créé ({len(LIGNES) - 1} lignes de données).")
