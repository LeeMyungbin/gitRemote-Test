-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 08_subqueries
-- 다른 sql 문 내부에 포함되어 실행되는 쿼리를 말하며
-- where 절 : 조건비교, from 절 : 파생테이블, 
-- select 절 : 계산 결과 컬럼, having 절 : 집계 결과 조건 드ㅡㅇ의 맥락에 사용 될 수 있다

-- 1. 서브쿼리의 결과를 조건으로 활용하는 경우
-- 민트미역국과 같은 카테고리의 메뉴 검색
SELECT
    *
FROM
   tbl_menu
WHERE
   category_code = (SELECT
                     category_code
                FROM
                   tbl_menu
                WHERE
                   menu_name='민트미역국') ;


-- in 연산자 활용
-- 서브쿼리 결과가 1 row 가 아니라 여러 행인 경우에 활용
SELECT
    *
FROM
   tbl_menu
WHERE
   category_code IN (SELECT
                     category_code
                FROM
                   tbl_menu
                WHERE
                   orderable_status='Y') ;

--> ANY, > ALL
-- ANY : 서브쿼리 결과 중 하나라도 조건을 만족하면 true를 반환한다.
-- ALL : 서브쿼리 결과 모두의 조건을 만족하려면 true를 반환한다.

SELECT
    *
FROM
   tbl_menu
WHERE
   menu_price > ANY (SELECT
                        menu_price
                     FROM
                        tbl_menu
                     WHERE
                        category_code=4) ;


SELECT
    *
FROM
   tbl_menu
WHERE
   menu_price > ALL (SELECT
                        menu_price
                     FROM
                        tbl_menu
                     WHERE
                        category_code=4) ;


-- 2. 서브쿼리가 파생테이블로 활용되는 경우
-- 메인 쿼리에서 참조하려면 반드시 테이블 alias를 작성해야 한다.
SELECT
     MAX(menu_count)
FROM
    (
        SELECT
            category_code,
            COUNT(*) as menu_count
        FROM
            tbl_menu
        GROUP BY
            category_code
    ) as count_menu;

-- 3. 상관 서브쿼리 (상호연관 서브쿼리)
-- 메인 쿼리의 현재 행 a.category_code 값을 서브쿼리 내부에서 참조하여 해당 카테고리의 평균가를 구한다.
-- 각 메뉴는 자신이 속한 카테고리의 평균가와 비교되어 그보다 큰 경우만 결과 집합에 담긴다.
SELECT
     *
FROM
    tbl_menu a
WHERE
     menu_price > (
        SELECT
             AVG(menu_price)
        FROM
             tbl_menu
        WHERE
             category_code = a.category_code
     );

-- 확인용
SELECT
     AVG(menu_price),
     category_code
FROM
     tbl_menu
GROUP BY
     category_code;

-- exists 연산자 활용
-- 서브쿼리의 결과가 한 행이라도 존재하면 true, 존재하지 않으면 false를 반환한다.
-- 조건이 만족 되는 행이 발견되는 순간 바로 true를 반환하므로 대량 데이터에서 존재 여부를 확인할 때 주로 사용한다.
SELECT
     category_code
FROM
     tbl_category a
WHERE
     EXISTS (
        SELECT
           1       --행의 존재 여부만 중요하므로 컬럼 값 필요 X 
        FROM
           tbl_menu b
        WHERE
           b.category_code = a.category_code
     )
ORDER BY
    1;

-- 4. CTE (Common Table Expression)
-- 이름이 있는 임시 결과 집합을 정의하는 구문으로 
-- 주로 복잡한 서브쿼리를 분리하여 쿼리의 가독성을 높이기 위해 사용한다.
WITH menucate AS (
    SELECT
        menu_name,
        category_name
    FROM
        tbl_menu
    JOIN
        tbl_category USING (category_code)
)
SELECT
     *
FROM
    menucate
ORDER BY
    menu_name;
