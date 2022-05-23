DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.plans (
  plan_id INT NOT NULL AUTO_INCREMENT,
  plan_info VARCHAR(30),
  plan_value DECIMAL(4,2),
  PRIMARY KEY (plan_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.users (
  user_id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  signature_date DATE,
  PRIMARY KEY (user_id),
  FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
  artist_id INT NOT NULL AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (artist_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.albums (
  album_id INT NOT NULL AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  launch_year INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.artist_songs (
  song_id INT NOT NULL AUTO_INCREMENT,
  songs VARCHAR(150) NOT NULL,
  album_id INT NOT NULL,
  duration_seconds INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (song_id),
  FOREIGN KEY (album_id) REFERENCES albums (album_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.followed_artists (
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.history (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  artist_id INT NOT NULL,
  reproduction_history DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, song_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
  FOREIGN KEY (song_id) REFERENCES artist_songs (song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_info, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (username, age, plan_id, signature_date)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 3, '2019-06-05'),
  ('Roger', 45, 4, '2020-05-13'),
  ('Norman', 58, 4, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 3, '2018-01-05'),
  ('Carol', 19, 3, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.albums (album_name, artist_id, launch_year)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant', 1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture', 4, 2001),
  ('Library of liberty', 4, 2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees', 5, 2015),
  ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.artist_songs (songs, album_id, duration_seconds, artist_id)
VALUES
  ('Soul For Us', 1, 200, 1),
  ('Reflections of Magic', 1, 163, 1),
  ('Dance With Her Own', 1, 116, 1),
  ('Troubles of My Inner Fire', 2, 203, 1),
  ('Time Fireworks', 2, 152, 1),
  ('Magic Circus', 3, 105, 2),
  ('Honey, So Do I', 3, 207, 2),
  ("Sweetie, Let's Go Wild", 3, 139, 2),
  ('She Knows', 3, 244, 2),
  ('Fantasy For Me', 4, 100, 3),
  ('Celebration of More', 4, 146, 3),
  ('Rock His Everything', 4, 223, 3),
  ('Home Forever', 4, 231, 3),
  ('Diamond Power', 4, 241, 3),
  ("Let's Be Silly", 4, 132, 3),
  ('Thang Of Thunder', 5, 240, 4),
  ('Words Of Her Life', 5, 185, 4),
  ('Without My Streets', 5, 176, 4),
  ('Need Of The Evening', 6, 190, 4),
  ('History Of My Roses', 6, 222, 4),
  ('Without My Love', 6, 111, 4),
  ('Walking And Game', 6, 123, 4),
  ('Young And Father', 6, 197, 4),
  ('Finding My Traditions', 7, 179, 5),
  ('Walking And Man', 7, 229, 5),
  ('Hard And Time', 7, 135, 5),
  ("Honey, I'm A Lone Wolf", 7, 150, 5),
  ("She Thinks I Won't Stay Tonight", 8, 166, 5),
  ("He Heard You're Bad For Me", 8, 154, 5),
  ("He Hopes We Can't Stay", 8, 210, 5),
  ('I Know I Know', 8, 117, 5),
  ("He's Walking Away", 9, 159, 5),
  ("He's Trouble", 9, 138, 5),
  ('I Heard I Want To Bo Alone', 9, 120, 5),
  ('I Ride Alone', 9, 141, 5),
  ('Honey', 10, 79, 6),
  ('You Cheated On Me', 10, 95, 6),
  ("Wouldn't It Be Nice", 10, 213, 6),
  ('Baby', 10, 136, 6),
  ('You Make Me Feel So..', 10, 83, 6);

INSERT INTO SpotifyClone.followed_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);

INSERT INTO SpotifyClone.history (user_id, song_id, artist_id, reproduction_history)
VALUES
  (1, 36, 6, '2020-02-28 10:45:55'),
  (1, 25, 5, '2020-05-02 05:30:35'),
  (1, 23, 4, '2020-03-06 11:22:33'),
  (1, 14, 3, '2020-08-05 08:05:17'),
  (1, 15, 3, '2020-09-14 16:32:22'),
  (2, 34, 5, '2020-01-02 07:40:33'),
  (2, 24, 5, '2020-05-16 06:16:22'),
  (2, 21, 4, '2020-10-09 12:27:48'),
  (2, 39, 6, '2020-09-21 13:14:46'),
  (3, 6, 2, '2020-11-13 16:55:13'),
  (3, 3, 1, '2020-12-05 18:38:30'),
  (3, 26, 5, '2020-07-30 10:00:00'),
  (4, 2, 1, '2021-08-15 17:10:10'),
  (4, 35, 5, '2021-07-10 15:20:30'),
  (4, 27, 5, '2021-01-09 01:44:33'),
  (5, 7, 2, '2020-07-03 19:33:28'),
  (5, 12, 3, '2017-02-24 21:14:22'),
  (5, 14, 3, '2020-08-06 15:23:43'),
  (5, 1, 1, '2020-11-10 13:52:27'),
  (6, 38, 6, '2019-02-07 20:33:48'),
  (6, 29, 5, '2017-01-24 00:31:17'),
  (6, 30, 5, '2017-10-12 12:35:20'),
  (6, 22, 4, '2018-05-29 14:56:41'),
  (7, 5, 1, '2018-05-09 22:30:49'),
  (7, 4, 1, '2020-07-27 12:52:58'),
  (7, 11, 3, '2018-01-16 18:40:43'),
  (8, 39, 6, '2018-03-21 16:56:40'),
  (8, 40, 6, '2020-10-18 13:38:05'),
  (8, 32, 5, '2019-05-25 08:14:03'),
  (8, 33, 5, '2021-08-15 21:37:09'),
  (9, 16, 4, '2021-05-24 17:23:45'),
  (9, 17, 4, '2018-12-07 22:48:52'),
  (9, 8, 2, '2021-03-14 06:14:26'),
  (9, 9, 2, '2020-04-01 03:36:00'),
  (10, 20, 4, '2017-02-06 08:21:34'),
  (10, 21, 4, '2017-12-04 05:33:43'),
  (10, 12, 3, '2017-07-27 05:24:49'),
  (10, 13, 3, '2017-12-25 01:03:57');