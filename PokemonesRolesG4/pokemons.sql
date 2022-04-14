\c mrcoco
DROP DATABASE pokemones;
CREATE DATABASE pokemones;
\c pokemones

CREATE TABLE pokemones(
    pokedex SERIAL,
    nombre VARCHAR(30),
    tipo1 VARCHAR(20),
    tipo2 VARCHAR(20),
    PRIMARY KEY(pokedex)
);

\copy pokemones FROM 'pokemonesKanto.csv' csv header;

CREATE TABLE mis_pokemones(
    pokedex INT,
    fecha_captura DATE,
    lugar VARCHAR(30),
    huevo BOOLEAN,
    peso FLOAT,
    estatura FLOAT,
    FOREIGN KEY (pokedex) REFERENCES pokemones(pokedex)
);


\copy mis_pokemones FROM 'mis_pokemones.csv' csv header;


-- SELECT * FROM mis_pokemones;
-- SELECT * FROM pokemones;

SELECT * FROM pokemones
JOIN mis_pokemones
ON pokemones.pokedex = mis_pokemones.pokedex;


--necesitamos saber que pokemones no tenemos
-- como dice saber que pokemones no tenemos mostramos info de pokemones

-- SELECT pokemones.*
-- FROM pokemones
-- LEFT JOIN mis_pokemones
-- ON pokemones.pokedex = mis_pokemones.pokedex
-- WHERE mis_pokemones.pokedex IS NULL;

-- SELECT *
-- FROM mis_pokemones
-- FULL OUTER JOIN pokemones
-- ON mis_pokemones.pokedex = pokemones.pokedex;

SELECT nombre
FROM pokemones
WHERE pokedex 
IN (SELECT DISTINCT pokedex
FROM mis_pokemones)


