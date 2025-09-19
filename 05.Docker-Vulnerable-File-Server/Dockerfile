# Utiliser l'image officielle de Caddy comme base
FROM caddy:latest


# Mettre à jour les dépôts et installer les dépendances nécessaires
RUN apk update && apk add \
    sudo \
    zip \
    zsh \
    nano


# Créer un répertoire pour les fichiers
RUN mkdir -p /srv
RUN mkdir -p /srv/01
RUN mkdir -p /srv/02
RUN mkdir -p /srv/03

# Copier le fichier Caddyfile dans le conteneur
COPY caddy/Caddyfile /etc/caddy/Caddyfile

# Exposer le port 8889
EXPOSE 8889

# Récupération des variables
ARG FENELON_1
ARG FENELON_2
ARG FENELON_3
ARG MOT_DE_PASSE




# Création de l'utilisateur sio avec le mot de passe fourni dans .env
RUN adduser --disabled-password -h /home/sio -s /usr/bin/zsh -G root -u 1000 sio
RUN  echo 'sio:${MOT_DE_PASSE}' | chpasswd


# Création des fichiers de FLAGS
RUN echo "${FENELON_1}" > /srv/fenelon.txt
# Création des archives protégées
RUN zip -P ${MOT_DE_PASSE} /srv/01/facture-2024-06-14.zip /srv/fenelon.txt
# Suppression des fichiers de FLAGS
RUN rm /srv/fenelon.txt


# Création des fichiers de FLAGS
RUN echo "${FENELON_2}" > /srv/fenelon.txt
# Création des archives protégées
RUN zip -P ${MOT_DE_PASSE} /srv/02/facture-2023-06-4.zip /srv/fenelon.txt
# Suppression des fichiers de FLAGS
RUN rm /srv/fenelon.txt


# Création des fichiers de FLAGS
RUN echo "${FENELON_3}" > /srv/fenelon.txt
# Création des archives protégées
RUN zip -P ${MOT_DE_PASSE} /srv/03/facture-2022-06-14.zip /srv/fenelon.txt
# Suppression des fichiers de FLAGS
RUN rm /srv/fenelon.txt

# Lancement de Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]