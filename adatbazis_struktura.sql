-- MySQL Tábla Létrehozása SQL korlátozások (Constraints) bemutatásával

-- Fő tábla létrehozása (Diákok adatai)
CREATE TABLE diakok (
    id INT PRIMARY KEY,                       -- PRIMARY KEY: Egyedi azonosító, nem lehet NULL
    nev VARCHAR(50) NOT NULL,                 -- NOT NULL: Kötelező megadni a nevet
    email VARCHAR(100) UNIQUE,                -- UNIQUE: Nem szerepelhet kétszer ugyanaz az email
    eletkor INT CHECK (eletkor >= 18),        -- CHECK: Csak 18 évnél idősebbek regisztrálhatnak
    statusz VARCHAR(20) DEFAULT 'aktív'       -- DEFAULT: Ha nem adjuk meg, alapértelmezetten 'aktív'
);

-- Kapcsolódó tábla létrehozása (A FOREIGN KEY bemutatásához)
CREATE TABLE jelentkezesek (
    jelentkezes_id INT PRIMARY KEY,           -- Elsődleges kulcs a jelentkezésekhez
    diak_id INT,                              -- Kapcsoló mező a diakok táblához
    FOREIGN KEY (diak_id) REFERENCES diakok(id) -- FOREIGN KEY: Összeköti a két táblát az id alapján
);
