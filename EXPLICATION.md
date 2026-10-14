En ArnoldC, le compilateur traduit le code source en bytecode Java via la bibliothèque ASM.
Seul un type d'élément est stocké : les entiers signés sur 16bits. Les booléens sont également stockés sous forme d'entiers (0 pour `@I LIED` (false) et 1 pour `@NO PROBLEMO` (true)).
Toutes les variables sont locales à la méthode dans laquelle elles sont déclarées, il n'existe pas de mémoire globale. 
L'instruction `HEY CHRISTMAS TREE` permet d'allouer l'espace mémoire d'une variable et de réserver un emplacement dans la table des variables locales de la pile d'exécution de la JVM.
Ce langage utilise un registre de calcul pour modifier la mémoire initialisé par la commande `GET TO THE CHOPPER` qui permet de charget une valeur ou une variable dans le registre.
Cette valeur est ensuite manipulée de manière séquentielle avec des opérations arithmétiques comme `GET UP` pour une addition.
L'instruction `ENOUGH TALK` permet finalement d'assigner le résultat final dans l'emplacement mémoire de la variable cible.


Mon programme commence par initialiser les variables utilisées pour le calcul du palindrome (`r` est le chiffre reconstruit à l'envers, `temp` vaut le chiffre d'entrée (`num`) que l'on va diviser par 10 à chaque boucle, `temp10` est le modulo 10 de `temp`, et `tempPositif` est un booléen qui vérifie si `temp` est toujours positif). 
Ensuite commence la boucle `while` à condition que`tempPositif` soit à `@NO PROBLEMO` (`true`). Dans cette boucle, on calcule le modulo 10 de `temp`, puis on reconstruit le chiffre à l'envers dans `r` à l'aide du résultat et onmet à jour les variables pour continuer la boucle.
Une fois sortis de la boucle, on vérifie si le chiffre retourné et l'original sont égaux et on affiche le message adapté.
