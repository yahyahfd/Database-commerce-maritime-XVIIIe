-- une sous-requête dans le WHERE ;
-- Les ids de navires dont le nombre de passagers est supérieur à la moyenne des passagers de tous les navires ;
SELECT id FROM navires
WHERE nb_passagers > (
    SELECT AVG(nb_passagers) FROM navires
);