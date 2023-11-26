-- Deux requêtes ́equivalentes exprimant une condition de totalité, l’une avec des sous
-- requêtes correlées et l’autre avec de l’agregation 
-- AGREGATION

-- Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante
-- que leur nationalité initiale
SELECT nationalite_initiale as pays_id FROM (SELECT nationalite_initiale, COUNT(nationalite_initiale) 
FROM navires WHERE nationalite_courante = nationalite_initiale
GROUP BY nationalite_initiale) A
NATURAL JOIN
(SELECT nationalite_initiale, COUNT(nationalite_initiale)
FROM navires
GROUP BY nationalite_initiale) B
ORDER BY pays_id;
