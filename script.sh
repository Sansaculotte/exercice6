#!/bin/bash

# 1. Demander à l'utilisateur ou stocker le contenu
echo "Voulez-vous stocker le contenu dans un emplacement spécifique ? (o/n)"
read reponse

if [ "$reponse" = "o" ]; then
    # 2. Récupérer dans une variable l'emplacement
    echo "Veuillez entrer l'emplacement complet où vous voulez stocker le contenu :"
    read emplacement

    # 3. Se déplacer dans l'emplacement
    if [ -d "$emplacement" ]; then
        cd "$emplacement"
    else
        echo "L'emplacement spécifié n'existe pas. Création de l'emplacement..."
        mkdir -p "$emplacement"
        cd "$emplacement"
    fi
else
    # Si l'utilisateur ne veut pas spécifier d'emplacement, utiliser l'emplacement courant
    emplacement=$(pwd)
fi

# 4. Créer un dossier
echo "Création du dossier 'Films'..."
mkdir -p Films

# 5. Créer un fichier collection.txt
echo "Création du fichier 'collection.txt' dans le dossier 'Films'..."
touch Films/collection.txt

# 6. Demander à l'utilisateur le nom du film à ajouter
echo "Veuillez entrer le nom du film à ajouter dans la collection :"
read nom_film

# 7. Ajouter le nom du film dans le fichier collection.txt
echo "$nom_film" >> Films/collection.txt

# Confirmation de l'ajout
echo "Le film '$nom_film' a été ajouté à la collection dans $emplacement/Films/collection.txt"
