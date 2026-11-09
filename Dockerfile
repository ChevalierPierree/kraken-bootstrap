# Image de départ : Python 3.12 en version légère
FROM python:3.12-slim

# Dossier de travail dans le conteneur
WORKDIR /app

# On installe les dépendances avant de copier le code.
# Comme ça, modifier le code ne relance pas l'installation.
# --no-cache-dir : pip ne garde pas ses téléchargements dans l'image.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# On copie le code et les données du job
COPY app app
COPY data data

# On crée un utilisateur normal pour ne pas lancer le job en root
RUN useradd app

# Le job écrit dans output : on donne ce dossier à l'utilisateur
RUN mkdir output && chown app output

# À partir d'ici, tout tourne avec cet utilisateur
USER app

# Commande lancée au démarrage du conteneur
CMD ["python", "-m", "app.main"]
