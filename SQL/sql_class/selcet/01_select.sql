-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 01_SELECT : 특정 테이블에서 원하는 데이터 조회

-- 단일 열 데이터 검색
SELECT menu_name FROM tbl_menu;

-- 다중 열 데이터 검색
SELECT menu_code, menu_name, menu_price FROM tbl_menu;

-- tbl_menu의 모든 컬럼 조회(*)
SELECT * FROM tbl_menu;

-- 단독 select 문 사용

-- 연산자 테스트
SELECT 7 + 3;
SELECT 7 - 3;

-- 내장 함수 테스트
SELECT NOW();
SELECT CONCAT('유', ' ', '관순');

-- 컬럼에 별칭 부여
SELECT NOW() AS 현재시간;
SELECT CONCAT('유', ' ', '관순') name;
SELECT CONCAT('유', ' ', '관순') 'full name';