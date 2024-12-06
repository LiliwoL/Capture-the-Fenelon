CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       is_admin BOOLEAN DEFAULT FALSE
);

INSERT INTO users (username, email, password, is_admin) VALUES
                                                            ('alice', 'alice@techcorp.com', 'pbkdf2:sha256:260000$xrYZKgTzaGMPo3Xz$f8f494b56a86d50a9d85f0f5ad38fb04e42f7d573be3cab93da524afc58d5fee', FALSE),
                                                            ('bob', 'bob@techcorp.com', 'pbkdf2:sha256:260000$xEFfHHu1nNlq0FVA$ede80deab1c87b41bc65f7419ef1fc38d5ec06a97cf958db9911d8e6cac80ffc', FALSE),
                                                            ('charlie', 'charlie@techcorp.com', 'pbkdf2:sha256:260000$NmSyoZMvQK0lUjUg$c50ac2c5e10e9dc2b3db9bc69336b40c6c5a7a3c92f1cf59c2e0b824b73144ea', FALSE),
                                                            ('david', 'david@techcorp.com', 'pbkdf2:sha256:260000$f0kGgKGtNk6ynxuI$47bc0738aefd503f5b91b89d85132e3cb54a4fffdb46f6439594b8be1a4cda4d', FALSE),
                                                            ('eve', 'eve@techcorp.com', 'pbkdf2:sha256:260000$qnygVi65kA5c1HRM$81a460d5eb8f82c0c6c62926f3566c00d78c54514126f2bff7a6c67ff19b5a52', FALSE),
                                                            ('frank', 'frank@techcorp.com', 'pbkdf2:sha256:260000$uqWb1C0cGVNH769u$e59ac98f57f5f56a96df49c2c43af4bea3b7e66b86f7f8e0b2bd08433d94e78f', FALSE),
                                                            ('grace', 'grace@techcorp.com', 'pbkdf2:sha256:260000$VxYICE3cXJNRYJAy$85fedc04ac8e6c27cd0a65e7a29b67d5a836dea09ddf1ca18e8a6002b749276c', FALSE),
                                                            ('heidi', 'heidi@techcorp.com', 'pbkdf2:sha256:260000$bWHpBCMqb2qIlhXL$e8bf7fed5c1fa20bcc9ce9da2699ad6bb6c061e2b73ec5bd783c6718190b4c58', TRUE),
                                                            ('ivan', 'ivan@techcorp.com', 'pbkdf2:sha256:260000$JrBMYW3K1OvWnTmk$17ceb61bb3d5c6da3e4f2a01a7e356aab5a24cf8bd3b24c847c86580a440ea0e', FALSE),
                                                            ('judy', 'judy@techcorp.com', 'pbkdf2:sha256:260000$Ufqfgns0UvwEO0ek$67d82ba7a983ec84ecaa4be6ce1e19f59e859ed5c20a82cf77e63d2c2f8f5f85', FALSE);

CREATE TABLE notes (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       user_id INT,
                       content TEXT,
                       is_secret BOOLEAN DEFAULT FALSE,
                       FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO notes (user_id, content, is_secret) VALUES
                                                    (1, 'Réunion d''équipe lundi à 10h', FALSE),
                                                    (2, 'Projet X : Deadline repoussée au 15/11', FALSE),
                                                    (3, 'Idées pour la fête de Noël de l''entreprise', FALSE),
                                                    (4, 'Nouveau client potentiel : contacter la semaine prochaine', FALSE),
                                                    (5, 'Mise à jour du logiciel prévue pour vendredi', FALSE),
                                                    (6, 'Numéros de carte de crédit de l''entreprise : 1234-5678-9012-3456', TRUE),
                                                    (7, 'Planification de la maintenance du serveur', FALSE),
                                                    (8, 'Mot de passe du système principal : AdminPass123!', TRUE),
                                                    (9, 'Rapport trimestriel à finaliser avant jeudi', FALSE),
                                                    (10, 'Liste des employés à promouvoir', FALSE);