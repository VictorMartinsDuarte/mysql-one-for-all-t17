SELECT
  COUNT(us.username) AS quantidade_musicas_no_historico
FROM
  SpotifyClone.history AS hi
JOIN SpotifyClone.users AS us ON us.user_id = hi.user_id
WHERE us.username = 'Bill';