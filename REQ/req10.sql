-- – une jointure externe (LEFT JOIN, RIGHT JOIN ou FULL JOIN) ;
-- La liste des ids des produits (distincts) qui sont présent dans au moins une cargaison.
SELECT DISTINCT produits FROM cargaison
LEFT JOIN produits ON cargaison.produits = produits.id; 