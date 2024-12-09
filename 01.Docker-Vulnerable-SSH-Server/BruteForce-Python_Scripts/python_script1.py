import paramiko
# https://www.paramiko.org/

# Infos
host="127.0.0.1"
username="user1"
password="user1"
port=2222

pirate=False

try:
	# Connexion
	client = paramiko.client.SSHClient()
	client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
	client.connect(host, username=username, password=password, port=port)
	pirate=True

except:
	pirate=False
	client.close()

if pirate:
	command = "tail /etc/passwd" # On peut voir la liste des utilisateurs sur la machine
	_stdin, _stdout, _stderr = client.exec_command(command)
	print ("Sortie")
	print( _stdout.read().decode() )

client.close()