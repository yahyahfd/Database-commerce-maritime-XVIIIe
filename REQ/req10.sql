-- une jointure externe (LEFT JOIN, RIGHT JOIN ou FULL JOIN) ;
-- La liste des ids des produits (distincts) qui sont présent dans au moins une cargaison (ordre croissant des ids).
SELECT DISTINCT produits FROM cargaison
LEFT JOIN produits ON cargaison.produits = produits.id
ORDER BY produits; 