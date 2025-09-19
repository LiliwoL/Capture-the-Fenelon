# Docker DirBuster

Les fenelons sont stockés dans des répertoires masqués à la navigation masi trouvablesavec DirBuster.
Les fenelons sont stockés dans des fichiers texte, des fichiers .sql, des images...

## Description

Un CTF pour trouver les fenelons en trouvant les dossiers du site web.

## Objectifs

- Trouver les dossiers du site web
- Utiliser le logiciel dirbuster
- Trouver les fenelons

## Protection

- Les dossiers sont masqués à la navigation
- .htaccess est utilisé pour protéger les dossiers

## Détails

Les étudiants peuvent utiliser DirBuster avec les paramètres suivants :

URL de base: http://localhost:8080

Liste de mots: Utiliser une liste de mots commune pour découvrir les répertoires (par exemple, common.txt ou directory-list-2.3-medium.txt).
Voici un guide rapide pour l'utilisation de DirBuster :

Lancez DirBuster.
Entrez l'URL de base du site web cible.
Sélectionnez une liste de mots pour brute-forcer les répertoires.
Cliquez sur Start pour démarrer la recherche.
Naviguez vers les répertoires et fichiers découverts pour trouver le flag.
Remarques pédagogiques
Expliquez aux étudiants l'importance de la sécurité des serveurs web et comment des outils comme DirBuster peuvent être utilisés pour tester la sécurité.
Discutez des bonnes pratiques pour protéger les répertoires et fichiers sensibles (par exemple, utilisation de .htaccess pour restreindre l'accès).
Encouragez-les à documenter leur processus et leurs découvertes.
Ce CTF permet aux étudiants de mettre en pratique des compétences en sécurité informatique et en utilisation d'outils de force brute, tout en s'amusant et en apprenant l'importance de la protection des données sur les serveurs web.

## Liens

- DirBuster: https://www.kali.org/tools/dirbuster/
- Comment utiliser DirBuster: https://ourcodeworld.com/articles/read/417/how-to-list-directories-and-files-of-a-website-using-dirbuster-in-kali-linux#google_vignette
- Comment protéger les répertoires avec .htaccess: https://www.hostinger.com/tutorials/htaccess/protect-folder-using-htaccess
- Exemple de liste de noms de fichiers et de répertoires pour DirBuster:
  - https://github.com/kkrypt0nn/wordlists/blob/main/wordlists/vulnerabilities/weblogic.txt