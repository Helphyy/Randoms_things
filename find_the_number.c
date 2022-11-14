#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int nb_joueur = 0, nb_mystere = 0, compteur = 0, flag = 0;
    const int MAX = 100, MIN = 1;
 
    srand (time(NULL));
    nb_mystere = (rand() % (MAX - MIN + 1)) + MIN;
    while (nb_joueur != nb_mystere)
    {
    printf("\n\ntrouvez le juste prix entre 1 et 100  :  ");
    scanf("%ld", &nb_joueur);
    printf("\n\n");
    compteur++;
 
    if (nb_mystere < nb_joueur)
     printf("c'est moin\n\n");
 
    else if (nb_mystere > nb_joueur)
     printf("c'est plus\n\n");
 
    else
     printf("vous avez trouvez le juste prix en %ld coup\n\n", compteur);
     flag = 1;
    }
    return 0;
}