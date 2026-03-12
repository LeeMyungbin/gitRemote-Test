-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 12_data types

-- 명시적 형변환
-- CAST : SQL 표준 형변환 함수
-- CONVERT : MySQL에서 제공하는 형변환 함수 (기능은 대부분 동일)

-- AVG 결과를 정수로 형변환
SELECT AVG(menu_price) FROM tbl_menu ;
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;


-- 문자열 -> DATE 형변환
SELECT CAST('2026$3$11' AS DATE);
SELECT CAST('2026/3/11' AS DATE);
SELECT CAST('2026-3-11' AS DATE);
SELECT CAST('2026@3@11' AS DATE);


-- 숫자 -> 문자열
SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;

-- 암시적 형변환
-- 문자열 -> 숫자
SELECT '1' + '2' ;
-- 숫자 -> 문자열
SELECT CONCAT(menu_price, '원') FROM tbl_menu;
-- 문자 -> 숫자 변환 비교
SELECT 3 > 'MAY' ;   -- 숫자로 변환 불가한 문자는 0으로 변환 된다.
SELECT 5 > '6MAY';  -- 0 => false , 5 > 6 비교 결과
SELECT 5 > 'M6AY';   -- => true , 5 > 0 비교 결과
