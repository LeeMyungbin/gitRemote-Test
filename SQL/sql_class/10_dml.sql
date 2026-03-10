-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 10_dml (데이터 조작 언어)
-- 테이블에 데이터를 삽입(insert), 수정(update), 삭제(delete)할 때 사용하는 sql 구문

-- 1. insert : 새로운 행을 추가한다. 테이블의 행 수가 증가한다.

-- 컬럼을 명시하지 않았을 경우 values에서 컬럼 순서를 지켜 모든 값을 삽입해야 한다.
INSERT INTO
      tbl_menu
VALUES            --menu_code 컬럼은 AUTO_INCREMENT 설정이 되어 있으므로 NULL 처리
      (NULL, '바나나해장국', 15000, 4, 'Y' );


select * from tbl_menu;

-- insert 하고 싶은 데이터 컬럼을 지정해서 삽입
INSERT INTO
    tbl_menu (
        menu_name,
        menu_price,
        category_code,
        orderable_status
    )
VALUES
    (
        '초콜릿죽' ,
        9500,
        5,
        'Y'
    );

-- 컬럼을 명시하면 insert 시 데이터의 순서를 바꾸는 것도 가능하다.
INSERT INTO
    tbl_menu (
        menu_price,
        menu_name,
        orderable_status,
        category_code
    )
VALUES
    (
        9500,
        '파인애플탕' ,
        'Y',
        6
);


-- 다증 행 insert
INSERT INTO
     tbl_menu
VALUES
    (
        NULL, '참치맛아이스크림', 1700, 12, 'Y'
    ),
    (
        NULL, '멸치맛아이스크림', 1500, 12, 'Y'
    ),
    (
        NULL, '꽁치맛아이스크림', 1600, 12, 'Y'
    );

-- 2. update : 테이블에 기록 된 컬럼의 값을 수정하는 구문이다. 테이블의 전체 행의 개수에는 변화가 없다.
-- set절에 변경할 컬럼 = 값 나열, where 절에 변경 대상 행 선택
UPDATE
     tbl_menu
SET
     menu_price = 10500 ,
     category_code = 5
WHERE
     menu_code = 24;

-- 3. delete : 테이블의 행을 삭제하는 구문이다. 테이블의 행의 개수가 줄어든다.
-- where 절에서 삭제 대상 행을 반드시 선택해야 하며 생략할 경우 테이블의 전체 행이 삭제 된다.
DELETE FROM
      tbl_menu
WHERE
      menu_code = 24;

-- order by 절과 limit 을 활용한 삭제
DELETE FROM
      tbl_menu
ORDER BY
      menu_code DESC
LIMIT 2;

-- [참고] replace
-- insert 사용 시에는 menu_code (pk) 중복으로 삽입 오류가 발생하지만
-- replace는 내부적으로 기존 행을 삭제 후 다시 삽입해주기 때문에 수행된다.
--INSERT INTO
REPLACE INTO
      tbl_menu
VALUES
     (1, '참기름소주', 4500, 10, 'Y');

-- replace ... set ... 구문도 menu_code (pk) 중복 시
-- 기존 행 삭제 후 새로운 행을 삽입하는 동작이 일어난다.
REPLACE
      tbl_menu
SET
      menu_code =2 ,
      menu_name= '우럭쥬스',
      menu_price = 6000,
      category_code = 9,
      orderable_status = 'N' ;
