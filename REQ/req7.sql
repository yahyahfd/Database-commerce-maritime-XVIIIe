-- – deux agrégats nécessitant GROUP BY et HAVING ;
-- Pour chaque nation, retourner le nombre de voyages qui ont pour destination un de ses ports, à condition que ce nombre soit supérieur à 1;
SELECT DISTINCT nations.nom AS nation,tmp.cnt AS nb_voyages_dest FROM nations,port,
(SELECT destination, COUNT(destination) AS cnt FROM voyage
GROUP BY destination
HAVING COUNT(destination)  > 1) tmp
WHERE nations.id = port.localisation;