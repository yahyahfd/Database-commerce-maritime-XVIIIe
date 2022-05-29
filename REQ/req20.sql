-- le nombre de cargaisons contenant du rhum ou du tabac
SELECT COUNT(id) FROM cargaison
WHERE produits 
IN 
(SELECT id AS produits FROM produits
WHERE nom = 'Rhum' OR nom = 'Tabac');
