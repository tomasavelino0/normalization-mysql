SELECT
    music.cancao_name AS cancao,
    count(historic.id_musica) AS reproducoes
FROM
    album_cancoes AS music
    INNER JOIN usuario_historico AS historic ON music.cancao_id = historic.id_musica
GROUP BY
    music.cancao_id
ORDER BY
    reproducoes DESC,
    cancao
LIMIT
    2;
    