-- deux requêtes qui renverraient le même résultat si vos tables ne contenaient pas
-- de nulls, mais qui renvoient des résultats différents ici (vos données devront donc
-- contenir quelques nulls), vous proposerez  ́egalement de petites modifications de vos
-- requếtes (dans l’esprit de ce qui a  ́eté présenté en cours) afin qu’elles retournent le
-- mếme résultat 
-- La moyenne du volume de produits de tous les navires en utilisant AVG
SELECT AVG(volume_produits) AS avg_prod FROM navires;
