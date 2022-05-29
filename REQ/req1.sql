-- Une requête qui porte sur au moins trois tables: navires,voyage,port,nations;
-- L'id des navires de type Galion de nationalité française et qui ont au moins un voyage qui a pour destination un port Français.
CREATE VIEW id_france AS (SELECT id FROM nations WHERE nations.nom = "France");
(SELECT navires.id FROM navires,voyage WHERE type_nav="Galion" AND nationalite_courante AS id IN (id_france))
INTERSECT
(SELECT navires.id FROM navires,voyage WHERE navires.id = voyage.navire AND destination AS id IN (id_france));