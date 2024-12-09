const express = require('express');
const path = require('path');

const app = express();

// User-Agents spécifiques à partir des variables d'environnement
const userAgentPage1 = process.env.FENELON1 || "GoogleBot";
const userAgentPage2 = process.env.FENELON2 || "DefaultAgent2/2.0";
const userAgentPage3 = process.env.FENELON3 || "DefaultAgent3/3.0";

// Montrer les indices
const SHOW_HINTS = process.env.SHOW_HINTS || false;

app.set('view engine', 'html');
app.engine('html', require('ejs').renderFile);
app.set('views', path.join(__dirname, 'views'));

// ***************************
// Page d'accueil
// On présente le CTF
// On indique où trouver les User-Agent
// On indique si on souhaite afficher des indices
// ***************************
app.get('/', (req, res) => {
    res.render('index.html');
});


// ***************************
// Route pour la page 1
// On vérifie le User-Agent 1 définit dans .env
// ***************************
app.get('/fenelon1', (req, res) => {
    // Récupération du User-agent
    let userAgent = req.headers['user-agent'];

    if (userAgent && userAgent.includes(userAgentPage1)) {
        res.render('fenelon1.html');
    } else {
        res.render('error.html', { message: 'Mauvais User-Agent pour Page 1', showHints: SHOW_HINTS});
    }
});

// ***************************
// Route pour la page 2
// On vérifie le User-Agent 2 définit dans .env
// ***************************
app.get('/fenelon2', (req, res) => {
    // Récupération du User-agent fourni par l'utilisateur
    let userAgent = req.headers['user-agent'];

    // Récupération du User-Agent demandé pour la page 2
    // Le User agent contient des |, donc ce sont des options
    let userAgents = userAgentPage2.split('|');

    // On attend à ce que TOUS les éléments du tableau soient dans le User-Agent
    let tousTrouves = userAgents.every(element => userAgent.includes(element));
    let auMoinsUnTrouve = userAgents.some(element => userAgent.includes(element));


    if (userAgent && tousTrouves) {
        console.log("Tous les éléments du tableau sont dans la chaîne !");
        res.render('fenelon2.html');
    } else if (userAgent && auMoinsUnTrouve) {
        console.log("Au moins un élément du tableau est dans la chaîne !");
        res.render('error.html', { message: 'Il manque des parties pour l\'User-Agent pour Page 2', showHints: SHOW } );
    } else {
        res.render('error.html', { message: 'Mauvais User-Agent pour Page 2', showHints: SHOW_HINTS});
    }
});


// ***************************
// Route pour la page 3
// On vérifie le User-Agent 3 définit dans .env
// ***************************

app.get('/fenelon3', (req, res) => {
    // Récupération du User-agent
    let userAgent = req.headers['user-agent'];

    if (userAgent && userAgent.includes(userAgentPage3)) {
        res.render('fenelon3.html');
    } else {
        res.render('error.html', { message: 'Mauvais User-Agent pour Page 3', showHints: SHOW_HINTS});
    }
});

// Démarrer le serveur
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Serveur démarré sur le port ${PORT}`);
});
