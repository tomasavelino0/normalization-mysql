SELECT
    a.artista_name AS artista,
    bum.album AS album,
    COUNT(f.id_artista) AS seguidores
FROM
    artistas AS a
    INNER JOIN albuns AS bum ON a.artista_id = bum.id_artista
    INNER JOIN usuario_seguindo AS f ON a.artista_id = f.id_artista
GROUP BY
    f.id_artista,
    bum.album
ORDER BY
    seguidores DESC,
    a.artista_name,
    bum.album;