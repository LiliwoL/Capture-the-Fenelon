# Choose the right Debian tag
# https://hub.docker.com/_/debian/tags
FROM debian:bookworm-slim

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
RUN apt update && apt install openssh-server locales vim zsh iproute2 mariadb-server rsyslog apache2 sudo -y
RUN locale-gen fr_FR.UTF-8
RUN update-locale


# Création de l'utilisateur user1
RUN useradd -rm -d /home/${USER_1} -s /usr/bin/zsh -g root -G sudo -u 1000 ${USER_1}
RUN  echo "${USER_1}:${PASSWORD_1}" | chpasswd

# Création de l'utilisateur user2
RUN useradd -rm -d /home/${USER_2} -s /usr/bin/zsh -g root -G sudo -u 1001 ${USER_2}
RUN  echo "${USER_2}:${PASSWORD_2}" | chpasswd


# Création de l'utilisateur user3
RUN useradd -rm -d /home/${USER_3} -s /usr/bin/zsh -g root -G sudo -u 1002 ${USER_3}
RUN  echo "${USER_3}:${PASSWORD_3}" | chpasswd


# Création de l'utilisateur user4
RUN useradd -rm -d /home/${USER_4} -s /usr/bin/zsh -g root -G sudo -u 1003 ${USER_4}
RUN  echo "${USER_4}:${PASSWORD_4}" | chpasswd


# Création des FLAGS dans les logs
# ===========================

# Apache2
# ===========================
RUN echo "Et voici le FENELON_1! ------> ${FENELON_1}" | tee /var/log/apache2/access.log

# SSH
# ===========================
# Définition des logs SSH
RUN sed -i 's/#SyslogFacility/SyslogFacility/g' /etc/ssh/sshd_config
RUN sed -i 's/#LogLevel INFO/LogLevel VERBOSE/g' /etc/ssh/sshd_config
# Redémarrage du service MariaDB
RUN rsyslogd
RUN service ssh restart
RUN echo "Et voici le FENELON_2! ------> ${FENELON_2}" | tee /var/log/auth.log



# MariaDB
# ===========================
# Définition des logs MariaDB
RUN sed -i 's/#general_log_file/general_log_file/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# Redémarrage du service MariaDB
RUN service mariadb restart
RUN echo "Et voici le FENELON_3! ------> ${FENELON_3}" | tee /var/log/mysql.log





# Port 22 (qui sera différent via docker-compose)
EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]