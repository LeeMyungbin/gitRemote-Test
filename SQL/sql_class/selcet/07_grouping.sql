-- Active: 1773035626917@@127.0.0.1@3306@menudb
--07_grouping
-- group by : 특정 컬럼의 값이 같은 행들을 하나의 그룹으로 묶기 위해 사용한다.
-- having : 주로 group by와 함께 사용 되며 그룹화 된 결과에 조건을 적용할 때 사용한다.

-- 1. group by
SELECT
     category_code
FROM
     tbl_menu
GROUP BY
    category_code;

-- (1) count 함수
SELECT
     category_code,
     COUNT(*) as menu_count
FROM
     tbl_menu
GROUP BY
     category_code;

-- couny 함수의 특성
-- '*' : 전체 행의 개수를 카운트, 컬럼명 : null 제외한 행의 개수를 카운트
SELECT
     COUNT(*) as total_count,
     COUNT(category_code) as category_code_count,
     COUNT(ref_category_code) as ref_category_code_count
FROM
     tbl_category;

--(2) sum 함수 활용
--category_code별 menu_pricr 합계
SELECT
     category_code,
     SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
    category_code;

--(3) AVG 함수 활용
--category_code 별 menu_price 평균
SELECT
     category_code,
     AVG(menu_price) as avg_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- (4) MIN, MAX 함수 활용
-- 그룹별 최소값, 최대값을 구할 때 사용하며 숫자, 문자, 날짜 등 모든 자료형에 가능하다.
-- 카테고리 그룹별 가장 비싼 or 싼 메뉴 가격
SELECT
     category_code,
     MAX(menu_price) as max_price,
     MIN(menu_price) as min_price
FROM
    tbl_menu
GROUP BY
    category_code;

-- 2개 이상의 컬럼을 기준으로 그룹화
-- 각 컬럼 값 조합이 같은 행 끼리 하나의 그룹으로 묶인다.
SELECT
     menu_price,
     category_code,
     COUNT(*) as menu_count
FROM
    tbl_menu
GROUP BY
     menu_price,
     category_code;

-- 2. HAVING

-- 메뉴 개수가 2개 이상인 카테고리 조회
-- 먼저 카테고리 코드로 그룹화 한 뒤, 각 그룹의 메뉴 개수가 2개 이상인 "그룹만 필터링" 한다.
SELECT
     category_code,
     COUNT(*) as menu_count
FROM
    tbl_menu
GROUP BY
    category_code
HAVING
    COUNT(*) >= 2;

-- where 절은 그룹화 이전의 행에 조건을 적용하고
-- having 절은 그룹화 이후의 결과에 조건을 적용한다.

-- where 절
SELECT
     category_code,
     COUNT(*) as menu_count
FROM
     tbl_menu
WHERE
     menu_price >= 10000
GROUP BY
     category_code;

SELECT
     category_code,
     AVG(menu_price) as avg_menu_price
FROM
     tbl_menu
GROUP BY
     category_code
HAVING
     AVG(menu_price) >= 10000;

-- 3. rollup
-- with rollup을 사용하면 그룹별 집계 결과와 함께 중간 소계 또는 전체 촐합 행이 추가된다.
-- 이 때, 총합 또는 소계 행의 그룹 컬럼 값은 NULL으로 표시 될 수 있다.

-- 컬럼 한 개를 그루핑 했을 경우 roll up
-- 마지막에 전체 메뉴 가격 총합 행을 함께 조회한다.
SELECT
     category_code,
     SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
     category_code
WITH ROLLUP;

-- 컬럼 두 개를 그루핑 했을 경우
-- group by 에 작성 된 컬럼의 순서를 기준으로 계층적인 소계와 총계를 추가한다.
-- 첫 번째 컬럼 값을 기준으로하여 소계를 중간에 추가
SELECT
     menu_price,
     category_code,
     SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
     menu_price,
     category_code
WITH ROLLUP;


SELECT
     category_code,
     menu_price,
     SUM(menu_price) as total_price
FROM
    tbl_menu
GROUP BY
     category_code,
     menu_price
WITH ROLLUP;

-- select 문의 작성 순서
--          / 실행 순서
-- select     6
-- from       1
-- join       2
-- where      3
-- group by   4
-- having     5 
-- order by   7