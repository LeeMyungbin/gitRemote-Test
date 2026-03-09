-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 02_order by : 결과 집합(Result Set)을 기준에 따라 정렬

-- 메뉴 가격 오름차순(ASC) 정렬, 내림차순(DESC) 정렬
SELECT
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu
ORDER BY
    -- menu_price ASC;
    menu_price DESC;

-- 메뉴 가격이 같을 경우 메뉴명으로 추가 정렬
SELECT
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu
ORDER BY
    menu_price DESC,
    menu_name ASC;

-- 연산 결과로 정렬(별칭 사용)
SELECT
    menu_code,
    menu_name,
    menu_price * menu_code 연산결과
FROM
    tbl_menu
ORDER BY
    -- menu_price * menu_code;
    연산결과;   -- select 절의 별칭을 사용할 수 있다.

-- field 내장 함수
SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');
SELECT FIELD('C', 'A', 'B', 'C');

-- field 내장 함수를 order by 절에서 사용하면
-- 숫자 크기, 문자 순서와 무관하게 특정한 값을 우선적으로 정렬하는 용도로 사용 가능하다.
SELECT
    menu_name,
    orderable_status,
    FIELD(orderable_status, 'N', 'Y')
FROM
    tbl_menu
ORDER BY
    FIELD(orderable_status, 'N', 'Y');

--NULL 값을 포함한 정렬
SELECT
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY
--오름차순 시 NULL 처음 (default) - null 값을 더 작게 취급한다.
    --ref_category_code ASC;
--오름차순 NULL 뒤로 -
    --ref_category_code IS NULL, ref_category_code ASC;    --TRUE=1, FALSE=0
--내림차순 시 NULL 뒤로 (default) - null 값을 더 작게 취급한다.
    --ref_category_code DESC;
    ref_category_code IS NOT NULL, ref_category_code DESC;
    