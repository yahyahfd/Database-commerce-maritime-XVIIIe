-- La liste des nations qui ont 5 ports ou moins ainsi que leur nombre de port
SELECT localisation,COUNT(localisation) AS cnt FROM port
GROUP BY localisation
HAVING cnt<=5;