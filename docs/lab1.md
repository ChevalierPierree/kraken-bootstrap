Cache : j'installe les dépendances avant de copier le code. Quand je modifie app/main.py, pip install reste en CACHED, alors qu'il prenait 18 s avec le Dockerfile naïf.
Taille : avec la base slim, le .dockerignore et la copie de app et data seulement, l'image passe de 2,55 Go à 612 Mo sur le disque (de 653 Mo à 136 Mo avec .Size).
Sécurité et configuration : le job tourne avec l'utilisateur app (uid 1000) et ne peut écrire que dans output. Avec -e OUTPUT_DIR=/out et un volume, le fichier arrive sur ma machine.
