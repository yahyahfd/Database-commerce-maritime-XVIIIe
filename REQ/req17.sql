-- – une requˆete r ́ecursive (par exemple pour reconstituer le trajet effectu ́e par un cer-
-- tain bateau sur un laps de temps recouvrant des voyages diff ́erents).
-- Paires de villes (A,B), tel qu'on peut aller de A à B en n'importe quel nb
-- d'escales
WITH RECURSIVE Access(provenance, destination) AS
(
SELECT * FROM voyage
UNION
SELECT V.provenance, A.destination
FROM voyage V, Access A
WHERE V.destination = A.provenance
)
SELECT * FROM Access ;