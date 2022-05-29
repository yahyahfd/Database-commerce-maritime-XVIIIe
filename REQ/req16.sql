-- deux requêtes qui renverraient le même résultat si vos tables ne contenaient pas
-- de nulls, mais qui renvoient des résultats différents ici (vos données devront donc
-- contenir quelques nulls), vous proposerez  ́egalement de petites modifications de vos
-- requếtes (dans l’esprit de ce qui a  ́eté présenté en cours) afin qu’elles retournent le
-- mếme résultat 
-- La moyenne du volume de produits de tous les navires en utilisant 
-- AVG, et en tenant compte des valeures nulls
SELECT AVG(COALESCE(volume_produits, 0)) AS avg_prod_fixed FROM navires;
