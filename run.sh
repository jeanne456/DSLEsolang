#!/bin/bash

# Arrêter le script dès qu'une erreur survient
set -e

# 1. Vérifier qu'un argument (le fichier .arnoldc) est fourni
if [ -z "$1" ]; then
    echo "❌ Erreur : Veuillez spécifier le fichier ArnoldC à tester."
    echo "Usage : ./run.sh p.arnoldc"
    exit 1
fi

PROGRAM="$1"

# Vérifier si le fichier du programme existe
if [ ! -f "$PROGRAM" ]; then
    echo "❌ Erreur : Le fichier '$PROGRAM' est introuvable."
    exit 1
fi

# 3. Parcourir tous les fichiers de test (.in)
tests_found=0

for input_file in *.in; do
    # Éviter l'erreur si aucun fichier .in n'est trouvé
    [ -e "$input_file" ] || continue

    tests_found=$((tests_found + 1))
    base_name="${input_file%.in}"
    output_file="${base_name}.out"

    echo "----------------------------------------"
    echo "▶️ Exécution du test : $base_name"

    # 4. Exécution du programme en injectant le fichier .in sur l'entrée standard (<)
    generated_output=$(java -jar "$ARNOLD_JAR" "$PROGRAM" < "$input_file")
   

    echo "--- Résultat obtenu ---"
    echo "$generated_output"

    # 5. Comparaison avec le fichier .out attendu
    if [ -f "$output_file" ]; then
        expected_output=$(cat "$output_file")
        
        # On compare en nettoyant d'éventuels retours à la ligne superflus de fin de fichier
        if [ "$generated_output" = "$expected_output" ]; then
            echo "✅ TEST RÉUSSI ($base_name)"
        else
            echo "❌ TEST ÉCHOUÉ ($base_name)"
            echo "--- Attendu ---"
            echo "$expected_output"
            echo "---------------"
        fi
    else
        echo "⚠️ Aucun fichier '$output_file' trouvé pour la comparaison."
    fi
done

if [ "$tests_found" -eq 0 ]; then
    echo "⚠️ Aucun fichier de test (.in) trouvé dans ce répertoire."
else
    echo "----------------------------------------"
    echo "✨ Fin des tests ($tests_found cas de test traités)."
fi
