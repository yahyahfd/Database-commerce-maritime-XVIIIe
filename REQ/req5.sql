-- – une sous-requête dans le FROM ;
-- L'id des navires qui ont un volume de produits supérieur au nb de passagers et dont le type est Galion
SELECT id,type_nav FROM 
(SELECT * FROM navires WHERE volume_produits > nb_passagers)
WHERE type_nav="Galion";

-- test if works