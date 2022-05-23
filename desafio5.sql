SELECT
  ar.songs AS cancao,
  COUNT(hi.song_id) AS reproducoes
FROM
  SpotifyClone.artist_songs AS ar
JOIN SpotifyClone.history AS hi ON ar.song_id = hi.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;