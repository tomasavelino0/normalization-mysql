SELECT
    COUNT(hist.data_reproducao) AS quantidade_musicas_no_historico
FROM
    usuario AS person
    INNER JOIN usuario_historico AS hist ON person.usuario_id = hist.id_usuario
WHERE
    person.usuario_name = 'Barbara Liskov';