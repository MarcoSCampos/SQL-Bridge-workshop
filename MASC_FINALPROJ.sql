-- -----------------------------------------
-- CUNY MSDA BRIDGE WORKSHOP - 
-- SQL WEEK 5 Final Project assignment
-- Vinyl Collection Database
-- Marco Siqueira Campos
-- 08/08/2016
-- -----------------------------------------


SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS tbl_genre;
DROP TABLE IF EXISTS tbl_location;
DROP TABLE IF EXISTS tbl_artist;
DROP TABLE IF EXISTS tbl_bridge1;
DROP TABLE IF EXISTS tbl_album;
DROP TABLE IF EXISTS tbl_bridge2;
DROP TABLE IF EXISTS tbl_track;
SET FOREIGN_KEY_CHECKS=1;


CREATE table tbl_genre 
(
genre_id INT PRIMARY KEY,
music_genre  VARCHAR(20) NOT NULL
);

CREATE table tbl_location
(
location_id INT PRIMARY KEY,
location_name VARCHAR(20) NOT NULL
);

CREATE table tbl_artist 
(
artist_id INT PRIMARY KEY,
artist_name  VARCHAR(30) NOT NULL,
artist_country VARCHAR(20),
artist_index INT(6)
);

CREATE table tbl_track 
(
track_id INT PRIMARY KEY,
track_title  VARCHAR(30) NOT NULL,
track_numberLP INT(3),
track_numberCD INT(3),
side VARCHAR(1),
disk_LP INT(1),
disk_CD INT(2),
track_length INT(6)
);

CREATE table tbl_album
(
album_id INT PRIMARY KEY,
album_name  VARCHAR(30) NOT NULL,
album_format VARCHAR(10),
disk_qty INT(2),
release_year INT(4),
genre_id INT,
foreign key (genre_id) references tbl_genre (genre_id),
album_label VARCHAR(20),
album_condition VARCHAR(20),
location_id INT,
FOREIGN KEY (location_id) references tbl_location(location_id)
);


CREATE table tbl_bridge1 
(
bridge1_id INT PRIMARY KEY,
artist1_id INT,
foreign key (artist1_id) references tbl_artist (artist_id),
album1_id INT,
foreign key (album1_id) references tbl_album (album_id)
);

CREATE table tbl_bridge2 
(
bridge2_id INT PRIMARY KEY,
track2_id INT,
foreign key (track2_id) references tbl_track (track_id),
album2_id INT,
foreign key (album2_id) references tbl_album (album_id)
);

INSERT INTO tbl_genre VALUES (1,'classical');
INSERT INTO tbl_genre VALUES (2,'jazz');
INSERT INTO tbl_genre VALUES (3,'bossa nova');
INSERT INTO tbl_genre VALUES (4,'pop');
INSERT INTO tbl_genre VALUES (5,'r&b');
INSERT INTO tbl_genre VALUES (6,'rock');

INSERT INTO tbl_location VALUES (1,'box 1');
INSERT INTO tbl_location VALUES (2,'box 2');
INSERT INTO tbl_location VALUES (3,'drawer 1');


INSERT INTO tbl_artist VALUES (1, 'The Beatles', 'UK', NULL); 
INSERT INTO tbl_artist VALUES (2, 'Amy Winehouse', 'UK', NULL); 
INSERT INTO tbl_artist VALUES (3, 'Stan Getz', 'USA', NULL); 
INSERT INTO tbl_artist VALUES (4, 'João Gilberto', 'BR', NULL); 
INSERT INTO tbl_artist VALUES (5, 'John Lennon', 'UK', 1);
INSERT INTO tbl_artist VALUES (6, 'Ringo Star', 'UK', 1);
INSERT INTO tbl_artist VALUES (7, 'George Harrison', 'UK', 1);
INSERT INTO tbl_artist VALUES (8, 'Paul McCartney', 'UK', 1);


INSERT INTO tbl_album VALUES (1, 'Let It Be', 'LP', 1, 1970, 6,'apple','new',1); 
INSERT INTO tbl_album VALUES (2, 'Getz/Gilberto', 'LP',1, 1964, 3,'verve','good',2);
INSERT INTO tbl_album VALUES (3, 'Back to Black', 'CD', 1, 2006, 5,'island',NULL,3);
INSERT INTO tbl_album VALUES (4, 'Imagine', 'LP',1, 1971, 6,'apple','regular',1);


INSERT INTO tbl_track VALUES (1,'Two of Us', 1, 1, 'A', 1 ,1, 216);
INSERT INTO tbl_track VALUES (2,'Dig a Pony', 2, 2, 'A', 1 ,1, 174);
INSERT INTO tbl_track VALUES (3,'Across the Universe', 3, 3, 'A', 1 ,1, 228);
INSERT INTO tbl_track VALUES (4,'I Me Mine', 4, 4, 'A', 1 ,1, 145);
INSERT INTO tbl_track VALUES (5,'Dig it', 5, 5, 'A', 1 ,1, 50);
INSERT INTO tbl_track VALUES (6,'Let It Be', 6, 6, 'A', 1 ,1, 243);
INSERT INTO tbl_track VALUES (7,'Maggie Mae', 7, 7, 'A', 1 ,1, 40);
INSERT INTO tbl_track VALUES (8,'I\'ve Got a Feeling', 1, 8, 'B', 1 ,1, 218);
INSERT INTO tbl_track VALUES (9,'One After 909', 2, 9, 'B', 1 ,1, 175);
INSERT INTO tbl_track VALUES (10,'The long and Winding Road', 3, 10, 'B', 1 ,1, 217);
INSERT INTO tbl_track VALUES (11,'For you Blue', 4, 11, 'B', 1 ,1, 152);
INSERT INTO tbl_track VALUES (12,'Get Back', 5, 12, 'B', 1 ,1, 187);

INSERT INTO tbl_track VALUES (13, 'The Girl From Ipanema', 1, 1, 'A', 1 ,1, 324);
INSERT INTO tbl_track VALUES (14,'Doralice', 2, 2, 'A', 1 ,1, 166);
INSERT INTO tbl_track VALUES (15,'Para Machucar meu Coração', 3, 3, 'A', 1 ,1, 305);
INSERT INTO tbl_track VALUES (16,'Desafinado', 4, 4, 'A', 1 ,1, 255);
INSERT INTO tbl_track VALUES (17,'Corcovado', 1, 5, 'B', 1 ,1, 256);
INSERT INTO tbl_track VALUES (18,'Só Danço o Samba', 2, 6, 'B', 1 ,1, 225);
INSERT INTO tbl_track VALUES (19, 'O Grande Amor', 3, 7, 'B', 1 ,1, 327);
INSERT INTO tbl_track VALUES (20,'Vivo Sonhando', 4, 8, 'B', 1 ,1, 184);
 
 
INSERT INTO tbl_track VALUES (21,'Rehab', 1, 1, 'A', 1, 1, 214);
INSERT INTO tbl_track VALUES (22,'You Know I\'m No Good', 2, 2, 'A', 1, 1, 257);
INSERT INTO tbl_track VALUES (23,'Me & Mr Jones', 3, 3, 'A', 1, 1, 153);
INSERT INTO tbl_track VALUES (24,'Just Friends', 4, 4, 'A', 1, 1, 183);
INSERT INTO tbl_track VALUES (25,'Back to Black', 5, 5, 'A', 1, 1, 241);
INSERT INTO tbl_track VALUES (26,'Love is a Losing Game', 6, 6, 'A', 1, 1, 155);
INSERT INTO tbl_track VALUES (27,'Tears Dry on Their Own', 1, 7, 'B', 1, 1, 186);
INSERT INTO tbl_track VALUES (28,'Wake Up Alone', 2, 8, 'B', 1, 1, 222);
INSERT INTO tbl_track VALUES (29,'Some Unholy War', 3, 9, 'B', 1, 1, 142);
INSERT INTO tbl_track VALUES (30,'He Can Only Hold Her', 4, 10, 'B', 1, 1, 166);
INSERT INTO tbl_track VALUES (31,'Addicted', 5, 11, 'B', 1, 1, 165);
 
 
 INSERT INTO tbl_track VALUES (32,'Imagine', 1, 1, 'A', 1, 1, 181);
 INSERT INTO tbl_track VALUES (33,'Crippled Inside', 2, 2, 'A', 1, 1, 227);
 INSERT INTO tbl_track VALUES (34,'Jealous Guy', 3, 3, 'A', 1, 1, 254);
 INSERT INTO tbl_track VALUES (35,'It\'s so Hard', 4, 4, 'A', 1, 1, 145);
 INSERT INTO tbl_track VALUES (36,'I Don\'t Want to Be a Soldier', 5, 5, 'A', 1, 1, 365);
 INSERT INTO tbl_track VALUES (37,'Give me Some Truth', 1, 6, 'B', 1, 1, 196);
 INSERT INTO tbl_track VALUES (38,'Oh My Love', 2, 7, 'B', 1, 1, 170);
 INSERT INTO tbl_track VALUES (39,'How Do You Sleep', 3, 8, 'B', 1, 1, 336);
 INSERT INTO tbl_track VALUES (40,'How?', 4, 9, 'B', 1, 1, 133);
 INSERT INTO tbl_track VALUES (41,'Oh Yoko!', 5, 10, 'B', 1, 1, 260);
 
 
 INSERT INTO tbl_bridge1 VALUES(1, 1, 1);
 INSERT INTO tbl_bridge1 VALUES(2, 3, 2);
 INSERT INTO tbl_bridge1 VALUES(3, 4, 2);
 INSERT INTO tbl_bridge1 VALUES(4, 5, 4);
 INSERT INTO tbl_bridge1 VALUES(5, 2, 3);
 
 
 INSERT INTO tbl_bridge2 VALUES(1, 1, 1);
 INSERT INTO tbl_bridge2 VALUES(2, 2, 1);
 INSERT INTO tbl_bridge2 VALUES(3, 3, 1);
 INSERT INTO tbl_bridge2 VALUES(4, 4, 1);
 INSERT INTO tbl_bridge2 VALUES(5, 5, 1);
 INSERT INTO tbl_bridge2 VALUES(6, 6, 1);
 INSERT INTO tbl_bridge2 VALUES(7, 7, 1);
 INSERT INTO tbl_bridge2 VALUES(8, 8, 1);
 INSERT INTO tbl_bridge2 VALUES(9, 9, 1);
 INSERT INTO tbl_bridge2 VALUES(10, 10, 1);
 INSERT INTO tbl_bridge2 VALUES(11, 11, 1);
 INSERT INTO tbl_bridge2 VALUES(12, 12, 1);
 INSERT INTO tbl_bridge2 VALUES(13, 13, 2);
 INSERT INTO tbl_bridge2 VALUES(14, 14, 2);
 INSERT INTO tbl_bridge2 VALUES(15, 15, 2);
 INSERT INTO tbl_bridge2 VALUES(16, 16, 2);
 INSERT INTO tbl_bridge2 VALUES(17, 17, 2);
 INSERT INTO tbl_bridge2 VALUES(18, 18, 2);
 INSERT INTO tbl_bridge2 VALUES(19, 19, 2);
 INSERT INTO tbl_bridge2 VALUES(20, 20, 2);
 INSERT INTO tbl_bridge2 VALUES(21, 21, 3);
 INSERT INTO tbl_bridge2 VALUES(22, 22, 3);
 INSERT INTO tbl_bridge2 VALUES(23, 23, 3);
 INSERT INTO tbl_bridge2 VALUES(24, 24, 3);
 INSERT INTO tbl_bridge2 VALUES(25, 25, 3);
 INSERT INTO tbl_bridge2 VALUES(26, 26, 3);
 INSERT INTO tbl_bridge2 VALUES(27, 27, 3);
 INSERT INTO tbl_bridge2 VALUES(28, 28, 3);
 INSERT INTO tbl_bridge2 VALUES(29, 29, 3);
 INSERT INTO tbl_bridge2 VALUES(30, 30, 3);
 INSERT INTO tbl_bridge2 VALUES(31, 31, 3);
 INSERT INTO tbl_bridge2 VALUES(32, 32, 4);
 INSERT INTO tbl_bridge2 VALUES(33, 33, 4);
 INSERT INTO tbl_bridge2 VALUES(34, 34, 4);
 INSERT INTO tbl_bridge2 VALUES(35, 35, 4);
 INSERT INTO tbl_bridge2 VALUES(36, 36, 4);
 INSERT INTO tbl_bridge2 VALUES(37, 37, 4);
 INSERT INTO tbl_bridge2 VALUES(38, 38, 4);
 INSERT INTO tbl_bridge2 VALUES(39, 39, 4);
 INSERT INTO tbl_bridge2 VALUES(40, 40, 4);
 INSERT INTO tbl_bridge2 VALUES(41, 41, 4);




-- -----------------------------------------
-- QUERY Examples
-- -----------------------------------------

-- Find Back to Black album

select album_name, l.location_name
FROM tbl_album a
JOIN tbl_location l
ON a.location_id = l.location_id
WHERE album_name LIKE 'back to black';

-- Track all music title, side and track number of Imagine LP

select track_title, side, track_numberLP
FROM tbl_track
Join tbl_bridge2
ON track_id=track2_id
Join tbl_album
ON album2_id=album_id
WHERE album_name LIKE 'imagine'; 

 -- select artist name and origin country from Getz/Gilberto LP
 
 select artist_name, artist_country
 FROM tbl_artist
 JOIN tbl_bridge1
 ON artist_id=artist1_id
 Join tbl_album
 ON album1_id=album_id
 WHERE album_name LIKE 'getz/gilberto';
 
 -- Collection inventory by format
 
 select album_format, count(*)
 from tbl_album
 group by album_format;

-- time in minutes of Black to Back album

select album_name AS 'Album name', ROUND(SUM(track_length)/60,0) AS 'Time in min'
FROM tbl_track
Join tbl_bridge2
ON track_id=track2_id
Join tbl_album
ON album2_id=album_id
WHERE album_name LIKE 'back to black';

-- Albums from John Lennon alone

select album_name, artist_name
 FROM tbl_artist
 JOIN tbl_bridge1
 ON artist_id=artist1_id
 Join tbl_album
 ON album1_id=album_id
 WHERE artist_name LIKE 'john lennon';

-- Albums with John Lennon participation

select album_name, artist_name
 FROM tbl_artist
 JOIN tbl_bridge1
 ON artist_id=artist1_id
 Join tbl_album
 ON album1_id=album_id
 WHERE artist_name LIKE 'john lennon' OR artist_name LIKE ( 
 select a.artist_name FROM tbl_artist b
JOIN tbl_artist a
 ON  a.artist_id=b.artist_index
 WHERE b.artist_name LIKE 'john lennon'
  );

-- Albums with bossa nova genre
 
select album_name, music_genre
FROM tbl_album a
JOIN tbl_genre g
ON a.genre_id = g.genre_id
WHERE music_genre LIKE 'bossa nova';

-- Collection by genre
 
select music_genre, count(*)
FROM tbl_album a
JOIN tbl_genre g
ON a.genre_id = g.genre_id
GROUP BY music_genre; 

-- locate all by music Corcovado

select track_title, track_numberLP, side, album_name, location_name  
FROM tbl_track
Join tbl_bridge2
ON track_id=track2_id
Join tbl_album a
ON album2_id=album_id
JOIN tbl_location l
ON a.location_id = l.location_id
WHERE track_title LIKE 'Corcovado';


