Pour la confrontation au LLM j'ai choisi Mistral Vibe en mode work et fast. Voici la conversation du 8 octobre : 

### Moi :
Ecris moi un programme en ArnoldC (dont voici la page esolangs : https://esolangs.org/wiki/ArnoldC) qui détermine si un nombre donné en paramètre de la fonction est un palindrome ou non. Le nombre ne doit pas dépasser 32767 car le langage ne supporte que des entiers signés de 16 bits. La fonction écrit soit "This is a palindrome number", soit "This is not a palindrome number".

### Mistral Vibe :
Voici le programme en ArnoldC. La méthode `palindrome` prend le nombre en paramètre, inverse ses chiffres (sans opérateur modulo, avec `n - (n/10)*10`), puis compare :

```
IT'S SHOWTIME
DO IT NOW palindrome 12321
YOU HAVE BEEN TERMINATED

LISTEN TO ME VERY CAREFULLY
palindrome
I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE n
GIVE THESE PEOPLE AIR
HEY CHRISTMAS TREE temp
YOU SET US UP 0
HEY CHRISTMAS TREE rev
YOU SET US UP 0
HEY CHRISTMAS TREE tenx
YOU SET US UP 0
HEY CHRISTMAS TREE digit
YOU SET US UP 0
HEY CHRISTMAS TREE isPal
YOU SET US UP 0

GET TO THE CHOPPER temp
HERE IS MY INVITATION n
ENOUGH TALK

STICK AROUND temp
GET TO THE CHOPPER tenx
HERE IS MY INVITATION temp
HE HAD TO SPLIT 10
YOU'RE FIRED 10
ENOUGH TALK

GET TO THE CHOPPER digit
HERE IS MY INVITATION temp
GET DOWN tenx
ENOUGH TALK

GET TO THE CHOPPER rev
HERE IS MY INVITATION rev
YOU'RE FIRED 10
GET UP digit
ENOUGH TALK

GET TO THE CHOPPER temp
HERE IS MY INVITATION tenx
HE HAD TO SPLIT 10
ENOUGH TALK
CHILL

GET TO THE CHOPPER isPal
HERE IS MY INVITATION rev
YOU ARE NOT YOU YOU ARE ME n
ENOUGH TALK

BECAUSE I'M GOING TO SAY PLEASE isPal
TALK TO THE HAND "This is a palindrome number"
BULLSHOOT
TALK TO THE HAND "This is not a palindrome number"
YOU HAVE NO RESPECT FOR LOGIC

I'LL BE BACK
isPal
ENOUGH TALK
```

Quelques précisions :

- **Algorithme** : on copie `n` dans `temp`, puis à chaque tour de boucle `STICK AROUND temp ... CHILL` on extrait le dernier chiffre (`digit = temp - (temp/10)*10`, ArnoldC n'ayant pas de modulo), on construit `rev = rev*10 + digit`, et on divise `temp` par 10. À la fin, `rev == n` (via `YOU ARE NOT YOU YOU ARE ME`) signifie palindrome.
- **Le test** : le booléen `isPal` pilote le `BECAUSE I'M GOING TO SAY PLEASE ... BULLSHOOT ... YOU HAVE NO RESPECT FOR LOGIC` qui affiche la bonne phrase. La méthode retourne aussi ce booléen.
- **Limite 16 bits** : toutes les valeurs tiennent dans un entier signé 16 bits tant que `n ≤ 32767` ; au-delà, le langage déborderait de toute façon ([ArnoldC](https://esolangs.org/wiki/ArnoldC)).
- Pour changer le nombre testé, modifiez l'argument dans `DO IT NOW palindrome 12321` (par ex. `12321` affiche « This is a palindrome number », `12345` affiche « This is not a palindrome number »).
