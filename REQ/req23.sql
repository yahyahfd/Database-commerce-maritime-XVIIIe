-- Le nombre de navires de chaque nation trié par ordre croissant d'id de nation
SELECT nationalite_courante AS nation, COUNT(nationalite_courante)
FROM navires
GROUP BY nationalite_courante
ORDER BY nationalite_courante;
