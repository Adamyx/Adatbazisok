-- 1. ADATBÁZIS LÉTREHOZÁSA ÉS KIVÁLASZTÁSA
CREATE DATABASE IF NOT EXISTS iskola_db
CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;

USE iskola_db;

-- ---------------------------------------------------------
-- 2. KORÁBBI TÁBLÁK TÖRLÉSE (HA LÉTEZNEK)
-- ---------------------------------------------------------
DROP TABLE IF EXISTS jelentkezesek;
DROP TABLE IF EXISTS diakok;

-- ---------------------------------------------------------
-- 3. TÁBLÁK LÉTREHOZÁSA
-- ---------------------------------------------------------
-- Fő tábla létrehozása (Diákok adatai)
CREATE TABLE diakok (
    id INT PRIMARY KEY,                       
    nev VARCHAR(50) NOT NULL,                 
    email VARCHAR(100) UNIQUE,                
    eletkor INT CHECK (eletkor >= 18),        
    statusz VARCHAR(20) DEFAULT 'aktív'       
);

-- ----------------------------------------------------------
-- 4. Kapcsolódó tábla létrehozása (A FOREIGN KEY bemutatásához)
-- ----------------------------------------------------------
CREATE TABLE jelentkezesek (
    jelentkezes_id INT PRIMARY KEY,           
    diak_id INT,                              
    FOREIGN KEY (diak_id) REFERENCES diakok(id) 
);

-- ---------------------------------------------------------
-- 5. ALAP ADATOK FELVITELE
-- ---------------------------------------------------------
INSERT INTO diakok (id, nev, email, eletkor, statusz) 
VALUES (1, 'Kovács Péter', 'peter@example.com', 20, 'aktív');

INSERT INTO diakok (id, nev, email, eletkor) 
VALUES (2, 'Nagy Anna', 'anna@example.com', 19);

INSERT INTO jelentkezesek (jelentkezes_id, diak_id) VALUES (101, 1);
INSERT INTO jelentkezesek (jelentkezes_id, diak_id) VALUES (102, 2);

-- ---------------------------------------------------------
-- 6. TESZT ADATOK
-- ---------------------------------------------------------
INSERT INTO diakok (id, nev, email, eletkor) 
VALUES (3, 'Szabó Gábor', 'gabor@example.com', 22);

INSERT INTO diakok (id, nev, email, eletkor) 
VALUES (4, 'Kovács Kitti', 'kitti@example.com', 21);

INSERT INTO diakok (id, nev, email, eletkor) 
VALUES (5, 'Tóth Zoltán', 'zoltan@example.com', 25);

INSERT INTO diakok (id, nev, email, eletkor) 
VALUES (6, 'Kis Bence', 'bence@example.com', 18);

INSERT INTO jelentkezesek (jelentkezes_id, diak_id) 
VALUES (103, 3);

-- ---------------------------------------------------------
-- 7. AZ EREDMÉNYEK MEGTEKINTÉSE
-- ---------------------------------------------------------
SELECT * FROM diakok;
SELECT * FROM jelentkezesek;