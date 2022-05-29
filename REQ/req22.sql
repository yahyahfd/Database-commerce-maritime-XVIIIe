-- le nombre de voyage de chaque navire trié par ordre croissant de navire
SELECT navire, COUNT(navire) FROM voyage
GROUP BY navire
ORDER BY navire;