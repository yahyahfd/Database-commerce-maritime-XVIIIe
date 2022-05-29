-- le navire qui a le plus de voyages
SELECT navire, COUNT(navire) FROM voyage
GROUP BY navire;