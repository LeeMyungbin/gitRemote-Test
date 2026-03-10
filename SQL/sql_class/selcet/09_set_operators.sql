-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 09_set_operators
-- set 연산자는 두 개 이상의 select 문의 결과 집합을 결합하는데 사용 된다.
-- 각 select 문의 결과는 컬럼 수가 같아야 하며,
-- 같은 위치의 컬럼끼리 타입이 호환되어야 한다.


-- 1. UNION
-- 두 개 이상의 select 문의 결과를 결합한 뒤 중복된 레코드(행)을 제거하여 반환
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    category_code=10
UNION
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000 ;

-- 2. UNION ALL
-- 두 개 이상의 select 문의 결과를 결합하여 중복된 레코드(행)를 제거하지 않고 모두 반환한다.
-- 중복 제거 과정이 없으므로 union보다 빠를 수 있다.
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    category_code=10
UNION ALL
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000 ;


-- 3. INTERSECT (8.0.31 이상에서 추가)
-- 두 selesct 문의 결과 중 공통 되는 레코드만 반환한다.

SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    category_code=10
INTERSECT
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000 ;


-- 4. EXCEPT
-- 첫 번째 select문의 결과에서 두 번째 select 문의 결과에 포함 되는 레코드를 제외한 결과 반환
-- 일부 dbms에서는 minus라는 이름을 사용

SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    category_code=10
EXCEPT
SELECT
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
    tbl_menu
WHERE
    menu_price < 9000 ;