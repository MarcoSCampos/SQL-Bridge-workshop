
-- -----------------------------------------
-- CUNY MSDA BRIDGE WORKSHOP - 
-- SQL WEEK 2 assignment: SQL One to Many Relationship
-- Marco Siqueira Campos
-- 24/07/2016
-- -----------------------------------------

CREATE TABLE tbl_video
(video_id int auto_increment,
title VARCHAR(128) NOT NULL,
length DECIMAL(5,2) NOT NULL,
url varchar(256) NOT NULL UNIQUE, 
primary key(video_id)
);

INSERT INTO tbl_video ( title, length, url) VALUES ('Mysql Workbench How to Create Database', 0.98,
'https://www.youtube.com/watch?v=mR7UA229uAQ');
INSERT INTO tbl_video ( title, length, url) VALUES ('MySQL Tutorial 1 - What is MySQL', 9.52, 
'https://www.youtube.com/watch?v=6pbxQQG25Jw');
INSERT INTO tbl_video ( title, length, url) VALUES ('MySQL Database Tutorial - 22 - How to Join Tables', 8.47,
'https://www.youtube.com/watch?v=6BfofgkrI3Y');
INSERT INTO tbl_video ( title, length, url) VALUES ('Curso MySQL #14 - Modelo Relacional', 40.40,
'https://www.youtube.com/watch?v=8fxKJWJcRTw');

select *
FROM tbl_video;

CREATE TABLE tbl_review
(review_id int primary key auto_increment,
review VARCHAR(256),
v_user VARCHAR(50),
rating INT(1),
video_id INT,
FOREIGN KEY(video_id) references tbl_video (video_id)
);

INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Just the video I was looking far. Awesome thank you!﻿','Domien',5,1);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'helpful﻿', 'Prabagaran',4,1);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Excellent','Prabagaran',5,1);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Its not a kitchen table its a digital table love it lol﻿﻿','Jason D',5,2);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'a nice introduction to mysql﻿﻿','Lin Cha',4,2);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'You are great. I will definitely share your channel.﻿﻿﻿','Mary J',5,2);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Thank you! Amazing.﻿﻿﻿﻿','Mihail Geoescu',5,3);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'It is been a long time since I watched a Buck s video for the first time, but the feeling remains the same: you are the best, man!﻿﻿﻿﻿','Peristilo Peris',5,3);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Muito obrigado Guanabara, me ajudou muito.﻿﻿﻿﻿﻿','Murilo Pecht',5,4);
INSERT INTO tbl_review (review, v_user, rating, video_id) VALUES (
'Ótima aula! Obrigado Guanabara...﻿﻿﻿﻿﻿﻿','Junio Silva',5,4);

select *
FROM tbl_review;

select v.video_id, title, length, url, review, v_user user, rating
FROM tbl_video v
INNER join tbl_review r
ON v.video_id=r.video_id
ORDER BY title;



