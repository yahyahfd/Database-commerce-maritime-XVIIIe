-- deux agrégats nécessitant GROUP BY et HAVING ;
-- Pour chaque nation, retourner le nombre de voyages qui ont pour destination un de ses ports, à condition que ce nombre soit supérieur à 1;
SELECT nom, nb_voyages_dest FROM nations
NATURAL JOIN
(SELECT destination AS id, COUNT(destination) AS nb_voyages_dest 
    FROM voyage
    GROUP BY destination
    HAVING COUNT(destination) > 1) tmp;
