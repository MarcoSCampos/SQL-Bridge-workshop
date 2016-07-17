-- -----------------------------------------
-- CUNY MSDA BRIDGE WORKSHOP - 
-- SQL WEEK 1 assignment: SQL Select and Aggregations
-- Marco Siqueira Campos
-- 16/07/2016
-- -----------------------------------------

-- ----------------------
-- Q1
-- ----------------------
select *
FROM flights
ORDER BY distance DESC
limit 5
-- ----------------------
-- Q2-1
-- ----------------------
select engines, engine, manufacturer, model
FROM planes
GROUP by engines
-- ----------------------
-- Q2-2
-- ----------------------

select DISTINCT manufacturer, model, engines, seats
FROM planes
WHERE engines = 1
ORDER BY  seats DESC
LIMIT 10
-- ----------------------
select DISTINCT manufacturer, model, engines, seats
FROM planes
WHERE engines = 2
ORDER BY  seats DESC
LIMIT 10
-- ----------------------
select DISTINCT manufacturer, model, engines, seats
FROM planes
WHERE engines = 3
ORDER BY  seats DESC
LIMIT 10
-- ----------------------
select DISTINCT manufacturer, model, engines, seats
FROM planes
WHERE engines = 4
ORDER BY  seats DESC
LIMIT 10
-- ----------------------
-- Q3
-- ----------------------
select COUNT(*)
FROM flights
-- ----------------------
-- Q4
-- ----------------------
select  count(*), carrier
FROM flights
group by carrier
-- ----------------------
-- Q5
-- ----------------------
select carrier, count(*)
FROM flights
group by carrier
ORDER BY count(*) DESC
-- ----------------------
-- Q6
-- ----------------------
select carrier, COUNT(*) 
FROM flights
group by carrier
ORDER BY count(*) DESC
LIMIT 5
-- ----------------------
-- Q7
-- ----------------------
select carrier, COUNT(*) 
FROM flights
WHERE distance >= 1000
group by carrier
ORDER BY count(*) DESC
LIMIT 5
-- ----------------------
-- Q8
-- ----------------------
select origin, AVG(dep_delay) delay
FROM flights
Group by origin
ORDER by AVG(dep_delay) DESC


