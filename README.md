#Mini projet d'IA 2016-2017

## Optimisation de graphique en étoile pour l'aide visuelle à la décision 

**Antonin ARQUEY - Andréas PASTOR**

Lancement du programme : 

```
swipl -s ./src/main.pl
```

Les données doivent être fournies dans *data.pl* sous la forme suivante : 

Définition d'une dimension : 
```
max(nom_dimension, valeur_max_dimension).
```

Définition d'un diagramme : 
```
value(nom_diagramme, nom_dimension, valeur_dimension).
```