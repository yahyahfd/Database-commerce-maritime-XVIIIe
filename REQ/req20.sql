-- le nombre de cargaisons contenant du rhum ou du tabac
SELECT COUNT(id) FROM cargaison
WHERE produits as id_prod 
IN 
(SELECT id AS id_prod FROM produits
WHERE nom = "Rhum" OR nom = "Tabac");