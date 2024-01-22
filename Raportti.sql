--Tietokannan rakenne

-- Joukkue-taulu: Sisältää joukkueiden perustiedot
CREATE TABLE joukkue (
    joukkue_id INTEGER PRIMARY KEY, -- Uniikki joukkueen tunniste
    nimi TEXT NOT NULL, -- Joukkueen nimi, ei voi olla tyhjä
    kotipaikka TEXT NOT NULL -- Joukkueen kotipaikka, ei voi olla tyhjä
);

-- Tulos-taulu: Sisältää ottelun tuloksen tiedot
CREATE TABLE tulos (
    tulos_id INTEGER PRIMARY KEY, -- Uniikki tuloksen tunniste
    kotimaalit INTEGER, -- Kotijoukkueen maalimäärä
    vierasmaalit INTEGER, -- Vierasjoukkueen maalimäärä
    ratkaisutapa TEXT -- Ottelun ratkaisutapa (esim., voittolaukauskilpailu)
);

-- Ottelu-taulu: Sisältää otteluiden perustiedot ja viittaukset muihin tauluihin
CREATE TABLE ottelu (
    ottelu_id INTEGER PRIMARY KEY, -- Uniikki ottelun tunniste
    pelipaiva TEXT NOT NULL, -- Ottelun pelipäivä, ei voi olla tyhjä
    kotijoukkue_id INTEGER, -- Viittaus joukkue-tauluun kotijoukkueen osalta
    vierasjoukkue_id INTEGER, -- Viittaus joukkue-tauluun vierasjoukkueen osalta
    tulos_id INTEGER, -- Viittaus tulos-tauluun ottelun tuloksen osalta
    FOREIGN KEY (kotijoukkue_id) REFERENCES joukkue (joukkue_id), -- Määritellään viiteavain
    FOREIGN KEY (vierasjoukkue_id) REFERENCES joukkue (joukkue_id), -- Määritellään viiteavain
    FOREIGN KEY (tulos_id) REFERENCES tulos (tulos_id) -- Määritellään viiteavain
);
--Kysely 1 - Jypin yhteenlaskettu maalimäärä pelatuissa otteluissa:
SELECT joukkue.nimi AS joukkue,
       SUM(COALESCE(tulos.kotimaalit, 0) + COALESCE(tulos.vierasmaalit, 0)) AS maalimaara
FROM ottelu
JOIN joukkue ON ottelu.kotijoukkue_id = joukkue.joukkue_id OR ottelu.vierasjoukkue_id = joukkue.joukkue_id
WHERE joukkue.nimi = 'JYP';

--Kysely 2 - Keskimaarainen maalimaara pelatuissa otteluissa:
SELECT AVG(COALESCE(tulos.kotimaalit, 0) + COALESCE(tulos.vierasmaalit, 0)) AS keskiarvo_maalimaara
FROM ottelu
JOIN tulos ON ottelu.tulos_id = tulos.tulos_id;

--Kysely 3 - Pelatut ottelut, jotka on ratkaistu voittolaukauksella:
SELECT COUNT(*) AS ottelumaara
FROM ottelu
JOIN tulos ON ottelu.tulos_id = tulos.tulos_id
WHERE tulos.ratkaisutapa = 'VL';