-- deux agrégats nécessitant GROUP BY et HAVING
-- Pour chaque navire, retourner le temps moyen de leurs voyages, à condition que le temps moyen soit supérieur à 100 (jours) (ordonné par l'id du navire)
SELECT navire, AVG(date_fin - date_debut) AS duree_moy FROM voyage
GROUP BY navire
HAVING AVG(date_fin - date_debut) > 100
ORDER BY navire;
