-- – une requête récursive (par exemple pour reconstituer le trajet effectué par un cer-
-- tain bateau sur un laps de temps recouvrant des voyages différents).
-- Paires de villes (A,B), tel qu'on peut aller de A à B en n'importe quel nb
-- d'escales
WITH RECURSIVE Access(provenance, destination) AS
    (
        SELECT provenance,destination FROM voyage
            UNION
        SELECT V.provenance, A.destination
        FROM voyage V, Access A
        WHERE V.destination = A.provenance
    )
SELECT * FROM Access 
ORDER BY provenance;
