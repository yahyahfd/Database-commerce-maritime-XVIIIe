-- La liste des nations qui ont 2 ports ou plus ainsi que leur nombre de port (trié par ordre croissant de localisation)
SELECT localisation,COUNT(localisation) FROM port
GROUP BY localisation
HAVING COUNT(localisation) >=2
ORDER BY localisation;
