-- Tapparan kotiottelut
SELECT
    o.pelipaiva,
    j.kotipaikka AS pelipaikkakunta,
    'Tappara' AS kotijoukkue,
    (SELECT nimi FROM joukkue WHERE joukkue_id = o.vierasjoukkue_id) AS vierasjoukkue
FROM
    ottelu o
JOIN
    joukkue j ON o.kotijoukkue_id = j.joukkue_id
WHERE
    j.nimi = 'Tappara';