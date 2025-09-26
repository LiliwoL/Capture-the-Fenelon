# Ouvrir le fichier en lecture seule
file = open("dictionnary.txt", "r")

# Utiliser readlines pour lire les lignes du fichier
# La variable "lignes" est une liste contenant toutes les lignes du fichier
lines = file.readlines()

# Fermer le fichier après avoir lu les lignes
file.close()

# Itérer sur les lignes
for line in lines:
    print (line.strip())    # Juste pour le test # Strip pour enlever le saut de ligne