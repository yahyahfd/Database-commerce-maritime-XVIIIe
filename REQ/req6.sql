-- – deux agrégats nécessitant GROUP BY et HAVING ;
-- Pour chaque navire, retourner le temps moyen de leurs voyages, à condition que le temps moyen soit inférieur ou égal à 3;
SELECT navire, AVG(date_fin - date_debut) AS duree_moy FROM voyage
GROUP BY navire
HAVING duree_moy <= 3;
