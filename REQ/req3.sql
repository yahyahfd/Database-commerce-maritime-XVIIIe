-- une sous-requête corrélée ;
-- Les ids des cargaisons qui contiennent le produit 'Vinaigre' ainsi que sa quantité dans ces cargaisons;
SELECT c.id,c.quantite FROM cargaison c, (SELECT id FROM produits p WHERE p.nom = 'Vinaigre') d
WHERE c.produits = d.id;
