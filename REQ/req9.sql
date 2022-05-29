-- une requête impliquant le calcul de deux agrégats (par exemple, les moyennes d’un
-- ensemble de maximums)
-- Moyenne du nombre de passagers des navires avec le maximum de capacité de passagers (pour chaque nation)
SELECT AVG(tmp.max_pass) AS moyenne_passagers FROM 
(SELECT nationalite_courante, MAX(nb_passagers) max_pass 
FROM navires GROUP BY nationalite_courante) tmp;
