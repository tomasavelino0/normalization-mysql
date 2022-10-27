SELECT
    musi.cancao_name AS nome,
    count(hist.id_musica) AS reproducoes
FROM
    usuario_historico AS hist
    INNER JOIN album_cancoes AS musi ON musi.cancao_id = hist.id_musica
    INNER JOIN usuario AS person ON person.usuario_id = hist.id_usuario
WHERE
    person.plano = 1
    OR person.plano = 4
GROUP BY
    musi.cancao_name
ORDER BY
    musi.cancao_name