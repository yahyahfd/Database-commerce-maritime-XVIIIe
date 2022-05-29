-- Le nombre total de chaque type de navire
SELECT type_nav, COUNT(type_nav) FROM navires
GROUP BY type_nav;
