-- Les ids des voyages aller/retour, c'est à dire qui ont la provenance
-- et destination identiques
SELECT id FROM voyage
WHERE provenance = destination;