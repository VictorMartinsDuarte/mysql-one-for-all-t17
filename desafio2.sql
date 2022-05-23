SELECT
  COUNT(DISTINCT so.song_id) AS cancoes,
  COUNT(DISTINCT ar.artist_id) AS artistas,
  COUNT(DISTINCT al.album_id) AS albuns
FROM
  SpotifyClone.artist_songs AS so,
  SpotifyClone.artists AS ar,
  SpotifyClone.albums AS al;