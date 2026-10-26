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
├── revision_systeme.pdf       # Document de rendu principal
├── scripts/
│   ├── create_csv.py          # Script Python — création du fichier CSV
│   ├── backup.sh              # Script Shell — sauvegarde automatique
│   ├── update.sh              # Script Shell — mises à jour logicielles
│   ├── install_deps.sh        # Script Shell — installation dépendances web
│   └── api_request.sh         # Script Shell — appel API Web sécurisé
└── README.md
```

---

## 🚀 Utilisation

### Sauvegarde automatique
```bash
chmod +x scripts/backup.sh
./scripts/backup.sh
```

### Mises à jour logicielles
```bash
chmod +x scripts/update.sh
./scripts/update.sh
```

### Installation des dépendances web
```bash
chmod +x scripts/install_deps.sh
sudo ./scripts/install_deps.sh
```

### Appel API Web
```bash
chmod +x scripts/api_request.sh
./scripts/api_request.sh
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
