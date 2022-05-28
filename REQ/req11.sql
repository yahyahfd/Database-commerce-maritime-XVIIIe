-- Deux requêtes  ́equivalentes exprimant une condition de totalit ́e, l’une avec des sous
-- requêtes correlees et l’autre avec de l’agregation 
-- AGREGATION

-- La liste des ids de nations pour lesquels TOUS les navires ont la même nationalité courante
--  que leur nationalité initiale
SELECT nationalite_initiale 
FROM navires
GROUP BY nationalite_initiale
HAVING count(nationalite_initiale)
=
SELECT cnt FROM
(SELECT nationalite_initiale,count(nationalite_initiale) AS cnt FROM navires 
GROUP BY nationalite_initiale
HAVING nationalite_initiale = nationalite_courante);

-- test
-- SELECT cinema
-- FROM Séance
-- GROUP BY cinéma
-- HAVING count(DISTINCT titre)
-- =
-- (SELECT count(DISTINCT titre) FROM FILM);
