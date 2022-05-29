-- – deux agrégats nécessitant GROUP BY et HAVING ;
-- L'id et le nombre d'occurence de chaque produit dans des cargaisons, à condition que ça soit supérieur à 1;
SELECT produits AS produit_id, COUNT(produits) AS occurence
FROM cargaison
GROUP BY produits
HAVING COUNT(produits)>1;