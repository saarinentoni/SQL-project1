--Keskiarvo maalimaara pelatuissa otteluissa
SELECT AVG(COALESCE(tulos.kotimaalit, 0) + COALESCE(tulos.vierasmaalit, 0)) AS keskiarvo_maalimaara
FROM ottelu
JOIN tulos ON ottelu.tulos_id = tulos.tulos_id;