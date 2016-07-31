
-- -----------------------------------------
-- CUNY MSDA BRIDGE WORKSHOP - 
-- SQL WEEK 3 assignment: Buiding a Relational Database Management System
-- Marco Siqueira Campos
-- 30/07/2016
-- -----------------------------------------

create table tbl_user(
user_id int PRIMARY KEY,
user_n varchar(20) NULL,
group_n varchar(20) NULL
);

INSERT INTO tbl_user VALUES (1,'Modesto','I.T.'); 
INSERT INTO tbl_user VALUES (2,'Ayime','I.T.'); 
INSERT INTO tbl_user VALUES (3,'Christopher','Sales'); 
INSERT INTO tbl_user VALUES (4,'Cheong Woo','Sales'); 
INSERT INTO tbl_user VALUES (5,'Salut','Administration'); 
INSERT INTO tbl_user VALUES (6,'Heidy',NULL); 
INSERT INTO tbl_user VALUES (7,NULL,'Operations'); 

create table tbl_bridge(
group_n varchar(20) NOT NULL REFERENCES tbl_user(group_n),
id_room INT NOT NULL REFERENCES tbl_room(id_room),
constraint pk_group_room primary key(group_n, id_room)
);

INSERT INTO tbl_bridge VALUES ('I.T.',1); 
INSERT INTO tbl_bridge VALUES ('I.T.',2); 
INSERT INTO tbl_bridge VALUES ('Sales',2); 
INSERT INTO tbl_bridge VALUES ('Sales',3); 

create table tbl_room(
id_room int PRIMARY KEY,
room varchar(20) UNIQUE NOT NULL
);

INSERT INTO tbl_room VALUES(1, '101');
INSERT INTO tbl_room VALUES(2, '102');
INSERT INTO tbl_room VALUES(3, 'Auditorium A');
INSERT INTO tbl_room VALUES(4, 'Auditorium B'); 

select group_n as 'group', user_n AS 'user'
FROM tbl_user
WHERE group_n IS NOT NULL;

select distinct tbl_room.room, tbl_user.group_n AS 'group' 
FROM tbl_user
JOIN tbl_bridge
ON tbl_user.group_n=tbl_bridge.group_n
RIGHT JOIN tbl_room
ON tbl_bridge.id_room=tbl_room.id_room;

select tbl_user.user_n AS 'user', tbl_user.group_n AS 'group', tbl_room.room 
FROM tbl_user
JOIN tbl_bridge
ON tbl_user.group_n=tbl_bridge.group_n
JOIN tbl_room
ON tbl_bridge.id_room=tbl_room.id_room
ORDER BY tbl_user.user_n, tbl_user.group_n, tbl_room.room;



