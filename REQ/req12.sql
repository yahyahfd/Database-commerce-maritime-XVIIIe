-- Deux requêtes  ́equivalentes exprimant une condition de totalité, l’une avec des sous
-- requêtes correlees et l’autre avec de l’agregation 
-- CORRELEES

-- Les ids de nations pour lesquels TOUS les navires ont la même nationalité courante
-- que leur nationalité initiale
SELECT nationalite_initiale AS pays_id FROM navires 
EXCEPT
    (SELECT DISTINCT A.nationalite_initiale 
        FROM navires A,
            (SELECT DISTINCT nationalite_initiale
            FROM navires WHERE nationalite_courante <> nationalite_initiale) B
            WHERE A.nationalite_initiale = B.nationalite_initiale)
ORDER BY pays_id;
