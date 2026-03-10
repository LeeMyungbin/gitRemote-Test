-- Active: 1773035626917@@127.0.0.1@3306@menudb
--05_limit : select 문의 결과 집합에서 반환할 행의 갯수 제한
SELECT
      menu_code,
      menu_name,
      menu_price
FROM
     tbl_menu
ORDER BY
    menu_price
LIMIT 1, 4;
--[offset] : 시작할 행의 번호 (인덱스)
--row_count : 이후 행부터 반환할 개수

--offset은 생략 가능하며 row_count만 입력하면 top_n행 반환
--가장 비싼 메뉴 TOP-5 조회
SELECT
      menu_code,
      menu_name,
      menu_price
FROM
     tbl_menu
ORDER BY
    menu_price DESC
LIMIT 5;