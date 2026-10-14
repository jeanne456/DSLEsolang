#!/bin/bash

# Arrête le script immédiatement en cas d'erreur
set -e

# Configuration du compilateur
JAR_FILE="ArnoldC.jar"
JAR_URL="https://github.io"

# 1. Vérification de l'argument (Le dossier)
if [ -z "$1" ]; then
    echo "❌ ERROR: Missing directory argument."
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ ERROR: '$TARGET_DIR' is not a valid directory."
    exit 1
fi

echo "🧠 Checking your system requirements..."

# 2. Vérification de la présence de Java
if ! command -v java &> /dev/null; then
    echo "❌ ERROR: Java is not installed."
    exit 1
fi

# 3. Téléchargement automatique d'ArnoldC.jar s'il est manquant
if [ ! -f "$JAR_FILE" ]; then
    echo "📦 ArnoldC.jar missing. Downloading..."
    if command -v curl &> /dev/null; then
        curl -sL "$JAR_URL" -o "$JAR_FILE"
    elif command -v wget &> /dev/null; then
        wget -q "$JAR_URL" -O "$JAR_FILE"
    else
        echo "❌ ERROR: Neither curl nor wget found."
        exit 1
    fi
fi

# Récupère la liste des fichiers se terminant par .in dans le dossier ciblé
FILES=("$TARGET_DIR"/*.in)

# Vérifie si des fichiers .in existent réellement
if [ ! -e "${FILES[0]}" ]; then
    echo "❌ ERROR: No .in files found in '$TARGET_DIR'."
    exit 1
fi

echo "🚀 Starting batch execution in '$TARGET_DIR'..."

# 4. Boucle de traitement de chaque fichier .in
for FILE in "${FILES[@]}"; do
    # Extrait le nom du fichier sans le dossier et sans l'extension pour Java
    BASENAME=$(basename "$FILE" .in)
    
    echo ""
    echo "========================================="
    echo "🧱 Compiling $FILE..."
    echo "========================================="
    
    # Copie temporaire ou compilation directe si ArnoldC crée le .class au bon endroit
    # ArnoldC génère le fichier .class dans le dossier courant. Pour éviter les conflits,
    # on se déplace temporairement dans le dossier du fichier ou on gère la classe.
    
    # On compile le fichier .in (ArnoldC accepte n'importe quelle extension pour compiler)
    java -jar "$JAR_FILE" "$FILE"
    
    echo "🚀 Running $BASENAME..."
    echo "----------------------------------------"
    # Exécution de la classe Java générée à la racine
    java "$BASENAME"
    echo "----------------------------------------"
    
    # Nettoyage du fichier .class généré pour garder le projet propre
    rm -f "$BASENAME".class
done

echo ""
echo "All files processed."
