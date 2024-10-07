FROM httpd:2.4-bookworm

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


# Copier les fichiers dans le répertoire htdocs
#COPY ../app /usr/local/apache2/htdocs/

# Copier le fichier de configuration
#COPY ../docker/my-httpd.conf /usr/local/apache2/conf/httpd.conf


# Créer des répertoires qui seront cachés
RUN mkdir /usr/local/apache2/htdocs/admin
RUN mkdir /usr/local/apache2/htdocs/backup
RUN mkdir /usr/local/apache2/htdocs/confidential

# Ajouter des fichiers dans ces répertoires
RUN echo "admin:password123" | tee /usr/local/apache2/htdocs/admin/passwords.txt
RUN echo "CREATE DATABASE test;" | tee /usr/local/apache2/htdocs/backup/database.sql
RUN echo "FLAG{Congratulations_You_Found_It}" | tee /usr/local/apache2/htdocs/confidential/flag.txt

# Assurez-vous que les permissions sont correctes
RUN chown -R www-data:www-data /usr/local/apache2/htdocs/
