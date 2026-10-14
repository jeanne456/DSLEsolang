# DSLEsolang

Pour ce devoir, j'ai choisi le langage ArnoldC (https://esolangs.org/wiki/ArnoldC) et j'ai utilisé l'interpréteur en ligne suivant : https://tio.run/#arnoldc. Afin de faciliter les tests, j'ai ajouté l'interpréteur ArnoldC à la racine du projet. Pour exécuter un programme il faut exécuter les commandes suivantes : 

<pre>$ java -jar ArnoldC.jar p.arnoldc
$ echo "<nombre_a_tester>" | java p</pre>

ou simplement `./run.sh p.arnoldc` pour exécuter les tests.
Attention, le langage ne supporte que les entiers signés sur 16 bits et le programme ne fonctionne que pour les nombres positifs, l'entier à tester doit donc être compris entre 0 et +32 767.

Le langage ne supporte pas les commentaires, j'ai donc déposé une version fonctionnelle sans commentaires (p.arnoldc), et une version non fonctionnelle avec des commentaires signalés par le caractère # (p_comments.arnoldc).
