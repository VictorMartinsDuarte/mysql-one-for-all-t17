SELECT
  us.username AS usuario,
  IF(
    MAX(hi.reproduction_history) LIKE '2021%',
    'Usuário ativo', 'Usuário inativo'
) AS condicao_usuario
FROM
  SpotifyClone.users AS us
JOIN SpotifyClone.history AS hi ON hi.user_id = us.user_id
GROUP BY usuario;