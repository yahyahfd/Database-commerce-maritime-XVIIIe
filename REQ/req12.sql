-- Deux requêtes  ́equivalentes exprimant une condition de totalit ́e, l’une avec des sous
-- requêtes correlees et l’autre avec de l’agregation 
-- CORRELEES

-- La liste des ids de nations pour lesquels TOUS les navires ont la même nationalité courante
--  que leur nationalité initiale
SELECT a.nationalite_initiale FROM navires a,
(SELECT nationalite_initiale,count(nationalite_initiale) AS cnt FROM navires
GROUP BY nationalite_initiale
HAVING nationalite_initiale = nationalite_courante) b
WHERE count(a.nationalite_initiale) = b.cnt;
-- test
