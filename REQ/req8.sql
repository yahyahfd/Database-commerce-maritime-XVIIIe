-- – deux agrégats nécessitant GROUP BY et HAVING ;
-- Le nombre d'occurence de chaque produit dans des cargaisons, à condition que ça soit supérieur à 5;
SELECT produits.id, COUNT(a.id) AS cnt
FROM produits,(SELECT produits AS id FROM cargaison) AS a
GROUP BY produits.id
HAVING cnt > 5;