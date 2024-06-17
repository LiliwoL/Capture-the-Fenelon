# Choose the right Debian tag
# https://hub.docker.com/_/debian/tags
FROM debian:sid-slim

# Récupération des variables
ARG FENELON_1
ARG FENELON_2
ARG FENELON_3

# Commandes d'installation de base
RUN apt update && apt install openssh-server locales vim zsh iproute2 sudo -y
RUN locale-gen fr_FR.UTF-8
RUN update-locale


# Création de l'utilisateur user1
RUN useradd -rm -d /home/user1 -s /usr/bin/zsh -g root -G sudo -u 1000 user1
RUN  echo 'user1:user1' | chpasswd

# Création de l'utilisateur user2
RUN useradd -rm -d /home/user2 -s /usr/bin/zsh -g root -G sudo -u 1001 user2
RUN  echo 'user2:user2' | chpasswd


# Création de l'utilisateur nicolas
RUN useradd -rm -d /home/nicolas -s /usr/bin/zsh -g root -G sudo -u 1002 nicolas
RUN  echo 'nicolas:Passw@rd' | chpasswd


# Création de l'utilisateur userfaible
RUN useradd -rm -d /home/userfaible -s /usr/bin/zsh -g root -G sudo -u 1003 userfaible
RUN  echo 'userfaible:loulou' | chpasswd

# Clés publiques
COPY ssh_public_keys/id_rsa_prof.pub /root/.ssh/authorized_keys

# Création des fichiers de FLAGS
RUN echo "${FENELON_1}" > /home/user1/fenelon.txt
RUN echo "${FENELON_2}" > /home/user2/fenelon.txt
RUN echo "${FENELON_3}" > /home/nicolas/fenelon.txt

# Lancement de SSHD
RUN service ssh start


# Port 22 (qui sera différent via docker-compose)
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]