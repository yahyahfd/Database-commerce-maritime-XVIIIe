-- Une requête qui porte sur au moins trois tables: navires,voyage,port,nations
-- L'id des navires de type commençant par un 'G' de nationalité française et qui ont au moins un voyage qui a pour destination un port Français
(SELECT DISTINCT navires.id FROM navires,voyage WHERE type_nav LIKE 'G%' AND nationalite_courante 
    IN 
        (SELECT id AS nationalite_courante FROM nations WHERE nations.nom = 'France'))
INTERSECT
(SELECT navires.id FROM navires,voyage WHERE navires.id = voyage.navire AND destination 
    IN 
        (SELECT id AS destination FROM nations WHERE nations.nom = 'France'));