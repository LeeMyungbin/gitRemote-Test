-- Active: 1773035626917@@127.0.0.1@3306@menudb
--03_where : 특정 조건에 맞는 행만 선택

--1) 비교 연산자
--값 일치 여부 확인 (=)

--판매 가능한 메뉴만 조회
SELECT
   menu_code,
   menu_name,
   menu_price
FROM
   tbl_menu
WHERE
   orderable_status='Y';

--메뉴 가격이 13000원인 메뉴만 조회
SELECT
   menu_code,
   menu_name,
   menu_price
FROM
   tbl_menu
WHERE
   menu_price=13000;


--값이 일치하지 않는지 확인(!=, <>)

--판매 불가능한 메뉴만 조회
SELECT
   menu_code,
   menu_name,
   menu_price
FROM
   tbl_menu
WHERE
   --orderable_status !='Y' ;
   orderable_status <>'Y' ;

--대소비교 (<, >, <=, >=)

-- 20000원 초과인 메뉴 조회

SELECT
   menu_code,
   menu_name,
   menu_price
FROM
   tbl_menu
WHERE
   menu_price > 20000;


--2) 논리 연산자 (and/or)
-- a and b :a 와 b 모두 만족할 경우 true
-- 주문 가능하며 category_code가 10에 해당하는 메뉴
SELECT
   menu_code,
   menu_name,
   menu_price,
   category_code,
   orderable_status
FROM
   tbl_menu
WHERE
   orderable_status='Y' AND
   category_code = 10 ;

-- a or b :a 와 b 중 하나라도 만족할 경우 true
-- 주문 가능하거나 category_code가 4에 해당하는 메뉴
SELECT
   menu_code,
   menu_name,
   menu_price,
   category_code,
   orderable_status
FROM
   tbl_menu
WHERE
   orderable_status='Y' OR
   category_code = 4 ;

--and, or 연산자 중에서 우선순위가 높은 연산자는? and
-- 만약 or 연산자를 먼저 수행하고 싶으면 소괄호 활용

SELECT
   menu_code,
   menu_name,
   menu_price,
   category_code,
   orderable_status
FROM
   tbl_menu
WHERE
   (category_code =4 OR
   menu_price=9000) AND
   menu_code > 10;


--3) between A and B : A 이상 B 이하
SELECT 
    *
FROM
   tbl_menu
WHERE
   menu_price BETWEEN 10000 AND 25000
ORDER BY
   menu_price;


--NOT : 부정 연산자
SELECT 
    *
FROM
   tbl_menu
WHERE
   menu_price NOT BETWEEN 10000 AND 25000
ORDER BY
   menu_price;

--4) LIKE : 문자 검색
SELECT
    *
FROM
    tbl_menu
WHERE 
    menu_name LIKE '%마늘%';    --해당 키워드를 포함

SELECT
    *
FROM
    tbl_menu
WHERE 
    menu_name LIKE '%아메리카노';   --해당 키워드로 끝남  


SELECT
    *
FROM
    tbl_menu
WHERE 
    menu_name LIKE '흑%';   --해당 키워드로 시작함

SELECT
    *
FROM
    tbl_menu
WHERE 
    menu_name LIKE '_마늘%';   --'_'는 자리 차지   

--'_' 나 '%'와 같은 기호를 실제로 검색하고 싶은 경우
--LIKE '%\_%'또는 LIKE '%!_%' ESCAPE '!'와 같은 방식으로 ESCAPE 한다.

--NOT LIKE
SELECT
    *
FROM
    tbl_menu
WHERE 
    menu_name NOT LIKE '%마늘%';   --해당 키워드를 포함하지 않음

--퀴즈. 메뉴 가격이 5000원 이상이고, 카테고리 코드가 10이며
--메뉴 이름에 갈치가 들어가는 메뉴의 모든 칼럼 값 조회 (칼럼 명시)

SELECT
   menu_code,
   menu_name,
   menu_price,
   category_code,
   orderable_status
FROM
   tbl_menu
WHERE
   category_code =10 AND
   menu_price >= 5000 AND
   menu_name LIKE '%갈치%';

--5) IN 연산자
SELECT   
    *
FROM
    tbl_menu
WHERE
    --category_code =4 OR category_code = 5 OR category_code =6;
    category_code IN (4,5,6);

--NOT IN
SELECT 
     *
FROM 
    tbl_menu
WHERE
    category_code NOT IN(4,5,6);

--6) IS NULL : null 값 비교 연산자 (단순=연산자로는 비교 불가)
SELECT
     *
FROM
    tbl_category
WHERE
    --ref_category_code=  NULL ;
    --ref_category_code= IS NULL ;
    ref_category_code IS NOT NULL;



   