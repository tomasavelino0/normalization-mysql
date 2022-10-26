SELECT
    a.artista_name AS artista,
    bum.album AS album
FROM
    artistas AS a
    INNER JOIN albuns AS bum ON a.artista_id = bum.id_artista
WHERE
    a.artista_name = 'Elis Regina'
ORDER BY
    bum.album;