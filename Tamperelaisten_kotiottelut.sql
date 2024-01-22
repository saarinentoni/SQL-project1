-- Tamperelaisten kotiottelut
SELECT
    o.pelipaiva,
    j.kotipaikka AS pelipaikkakunta,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.kotijoukkue_id) AS kotijoukkue,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.vierasjoukkue_id) AS vierasjoukkue
FROM
    ottelu o
JOIN
    joukkue j ON o.kotijoukkue_id = j.joukkue_id
WHERE
    j.kotipaikka = 'Tampere'
UNION
SELECT
    o.pelipaiva,
    j.kotipaikka AS pelipaikkakunta,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.vierasjoukkue_id) AS kotijoukkue,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.kotijoukkue_id) AS vierasjoukkue
FROM
    ottelu o
JOIN
    joukkue j ON o.vierasjoukkue_id = j.joukkue_id
WHERE
    j.kotipaikka = 'Tampere';