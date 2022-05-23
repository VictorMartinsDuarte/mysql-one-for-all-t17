SELECT * FROM 
  (
    SELECT songs AS nome_musica,
      CASE
        WHEN songs LIKE '%Streets' THEN REPLACE (songs, 'Streets', 'Code Review')
        WHEN songs LIKE '%Her Own' THEN REPLACE (songs, 'Her Own', 'Trybe')
        WHEN songs LIKE '%Inner Fire' THEN REPLACE (songs, 'Inner Fire', 'Project')
        WHEN songs LIKE '%Silly' THEN REPLACE (songs, 'Silly', 'Nice')
        WHEN songs LIKE '%Circus' THEN REPLACE (songs, 'Circus', 'Pull Request')
      END AS novo_nome
    FROM SpotifyClone.artist_songs
  ) AS table_result
WHERE novo_nome IS NOT NULL
ORDER BY nome_musica;