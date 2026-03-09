-- Active: 1773035626917@@127.0.0.1@3306@menudb
--04_distinct : 중복 컬럼 값 제거 후 조회

--메뉴 테이블 내에 존재하는 카테고리의 종류 조회
SELECT 
    DISTINCT category_code
FROM
    tbl_menu
ORDER BY
    category_code;

--NULL 값이 존재하는 칼럼에서 사용할 경우  => null 값도 중복 제거 되어 1행만 남음
SELECT
     DISTINCT ref_category_code
FROM
    tbl_category
ORDER BY
    1;   --select 절에 나열 된 컬럼 순번으로 정렬 가능

--[주의] 다중열에 distinct 사용할 경우
--다중열의 조합 결과 행의 중복이 제거 된다.
     