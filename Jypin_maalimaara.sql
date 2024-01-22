--Kysely Jypin yhteenlaskettu maalimäärä

SELECT
    joukkue.nimi AS joukkue,
    SUM(COALESCE(tulos.kotimaalit, 0) + COALESCE(tulos.vierasmaalit, 0)) AS maalimaara
FROM
    ottelu
JOIN joukkue ON ottelu.kotijoukkue_id = joukkue.joukkue_id OR ottelu.vierasjoukkue_id = joukkue.joukkue_id
JOIN tulos ON ottelu.tulos_id = tulos.tulos_id
WHERE
    joukkue.nimi = 'JYP';  