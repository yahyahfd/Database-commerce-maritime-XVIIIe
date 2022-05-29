-- – une ’auto jointure’ (jointure de deux copies d’une mˆeme table)
-- Les id de navires dont le volume de produit (max) est aussi un nombre de passagers
SELECT a.id FROM (navires a JOIN navires b ON a.volume_produits = b.nb_passagers);