-- Marraskuun ottelut
SELECT
    o.ottelu_id,
    o.pelipaiva,
    j.kotipaikka AS pelipaikkakunta,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.kotijoukkue_id) AS kotijoukkue,
    t.kotimaalit AS kotimaalit,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.vierasjoukkue_id) AS vierasjoukkue,
    t.vierasmaalit AS vierasmaalit
FROM
    ottelu o
JOIN
    joukkue j ON o.kotijoukkue_id = j.joukkue_id
JOIN
    tulos t ON o.tulos_id = t.tulos_id
WHERE
    o.pelipaiva BETWEEN '2023-11-01' AND '2023-11-30 23:59:59';