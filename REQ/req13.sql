-- deux requˆetes qui renverraient le mˆeme r ́esultat si vos tables de contenaient pas
-- de nulls, mais qui renvoient des r ́esultats diff ́erents ici (vos donn ́ees devront donc
-- contenir quelques nulls), vous proposerez  ́egalement de petites modifications de vos
-- requˆetes (dans l’esprit de ce qui a  ́et ́e pr ́esent ́e en cours) afin qu’elles retournent le
-- mˆeme r ́esultat
-- 3
-- La moyenne du volume de produits de tous les navires en utilisant SUM et COUNT
SELECT SUM(volume_produits)/COUNT(id)  AS avg_prod FROM navires;
