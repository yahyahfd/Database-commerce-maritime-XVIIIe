#Modélisation Projet BDD EKIP
###Introduction du projet
Nous avons choisi de modéliser une base de donnée d'un site de vente de matériel éléctronique de haute gamme. Notre site prévoit de vendre notamment des téléphones, des casques et des tablettes.

###Description des classes

######*Classe Produits*:
Tout d'abord, la classe au centre et celle des *Produits*. Comme toutes les classes, elle contient d'abord un id unique qui fait office de clef primaire. Elle contient les différentes informations nécéssaires afin d'identifier chaque produit (nom, prix, dimensions, poids, disponibilité).
La disponibilité est un entier allant de 0 à 3:
* 0: En stock
* 1: Disponible sur commande
* 2: Temporairement indisponible

######*Classe Clients*:
La classe *Clients* est aussi importante que celle des *Produits*. Elle représente les comptes clients, sans quoi une commande ne peut être effectuée. Elle contient les différentes informations nécéssaires afin d'identifier chaque client (nom, prénom, adresse, mail, numéro de téléphone _facultatif_, mot de passe, l'id du panier)
Pour se connecter, il faudra utiliser le mail et le mot de passe spécifiés.
L'id du panier est NULL par défaut et changera en une valeur au moment de la commande.

######*Classe Achat*:
La classe *Achat* représente les articles ajoutés à un panier, existant, s'il ne s'agit pas du premier produit ajouté, ou non. Dans le cas où il s'agit du premier ajout, un nouveau panier est créé (classe *Panier*). Cette classe contient l'id de l'achat, l'id du produit ajouté, ainsi que sa quantité, et enfin l'id du panier concerné. Un compte n'est pas requis afin de remplir un panier, mais il est nécessaire d'en avoir un au moment de la commande.

######*Classe Panier*:
Cette classe est très simple puisqu'elle ne contient qu'un id ainsi qu'une date de création de ce panier, afin de permettre sa supression automatique après une certaine durée.

######*Classe Commandes*:
Cette classe est la plus complexe. Elle requiert l'id d'un client ainsi que l'id du panier qui lui appartient. Elle contient également un id unique, une date de lancement de la commande, une adresse de livraison (par défaut elle est identique à l'adresse de facturation qui est l'adresse du client), une raison de retour de la commande dans le cas échéant, un status de la livraison pour que le client puisse suivre son état, et enfin que le status du paiement de la commande.
Concernant la raison de retour, celle-ci est par défaut NULL, mais ne peut changer qu'en cas de retour de commande.
Concernant le status du paiement, il est représenté comme suit:
* 0: FALSE: non payé
* 1: Chèque
* 2: Paiement par Internet
* 3: Paiement par Carte (retrait, pas de livraison)

Le status de la commande est comme suit:
* 0: En cours de traitement
* 1: En chemin vers l'adresse de livraison
* 2: Prêt pour un retrait

######*Classe Avis*:
Cette classe permet à un client avec une commande terminé de pouvoir donner son avis sur un produit commandé. Elle contient un id unique, l'id du produit concerné, l'id du client, l'avis de client, et le nombre d'étoile qu'il donne au produit (entre 0 et 5 étoiles).


###Quelques précisions
Chaque client a son panier unique, qui est le même spécifié pour la commande qui le concerne et qui est spécifié dans la classe *Achat*.
