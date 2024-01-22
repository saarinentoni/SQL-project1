--Montako peliä on mennyt voittolaukauksille
SELECT COUNT(*) AS ottelumaara
FROM ottelu
JOIN tulos ON ottelu.tulos_id = tulos.tulos_id
WHERE tulos.ratkaisutapa = 'VL';