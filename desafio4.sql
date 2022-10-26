SELECT
    person.usuario_name AS usuario,
    if(
        max(YEAR(data_reproducao)) > 2020,
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM
    usuario AS person
    INNER JOIN usuario_historico AS historic ON historic.id_usuario = person.usuario_id
GROUP BY
    person.usuario_name
ORDER BY
    person.usuario_name;