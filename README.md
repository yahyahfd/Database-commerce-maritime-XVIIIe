#Projet de Base de données par HAFID Yahya(71800578) et OUBADIA Tanel(71806010): BINOME 87

<!-- psql -d base_cours login SET search_path TO projet_login; -->
Dans un terminal avec psql :
  - \i creation_tables.sql
  (pour creer les tables)
  - \i remplissage.sql
  (pour remplire les tables)

Concernant les requêtes:
  - \i REQ/reqn.sql
  (avec n le numéro de la requête)
  - \i REQ/requetes.sql
  (pour pour le fichier contenant toutes les requêtes avec leur description)

Liste des questions auxquelles répondent les différentes requêtes (numéro des requêtes correspondantes):
1) L'id des navires de type commençant par un 'G' de nationalité française et qui ont au moins un voyage qui a pour destination un port Français
2) Les id de navires dont le volume de produit (max) est aussi un nombre de passagers (trié par ordre croissant d'id)
3) Les ids des cargaisons qui contiennent le produit 'Vinaigre' ainsi que sa quantité dans ces cargaisons
4) Les ids de navires dont le nombre de passagers est supérieur à la moyenne des passagers de tous les navires 
5) L'id et le type des navires qui ont un volume de produits supérieur au nb de passagers et dont le type commence par un 'V' ou un 'G'
6) Pour chaque navire, retourner le temps moyen de leurs voyages, à condition que le temps moyen soit supérieur à 100 (jours) (ordonné par l'id du navire)
7) Pour chaque nation, retourner le nombre de voyages qui ont pour destination un de ses ports, à condition que ce nombre soit supérieur à 1
8) L'id et le nombre d'occurence de chaque produit dans des cargaisons, à condition que ça soit supérieur à 1
9) Moyenne du nombre de passagers des navires avec le maximum de capacité de passagers (pour chaque nation)
10) La liste des ids des produits (distincts) qui sont présent dans au moins une cargaison (ordre croissant des ids)
11) Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante que leur nationalité initiale (AGGREGATION)
12) Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante que leur nationalité initiale (CORRELEES)
13) La moyenne du volume de produits de tous les navires en utilisant SUM et COUNT
14) La moyenne du volume de produits de tous les navires en utilisant AVG
15) La moyenne du volume de produits de tous les navires en utilisant SUM et COUNT, et en tenant compte des valeures nulls
16) La moyenne du volume de produits de tous les navires en utilisant AVG, et en tenant compte des valeures nulls
17) Paires de villes (A,B), tel qu'on peut aller de A à B en n'importe quel nb d'escales
18) La liste des nations qui ont 2 ports ou plus ainsi que leur nombre de port (trié par ordre croissant de localisation)
19) Les ids des voyages aller/retour, c'est à dire qui ont la provenance et destination identiques
20) Le nombre de cargaisons contenant du rhum ou du tabac
21) Le nombre total de navires qui ont au moins un voyage
22) Le nombre de voyage de chaque navire trié par ordre croissant de navire
23) Le nombre de navires de chaque nation trié par ordre croissant d'id de nation
24) La distance entre deux étapes successives la plus longue 
25) Le nombre total de chaque type de navire
