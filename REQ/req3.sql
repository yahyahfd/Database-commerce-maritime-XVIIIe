-- une sous-requête corrélée ;
-- Les ids des cargaisons qui contiennent le produit "Orange" ainsi que sa quantité dans ces cargaisons;
SELECT c.id,c.quantite FROM cargaison c, (SELECT id FROM produits p WHERE p.nom = "Orange") d
WHERE c.produit = d.id;