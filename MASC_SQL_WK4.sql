-- -----------------------------------------
-- CUNY MSDA BRIDGE WORKSHOP - 
-- SQL WEEK 4 assignment: Self joins
-- Marco Siqueira Campos
-- 03/08/2016
-- -----------------------------------------

DROP TABLE IF EXISTS tbl_apple;

CREATE table tbl_apple 
(
id INT(6) PRIMARY KEY,
name_e  VARCHAR(20),
title VARCHAR(30),
supervisor VARCHAR(20) 
);


INSERT INTO tbl_apple VALUES (1, 'Steve Jobs','CEO', NULL);
INSERT INTO tbl_apple VALUES (2, 'Timothy Cook', 'COO', 'Steve Jobs');
INSERT INTO tbl_apple VALUES (3, 'Michael Fenger', 'VP iphone sales','Timothy Cook');
INSERT INTO tbl_apple VALUES (4, 'Jennifer Bailey','VP online stores','Timothy Cook');
INSERT INTO tbl_apple VALUES (5, 'Jonathan Ive','SVP industrial design','Steve Jobs');
INSERT INTO tbl_apple VALUES (6, 'Hiroki Asai','VP creative director','Steve Jobs');
INSERT INTO tbl_apple VALUES (7, 'Peter Oppenheimer','SVP chief financial officer','Steve Jobs');
INSERT INTO tbl_apple VALUES (8, 'Betsy Rafael','VP controler','Peter Oppenheimer');
INSERT INTO tbl_apple VALUES (9, 'Gary Wipfler','VP treasurer','Peter Oppenheimer');
INSERT INTO tbl_apple VALUES (10, 'Katie Cotton','VP communication','Steve Jobs');
INSERT INTO tbl_apple VALUES (11, 'Joel Podolny','VP HR','Steve Jobs');


select e.name_e AS 'Employee', e.title AS 'Title', e.supervisor AS 'Manager'
FROM tbl_apple e
JOIN tbl_apple m
ON(e.supervisor=m.name_e);


select e1.name_e AS 'level 1',e1.title, e2.name_e AS 'level 2', e2.title, e3.name_e AS 'level 3', e3.title
FROM tbl_apple e1
LEFT JOIN tbl_apple AS e2 ON e2.supervisor=e1.name_e
LEFT JOIN tbl_apple AS e3 ON e3.supervisor=e2.name_e
WHERE e1.name_e='Steve Jobs';




