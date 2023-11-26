\! echo requete 1
\! echo "L'id des navires de type commençant par un 'G' de nationalité française et qui ont au moins un voyage qui a pour destination un port Français."
(SELECT DISTINCT navires.id FROM navires,voyage WHERE type_nav LIKE 'G%' AND nationalite_courante 
    IN 
        (SELECT id AS nationalite_courante FROM nations WHERE nations.nom = 'France'))
INTERSECT
(SELECT navires.id FROM navires,voyage WHERE navires.id = voyage.navire AND destination 
    IN 
        (SELECT id AS destination FROM nations WHERE nations.nom = 'France'));

\! echo requete 2
\! echo "Les id de navires dont le volume de produit (max) est aussi un nombre de passagers (trié par ordre croissant d'id)"
SELECT a.id 
FROM (navires a JOIN navires b ON a.volume_produits = b.nb_passagers) 
ORDER BY a.id;

\! echo requete 3
\! echo "Les ids des cargaisons qui contiennent le produit 'Vinaigre' ainsi que sa quantité dans ces cargaisons"
SELECT c.id,c.quantite 
FROM cargaison c, 
    (SELECT id FROM produits p WHERE p.nom = 'Vinaigre') d
WHERE c.produits = d.id;

\! echo requete 4
\! echo "Les ids de navires dont le nombre de passagers est supérieur à la moyenne des passagers de tous les navires"
SELECT id FROM navires
WHERE nb_passagers > (
    SELECT AVG(nb_passagers) FROM navires
);

\! echo requete 5
\! echo "L'id et le type des navires qui ont un volume de produits supérieur au nb de passagers et dont le type commence par un 'V' ou un 'G'"
SELECT id,type_nav 
FROM (SELECT * FROM navires WHERE volume_produits > nb_passagers) b
WHERE b.type_nav LIKE 'V%' OR b.type_nav LIKE 'G%';

\! echo requete 6
\! echo "Pour chaque navire, retourner le temps moyen de leurs voyages, à condition que le temps moyen soit supérieur à 100 (jours) (ordonné par l'id du navire)"
SELECT navire, AVG(date_fin - date_debut) AS duree_moy 
FROM voyage
GROUP BY navire
HAVING AVG(date_fin - date_debut) > 100
ORDER BY navire;

\! echo requete 7
\! echo "Pour chaque nation, retourner le nombre de voyages qui ont pour destination un de ses ports, à condition que ce nombre soit supérieur à 1"
SELECT nom, nb_voyages_dest 
FROM nations
NATURAL JOIN
    (SELECT destination AS id, COUNT(destination) AS nb_voyages_dest 
        FROM voyage
        GROUP BY destination
        HAVING COUNT(destination) > 1) tmp;

\! echo requete 8
\! echo "L'id et le nombre d'occurence de chaque produit dans des cargaisons, à condition que ça soit supérieur à 1"
SELECT produits AS produit_id, COUNT(produits) AS occurence
FROM cargaison
GROUP BY produits
HAVING COUNT(produits)>1;

\! echo requete 9
\! echo "Moyenne du nombre de passagers des navires avec le maximum de capacité de passagers (pour chaque nation)"
SELECT AVG(tmp.max_pass) AS moyenne_passagers 
FROM 
    (SELECT nationalite_courante, MAX(nb_passagers) max_pass 
    FROM navires 
    GROUP BY nationalite_courante) tmp;

\! echo requete 10
\! echo "La liste des ids des produits (distincts) qui sont présent dans au moins une cargaison (ordre croissant des ids)"
SELECT DISTINCT produits 
FROM cargaison
    LEFT JOIN produits 
    ON cargaison.produits = produits.id
ORDER BY produits; 

\! echo requete 11
\! echo "Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante que leur nationalité initiale (aggregation)"
SELECT nationalite_initiale as pays_id 
FROM (SELECT nationalite_initiale, COUNT(nationalite_initiale) 
    FROM navires WHERE nationalite_courante = nationalite_initiale
    GROUP BY nationalite_initiale) A
NATURAL JOIN
    (SELECT nationalite_initiale, COUNT(nationalite_initiale)
    FROM navires
    GROUP BY nationalite_initiale) B
ORDER BY pays_id;

\! echo requete 12
\! echo "Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante que leur nationalité initiale (sous-requête corrélée)"
SELECT nationalite_initiale AS pays_id FROM navires 
EXCEPT
    (SELECT DISTINCT A.nationalite_initiale 
        FROM navires A,
            (SELECT DISTINCT nationalite_initiale
            FROM navires WHERE nationalite_courante <> nationalite_initiale) B
            WHERE A.nationalite_initiale = B.nationalite_initiale)
ORDER BY pays_id;

\! echo requete 13
\! echo "La moyenne du volume de produits de tous les navires en utilisant SUM et COUNT" 
SELECT SUM(volume_produits)/COUNT(id) AS avg_prod 
FROM navires;

\! echo requete 14
\! echo "La moyenne du volume de produits de tous les navires en utilisant AVG" 
SELECT AVG(volume_produits) AS avg_prod 
FROM navires;

\! echo requete 15
\! echo "La moyenne du volume de produits de tous les navires en utilisant SUM et COUNT et en tenant compte des valeures nulls" 
SELECT SUM(COALESCE(volume_produits,0))/COUNT(id) AS avg_prod_fixed FROM navires;

\! echo requete 16
\! echo "La moyenne du volume de produits de tous les navires en utilisant AVG, et en tenant compte des valeures nulls" 
SELECT AVG(COALESCE(volume_produits, 0)) AS avg_prod_fixed FROM navires;

\! echo requete 17
\! echo "Paires de villes (A,B), tel qu'on peut aller de A à B en n'importe quel nombre d'escales" 
WITH RECURSIVE Access(provenance, destination) AS
    (
        SELECT provenance,destination FROM voyage
            UNION
        SELECT V.provenance, A.destination
        FROM voyage V, Access A
        WHERE V.destination = A.provenance
    )
SELECT * FROM Access 
ORDER BY provenance;

\! echo requete 18
\! echo "La liste des nations qui ont 2 ports ou plus ainsi que leur nombre de port (trié par ordre croissant de localisation)"
SELECT localisation,COUNT(localisation) FROM port
GROUP BY localisation
HAVING COUNT(localisation) >=2
ORDER BY localisation;

\! echo requete 19
\! echo "Les ids des voyages aller/retour, c'est à dire qui ont la provenance et destination identiques"
SELECT id FROM voyage
WHERE provenance = destination;

\! echo requete 20
\! echo "le nombre de cargaisons contenant du rhum ou du tabac"
SELECT COUNT(id) 
FROM cargaison
WHERE produits 
    IN 
    (SELECT id AS produits FROM produits
    WHERE nom = 'Rhum' OR nom = 'Tabac');

\! echo requete 21
\! echo "Le nombre total de navires qui ont au moins un voyage"
SELECT COUNT (DISTINCT navire) FROM voyage;

\! echo requete 22
\! echo "Le nombre de voyage de chaque navire trié par ordre croissant d'id de navire"
SELECT navire, COUNT(navire) FROM voyage
GROUP BY navire
ORDER BY navire;

\! echo requete 23
\! echo "Le nombre de navires de chaque nation trié par ordre croissant d'id de nation"
SELECT nationalite_courante AS nation, COUNT(nationalite_courante)
FROM navires
GROUP BY nationalite_courante
ORDER BY nationalite_courante;

\! echo requete 24
\! echo "La distance entre deux étapes successives la plus longue"
SELECT MAX(distance_suiv) FROM etape;

\! echo requete 25
\! echo "Le nombre total de chaque type de navire"
SELECT type_nav, COUNT(type_nav) FROM navires
GROUP BY type_nav;
