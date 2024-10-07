# Docker Vulnerable SSH Server

*Niveau: Débutant*

# Objectif

Tester la vulnérabilité du serveur SSH et proposer des solutions pour renforcer la sécurité du serveur SSH.

# Notions à étudier

- Brute Force
- Scanner de port
- Accès SSH

---

# Régles du jeu (à fournir aux étudiants)

- Un serveur est mal configuré et vulnérable.
- Vous devez trouver 3 **fenelon** sur cette machine.
  - Un **fenelon** est situé à l'intérieur d'un fichier nommé **fenelon.txt**.
- Chacun des **fenelon** devra être validé sur une plateforme spécifique.

---

# Technique

## Informations

IP | Port
-- | --
selon la machine qui héberge | 2222

## Liste des utilisateurs existants

> A modifier dans le fichier **.env**!

User | Password
-- | --
user1 | user1
user2 | user2
nicolas | Passw@rd

## Dossiers et fichiers

- ssh_public_keys/
  - Placez-y la clé publique autorisée à se connecter au serveur et nommez la **id_rsa_prof.pub**

---

# Scénarios pédagogiques possibles

1. On fournit aux étudiants l'**adresse IP** du serveur sous forme de **jeu de piste**, d'une **solution à une énigme**...

## Scénario 1 (simple)

2. On informe qu'ils doivent scanner les ports à la recherche d'un serveur SSH.
3. On indique le nom des utilisateurs existants
4. On les informe qu'ils doivent faire du BruteForce
5. Un dictionnaire de mot de passe est fourni

---

# Solutions

- Complexité des mots de passe des utilisateurs trop faible
  - user1: user1
  - user2: user2
  - nicolas: `Passw@rd`
- Emplacement des **fenelon** dans le répertoire **home** des utilisateurs.

# Propositions d'amélioration

- Améliorer la complexité des mots de passe
- Eviter de trop nombreuses tentatives
- Interdire les connexions par mot de passe