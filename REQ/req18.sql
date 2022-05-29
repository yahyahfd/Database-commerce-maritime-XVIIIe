-- La liste des nations qui ont 5 ports ou moins ainsi que leur nombre de port (trié par ordre croissant de localalisation)
SELECT localisation,COUNT(localisation) FROM port
GROUP BY localisation
HAVING COUNT(localisation) <=5
ORDER BY localisation;