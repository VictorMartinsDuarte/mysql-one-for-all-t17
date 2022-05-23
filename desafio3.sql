SELECT
  us.username AS usuario,
    COUNT(hi.user_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(ar.duration_seconds) / 60, 2) AS total_minutos
FROM 
  SpotifyClone.users AS us
  JOIN SpotifyClone.history AS hi ON hi.user_id = us.user_id
  JOIN SpotifyClone.artist_songs AS ar ON ar.song_id = hi.song_id
GROUP BY usuario;