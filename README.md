# 🧰 Système, Scripts et Sécurité

> Un voyage à travers les commandes, scripts et interactions avancées — La Plateforme

---

## 📋 Présentation

Ce projet a été réalisé dans le cadre de la formation **Bachelor IT Cybersécurité** à **La Plateforme**.  
Il regroupe l'ensemble des exercices pratiques autour de l'administration système Linux, du scripting Shell et Python, ainsi que de la sécurisation des scripts et des interactions avec des API Web.

Le rendu principal est le fichier **`revision_systeme.pdf`** qui documente chaque étape, les commandes utilisées et leur fonctionnement.

---

## 🗂️ Contenu du projet

| Exercice | Description |
|----------|-------------|
| 🖥️ Création d'une VM Debian | Installation et configuration d'une machine virtuelle Debian avec interface graphique |
| 🔍 Commandes de recherche avancée | Utilisation de `find`, `grep` pour localiser des fichiers dans l'arborescence |
| 📦 Compression / Décompression | Archivage avec `tar` et `gzip`, exploration des différentes options |
| ✂️ Manipulation de texte | Création d'un fichier CSV via Python et extraction de données avec `awk` |
| ⚙️ Gestion des processus | Recensement, arrêt normal et forcé des processus système |
| 📊 Surveillance des ressources | Monitoring CPU / mémoire en temps réel, export CSV |
| 🔄 Scripting avancé | Script Shell de sauvegarde automatique avec gestion de l'historique |
| 🔧 Automatisation des mises à jour | Script de détection et installation des mises à jour logicielles |
| 📦 Gestion des dépendances | Script d'installation d'une stack web complète (Apache, MySQL, Node.js, Git...) |
| 🔒 Sécurisation des scripts | Identification des risques et sécurisation des scripts développés |
| 🌐 Utilisation d'API Web | Script Shell consommant une API Web avec gestion des erreurs et logging |

---

## 🛠️ Technologies utilisées

- **OS** : Debian Linux
- **Shell** : Bash
- **Langages** : Python 3
- **Outils** : `find`, `grep`, `awk`, `tar`, `gzip`, `curl`, `ps`, `kill`
- **Stack web** : Apache / Nginx, MySQL / MariaDB, phpMyAdmin, Node.js, Git

---

## 📁 Structure du dépôt

```
SystemeScriptSecurite/
├── revision_systeme.pdf       # Document de rendu principal (20 pages)
├── scripts/
│   ├── create_csv.py          # Python — création de personnes.csv
│   ├── surveillance.sh        # Shell — collecte périodique CPU / mémoire vers ressources.csv
│   ├── sauvegarde.sh          # Shell — sauvegarde automatique, historique et rotation
│   ├── mises_a_jour.sh        # Shell — mise à jour interactive du système
│   ├── install_deps.sh        # Shell — installation d'une stack web
│   └── api_meteo.sh           # Shell — appel API Open-Meteo, journalisation, gestion d'erreurs
└── README.md
```

> ℹ️ Les sources d'origine des scripts n'ont pas été conservées : ils ont été **reconstitués à partir de la documentation de `revision_systeme.pdf`**, puis testés.

---

## 🚀 Utilisation

Se placer dans le dossier du dépôt, puis lancer les scripts depuis `scripts/`.

### Création du CSV et extraction avec awk
```bash
python3 scripts/create_csv.py
awk -F',' 'NR>1 {print $3}' personnes.csv      # affiche les villes
```

### Surveillance des ressources
```bash
./scripts/surveillance.sh      # 5 mesures, une toutes les 2 s, écrites dans ressources.csv
```

### Sauvegarde automatique
```bash
./scripts/sauvegarde.sh                  # sauvegarde ~/Documents/Plateforme
./scripts/sauvegarde.sh /chemin/dossier  # ou un autre dossier
```
Les archives sont créées dans `~/sauvegardes/` (horodatées), le résultat est ajouté à `historique.log`, et seules les **5 dernières** sauvegardes sont conservées.

### Mises à jour logicielles
```bash
./scripts/mises_a_jour.sh      # demande confirmation avant d'installer (o/n)
```

### Installation des dépendances web
```bash
sudo ./scripts/install_deps.sh   # Apache, phpMyAdmin, MariaDB, Node.js, npm, Git ; journal : install.log
```

### Appel API Web (Open-Meteo)
```bash
./scripts/api_meteo.sh           # température actuelle à Paris ; requêtes et réponses dans api.log
```

---

## 🧠 Compétences démontrées

- **Administration Linux (Debian)** : installation d'une VM, gestion des processus (arrêt normal et forcé), surveillance CPU / mémoire en temps réel avec export CSV.
- **Ligne de commande** : recherche avancée (`find`, `grep`), archivage (`tar`, `gzip`), traitement de texte (`awk`).
- **Scripting Shell et Python** : sauvegarde automatique avec historique, détection et installation des mises à jour, installation d'une stack web complète, génération d'un fichier CSV.
- **Sécurisation des scripts** : identification des risques et durcissement des scripts développés.
- **API Web** : script Shell consommant une API avec gestion des erreurs et journalisation.
- **Documentation** : rendu détaillé dans `revision_systeme.pdf`.

### 🎯 Compétences du référentiel visées

- Administrer et sécuriser les infrastructures systèmes
- Mettre en œuvre et optimiser la supervision des infrastructures
- Participer à la détection et au traitement des incidents de sécurité

---

## 👤 Auteur

**Alexis Noiret**  
Bachelor IT Cybersécurité — La Plateforme  
[github.com/alexis-noiret](https://github.com/alexis-noiret)
