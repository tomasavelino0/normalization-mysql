SELECT
    person.usuario_name AS usuario,
    COUNT(histor.id_musica) AS qt_de_musicas_ouvidas,
    ROUND(SUM(music.duracao_segundos) / 60, 2) AS total_minutos
FROM
    usuario_historico AS histor
    INNER JOIN usuario AS person ON person.usuario_id = histor.id_usuario
    INNER JOIN album_cancoes AS music ON music.cancao_id = histor.id_musica
GROUP BY
    person.usuario_id
ORDER BY
    person.usuario_name;