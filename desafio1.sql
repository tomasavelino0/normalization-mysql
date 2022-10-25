CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
	plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_name VARCHAR(50) NOT NULL,
    plano_valor INT NOT NULL
);

CREATE TABLE artistas(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_name VARCHAR(50) NOT NULL
);

CREATE TABLE albuns(
   id_album INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      album VARCHAR(45) NOT NULL,
      ano_lancamento VARCHAR(10) NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_artista) REFERENCES artistas (artista_id)
);

CREATE TABLE album_cancoes(
	cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(id_album),
    cancao_name VARCHAR(100) NOT NULL,
    duracao_segundos INT NOT NULL
);

CREATE TABLE usuario(
	usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_name VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano INT NOT NULL,
    FOREIGN KEY (plano) REFERENCES planos(plano_id),
    data_assinatura DATE
);

CREATE TABLE usuario_historico(
	data_reproducao DATETIME NOT NULL,
      id_usuario INT NOT NULL,
      id_musica INT NOT NULL,
      PRIMARY KEY (id_usuario, id_musica),
      FOREIGN KEY (id_usuario) REFERENCES usuario (usuario_id),
      FOREIGN KEY (id_musica) REFERENCES album_cancoes (cancao_id)
);

CREATE TABLE usuario_seguindo(
	id_usuario INT NOT NULL,
      id_artista INT NOT NULL,
      PRIMARY KEY (id_usuario, id_artista),
      FOREIGN KEY (id_usuario) REFERENCES usuario (usuario_id),
      FOREIGN KEY (id_artista) REFERENCES artistas (artista_id)
);

USE SpotifyClone;

INSERT INTO planos VALUES(1, 'gratuito', 0.00);
INSERT INTO planos VALUES(2, 'familiar', 7.99);
INSERT INTO planos VALUES(3,'universitario', 5.99);
INSERT INTO planos VALUES(4, 'pessoal', 6.99);

INSERT INTO artistas  VALUES 
(1,'Beyonce'),
(2,'Queen'),
(3,'Elis Regina'),
(4,'Baco Exu do Blues'),
(5,'Blind Guardian'),
(6,'Nina Simone');

INSERT INTO usuario (usuario_name, idade, plano, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');


INSERT INTO albuns (album, ano_lancamento, id_artista)
  VALUES
    ('Renaissance', '2022', 1),
    ('Jazz', '1978', 2),
    ('Hot Space', '1982', 2),
    ('Falso Brilhante', '1998', 3),
    ('Vento de Maio', '2001', 3),
    ('QVVJFA?', '2003', 4),
    ('Somewhere Far Beyond', '2007', 5),
    ('I Put A Spell On You', '2012', 6);

INSERT INTO album_cancoes(cancao_name,duracao_segundos,album_id) VALUES
('BREAK MY SOUL', 279, 1),
('VIRGO\’S GROOVE', 369, 1),
('ALIEN SUPERSTAR', 116, 1),
('Don\’t Stop Me Now', 203, 2),
('Under Pressure', 152, 3),
('Como Nossos Pais', 105, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 5),
('Samba em Paris', 267, 6),
('The Bard’s Song', 244, 7),
('Feeling Good', 100, 8);

INSERT INTO usuario_historico(data_reproducao,id_usuario, id_musica) VALUES
('2022-02-28 10:45:55', 1, 8),
('2020-05-02 05:30:35', 1, 2),
('2020-03-06 11:22:33', 1, 10),
('2022-08-05 08:05:17', 2, 10),
('2020-01-02 07:40:33', 2, 7),
('2020-11-13 16:55:13', 3, 10),
('2020-12-05 18:38:30', 3, 2),
('2021-08-15 17:10:10', 4, 8),
('2022-01-09 01:44:33', 5, 8),
('2020-08-06 15:23:43', 5, 5),
('2017-01-24 00:31:17', 6, 7),
('2017-10-12 12:35:20', 6, 1),
('2011-12-15 22:30:49', 7, 4),
('2012-03-17 14:56:41', 8, 4),
('2022-02-24 21:14:22', 9, 9),
('2015-12-13 08:30:22', 10, 3);

INSERT INTO usuario_seguindo(id_usuario,id_artista) VALUES
(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
