CREATE TABLE casen (
    id_vivienda INT NOT NULL,
    folio INT NOT NULL,
    id_persona INT NOT NULL,
    region INT NOT NULL,
    area INT NOT NULL,
    edad INT NOT NULL,
    sexo INT NOT NULL,
    yoprcor DECIMAL(15,2),  -- Puede contener valores NULL
    ten_viv INT NOT NULL,
    activ DECIMAL(5,2), -- Puede contener decimales pequeños (como 3.0, 1.0)
    pobreza DECIMAL(5,2) -- Puede contener valores decimales pequeños
);

-- 1️⃣ CREAR TABLA PARA ANÁLISIS DE INGRESOS
DROP TABLE IF EXISTS casen_ingresos;
CREATE TABLE casen_ingresos (
    id_vivienda INTEGER,
    folio INTEGER,
    id_persona INTEGER,
    region INTEGER,
    area INTEGER,
    edad INTEGER,
    sexo INTEGER,
    yoprcor NUMERIC(15,2),  -- Solo ingresos válidos, sin NULL
    ten_viv INTEGER,
    activ INTEGER
);

INSERT INTO casen_ingresos
SELECT 
    id_vivienda,
    folio,
    id_persona,
    region,
    area,
    edad,
    sexo,
    yoprcor,  -- Solo valores válidos
    ten_viv,
    activ
FROM casen
WHERE 
    activ = 1  -- Solo personas activas
    AND yoprcor IS NOT NULL; -- Excluimos NULL en ingresos

-- 2️⃣ CREAR TABLA PARA ANÁLISIS DE POBREZA
DROP TABLE IF EXISTS casen_pobreza;
CREATE TABLE casen_pobreza (
    id_vivienda INTEGER,
    folio INTEGER,
    id_persona INTEGER,
    region INTEGER,
    area INTEGER,
    edad INTEGER,
    sexo INTEGER,
    yoprcor NUMERIC(15,2),  -- Puede ser NULL porque no importa en pobreza
    ten_viv INTEGER,
    activ INTEGER,
    pobreza INTEGER  -- Clave para el análisis de pobreza
);

INSERT INTO casen_pobreza
SELECT 
    id_vivienda,
    folio,
    id_persona,
    region,
    area,
    edad,
    sexo,
    yoprcor,  -- Puede ser NULL
    ten_viv,
    activ,
    pobreza
FROM casen
WHERE 
    pobreza IS NOT NULL; -- Aseguramos datos válidos en pobreza