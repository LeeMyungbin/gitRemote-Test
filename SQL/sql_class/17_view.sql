-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 17_view : 가상 테이블

-- view 생성
-- view 는 slelect 문을 저장한 객체이며 가상 테이블처럼 조회할 수 있다.
CREATE VIEW hansik AS
SELECT 
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
     tbl_menu
WHERE
     category_code = 4;

SELECT
    *
FROM
     hansik;

-- 2. 베이스테이블의 데이터 변경
-- 베이스테이블을 변경하면 view의 결과도 함께 변경 된다.
INSERT INTO
       tbl_menu
VALUES
      (NULL, '식혜맛국밥', 5500, 4,'Y');

SELECT * FROM hansik;

-- 3. view를 통한 데이터 변경 (수정 가능한 view의 경우)
-- group by, having, distinct, union, join, 산술 표현식 등을 통한 selecct => DML 사용 불가
INSERT INTO
       hansik
VALUES
      (NULL, '수정과맛국밥',6500,4,'Y');
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

-- 4. view 삭제
DROP VIEW hansik;

-- 5. create or replace 옵션 : 기존 뷰를 새 정의로 변경하면서 생성하는 옵션
-- join 포함 view는 주로 조회용으로 사용한다.
CREATE OR REPLACE VIEW hansik AS
SELECT 
     a.menu_code as 메뉴코드,
     a.menu_name as 메뉴명,
     b.category_name as 카테고리명
FROM
    tbl_menu a 
JOIN 
    tbl_category b ON (a.category_code = b.category_code)
WHERE
    b.category_name = '한식';

SELECT * FROM hansik;

-- 6. with check option : view 조건을 만족하는 데이터만 insert/update 가능
CREATE OR REPLACE VIEW hansik AS
SELECT 
     menu_code,
     menu_name,
     menu_price,
     category_code,
     orderable_status
FROM
     tbl_menu
WHERE
     category_code = 4
WITH CHECK OPTION;

INSERT INTO
       hansik
VALUES
      (NULL, '4번카테고리',6500,4,'Y');
-- 조건을 위반하는 insert 불가
INSERT INTO
       hansik
VALUES
      (NULL, '5번카테고리',6500,5,'Y');
-- 카테고리 코드 변경은 check option 위배
SELECT * FROM hansik;

UPDATE
     hansik
SET
    category_code = 2
WHERE
    menu_code =33;
-- 메뉴명 변경은 무관해서 수정 가능
UPDATE
     hansik
SET
    menu_name = '변경된이름'
WHERE
    menu_code =33;