
```
   ____ _____ _____   _   _                            ___ ____   ___  ____  
  / ___|_   _|  ___| | \ | | __ _ _ __ ___   ___   _  |_ _|  _ \ / _ \|  _ \ 
 | |     | | | |_    |  \| |/ _` | '_ ` _ \ / _ \ (_)  | || | | | | | | |_) |
 | |___  | | |  _|   | |\  | (_| | | | | | |  __/  _   | || |_| | |_| |  _ < 
  \____| |_| |_|     |_| \_|\__,_|_| |_| |_|\___| (_) |___|____/ \___/|_| \_\
```


# Contexte

Vous disposez d'une application web qui met à disposition les informations de plusieurs utilisateurs.
Seul un seul utilisateur est administrateur et peut voir les informations de tous les utilisateurs.
Les utilisateurs ont accès à leur profil et à leurs notes.

# Accès

http://localhost:5000/

# Déroulé du CTF

- Niveau 1 : Les étudiants doivent exploiter l'IDOR sur /api/user/{user_id} pour trouver l'utilisateur spécial et obtenir le FENELON1.
- Niveau 2 : Ils doivent ensuite exploiter l'IDOR sur /api/note/{note_id} pour trouver la note secrète et obtenir le FENELON2.
- Niveau 3 : Enfin, ils doivent exploiter l'IDOR sur /api/admin/users?user_id=4 pour accéder à la liste de tous les utilisateurs et obtenir le FENELON3.

# Exploitation

La vulnérabilité à trouver est qu'il n'y a **aucune vérification** de l'**authentification**.
Cela permet à **n'importe qui d'accéder aux données de n'importe quel utilisateur** en changeant l'identifiant de l'utilisateur.

# Méthodologie

- Tester différents ID utilisateurs pour trouver l'administrateur.
- Explorer les différentes notes pour trouver celle contenant des informations sensibles.
- Utiliser l'ID de l'administrateur pour accéder à la liste complète des utilisateurs.

# Solution

- Niveau 1 : `/api/user/8`
- Niveau 2 : `/api/note/6`
- Niveau 3 : `/api/admin/users?user_id=8`

# URLs

## /

Affiche la page d'accueil de l'application et les règles du CTF.

## /api/user/<user id>

Affiche les informations de l'utilisateur avec l'identifiant `<user id>`
- user id doit être un **entier**

## /success

Affiche le flag
