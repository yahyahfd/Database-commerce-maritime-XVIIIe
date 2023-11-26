drop table if exists navires cascade;
drop table if exists cargaison cascade;
drop table if exists produits cascade;
drop table if exists nations cascade;
drop table if exists relation cascade;
drop table if exists port cascade;
drop table if exists voyage cascade;
drop table if exists etape cascade;

create table nations (
  id int primary key,
  nom text NOT NULL,
  continent text NOT NULL
);

create table produits (
  id int primary key,
  nom text NOT NULL,
  attribut text NOT NULL,
  duree int, -- des détails pas obligatoire
  valeur_kilo double precision
);

create table port (
  id int primary key,
  nom text,
  localisation int,
  categorie int NOT NULL CONSTRAINT categorie_port CHECK (categorie > 0 AND categorie <=5),

  FOREIGN KEY (localisation) REFERENCES nations(id)
);

create table navires (
  id int primary key,
  type_nav text NOT NULL,
  categorie int NOT NULL CONSTRAINT nav_cat CHECK (categorie > 0 AND categorie <=5),
  volume_produits int,
  nb_passagers int NOT NULL,
  nationalite_initiale int NOT NULL,
  nationalite_courante int NOT NULL,

  FOREIGN KEY (nationalite_initiale) REFERENCES nations(id),
  FOREIGN KEY (nationalite_courante) REFERENCES nations(id)
);

create table cargaison (
  id int primary key,
  navire int NOT NULL,
  produits int, -- si la cargaison est vide c'est NULL
  quantite int,
  volume int,

  FOREIGN KEY (navire) REFERENCES navires(id),
  FOREIGN KEY (produits) REFERENCES produits(id)
);

create table etape (
  id int primary key,
  suivant int, -- si c'est la premiere ou derniere etape ca peut etre NULL
  precedent int,
  achat int, -- achat vente monte descente pas obligatoire
  vente int,
  monte int,
  descente int,
  distance_suiv int,

  FOREIGN KEY (achat) REFERENCES cargaison(id),
  FOREIGN KEY (vente) REFERENCES cargaison(id)
);

create table relation(
  paysA int NOT NULL,
  paysB int NOT NULL,
  relation text NOT NULL,

  CONSTRAINT pas_meme_pays CHECK (paysA != paysB),

  PRIMARY KEY (paysA,paysB),
  FOREIGN KEY (paysA) REFERENCES nations(id),
  FOREIGN KEY (paysB) REFERENCES nations(id)
);

create table voyage(
  id int primary key,
  navire int NOT NULL,
  provenance int NOT NULL,
  destination int NOT NULL,
  date_debut date NOT NULL,
  date_fin date, -- en cas de prise de navire il n'arrive jamais à destination
  premiere_etape int, -- pas forcement d'étape
  distance int NOT NULL,

  FOREIGN KEY (navire) REFERENCES navires(id),
  FOREIGN KEY (provenance) REFERENCES port(id),
  FOREIGN KEY (destination) REFERENCES port(id),
  FOREIGN KEY (premiere_etape) REFERENCES etape(id)
);
