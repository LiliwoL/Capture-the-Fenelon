from flask import Flask, request, jsonify, render_template_string, redirect, url_for, session
import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.secret_key = os.urandom(24)

def get_db_connection():
    return mysql.connector.connect(
        host="database",
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DATABASE")
    )

@app.route('/')
def home():
    if 'user_id' in session:
        return redirect(url_for('dashboard'))

    return render_template_string("""
    <h1>Bienvenue sur le portail des employés de TechCorp</h1>
    <form action="{{ url_for('login') }}" method="post">
        <input type="text" name="username" placeholder="Nom d'utilisateur" required><br>
        <input type="password" name="password" placeholder="Mot de passe" required><br>
        <input type="submit" value="Se connecter">
    </form>
    <p>Indice : Certains employés ont plus de privilèges que d'autres...</p>
    """)

############################################
# Route de connexion
############################################
@app.route('/login', methods=['POST'])
def login():
    # Récupération des données du formulaire
    username = request.form['username']
    password = request.form['password']

    # Connexion à la base
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Récupération de l'utilisateur
    cursor.execute("SELECT id, username FROM users WHERE username = %s", (username,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    # Si l'utilisateur existe
    if user:
        # On place le user id en session
        session['user_id'] = user['id']
        # Redirection vers le dashboard de l'utilisateur
        return redirect(url_for('dashboard'))

    return "Échec de la connexion. Veuillez réessayer."

############################################
# Route du dashboard
############################################
@app.route('/dashboard')
def dashboard():
    # Si l'utilisateur n'est pas connecté, on le redirige vers la page d'accueil
    if 'user_id' not in session:
        return redirect(url_for('home'))

    # Récupération des informations de l'utilisateur
    user_id = session['user_id']

    # Connexion à la base
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Récupération des informations de l'utilisateur
    cursor.execute("SELECT id, username, email FROM users WHERE id = %s", (user_id,))
    user = cursor.fetchone()

    # Récupération des notes de l'utilisateur
    cursor.execute("SELECT id, content FROM notes WHERE user_id = %s", (user_id,))
    notes = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template_string("""
    <h1>Tableau de bord de {{ user['username'] }}</h1>
    <p>Email : {{ user['email'] }}</p>
    <h2>Vos notes :</h2>
    <ul>
    {% for note in notes %}
        <li>{{ note['content'] }}</li>
    {% endfor %}
    </ul>
    <p>URL de votre profil : <a href="{{ url_for('get_user', user_id=user['id']) }}">/api/user/{{ user['id'] }}</a></p>
    <a href="{{ url_for('logout') }}">Se déconnecter</a>
    """, user=user, notes=notes)

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    return redirect(url_for('home'))

@app.route('/api/user/<int:user_id>')
def get_user(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT id, username, email, is_admin FROM users WHERE id = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    if user:
        if user['is_admin']:
            return jsonify({
                "message": "Félicitations ! Vous avez trouvé le compte administrateur.",
                "user": user,
                "FENELON1": os.getenv("FENELON1"),
                "next_challenge": "/api/note/1"
            })
        return jsonify(user)
    else:
        return jsonify({"erreur": "Utilisateur non trouvé"}), 404

@app.route('/api/note/<int:note_id>')
def get_note(note_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM notes WHERE id = %s", (note_id,))
    note = cursor.fetchone()
    cursor.close()
    conn.close()

    if note:
        if note['is_secret']:
            return jsonify({
                "message": "Bravo ! Vous avez trouvé une note secrète.",
                "content": note['content'],
                "FENELON2": os.getenv("FENELON2"),
                "next_challenge": "/api/admin/users"
            })
        return jsonify(note)
    else:
        return jsonify({"erreur": "Note non trouvée"}), 404

@app.route('/api/admin/users')
def get_all_users():
    user_id = request.args.get('user_id', type=int)
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT is_admin FROM users WHERE id = %s", (user_id,))

    user = cursor.fetchone()

    if not user or not user['is_admin']:
        cursor.close()
        conn.close()
        return jsonify({"erreur": "Accès non autorisé. Ce user_id n'est pas autorisé"}), 403

    cursor.execute("SELECT id, username, email, is_admin FROM users")
    users = cursor.fetchall()
    cursor.close()
    conn.close()

    return jsonify({
        "message": "Félicitations ! Vous avez terminé tous les défis.",
        "users": users,
        "FENELON3": os.getenv("FENELON3")
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)