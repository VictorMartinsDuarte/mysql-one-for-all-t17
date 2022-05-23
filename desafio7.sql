SELECT
  ar.artist_name AS artista,
  al.album_name AS album,
  COUNT(fl.artist_id) AS seguidores
FROM
  SpotifyClone.artists AS ar
JOIN SpotifyClone.albums AS al ON ar.artist_id = al.artist_id
JOIN SpotifyClone.followed_artists AS fl ON ar.artist_id = fl.artist_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;