SELECT
  ar.songs AS nome,
  COUNT(hi.song_id) AS reproducoes
FROM
  SpotifyClone.history AS hi
JOIN SpotifyClone.artist_songs AS ar ON ar.song_id = hi.song_id
JOIN SpotifyClone.users AS us ON us.user_id = hi.user_id
WHERE us.plan_id IN (1, 4)
GROUP BY ar.songs;