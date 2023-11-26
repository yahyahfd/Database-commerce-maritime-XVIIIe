-- une sous-requête dans le FROM
-- L'id et le type des navires qui ont un volume de produits supérieur au nb de passagers et dont le type commence par un 'V' ou un 'G'
SELECT id,type_nav FROM 
(SELECT * FROM navires WHERE volume_produits > nb_passagers) b
WHERE b.type_nav LIKE 'V%' OR b.type_nav LIKE 'G%';
