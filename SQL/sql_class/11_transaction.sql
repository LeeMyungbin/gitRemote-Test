-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 11_transaction
-- 데이터베이스에서 하나의 논리적인 작업 단위로 묶여 함께 처리되는 sql 작업의 집합

-- mysql은 기본적으로 autocommit 활성화 상태이므로
-- 별도의 트랜잭션을 시작하지 않으면 각 sql 문이 실행 될 때마다 자동으로 commit 된다.

-- autocommit 활성화 / 비활성화
SET autocommit = 1;
SET autocommit = ON;
SET autocommit = 0;
SET autocommit = OFF;

-- 트랜잭션 시작
START TRANSACTION;


-- insert 1회, update 1회
INSERT INTO
     tbl_menu
VALUES
     (NULL, '트랜잭션', 5000,4,'Y');
    
UPDATE
    tbl_menu
SET
    menu_name = '테스트'
WHERE
    menu_code = 1;

-- 현재 트랜잭션의 작업 내용을 취소한다.
ROLLBACK;


-- roll back 이후 다시 insert 1회, update 1회
INSERT INTO
     tbl_menu
VALUES
     (NULL, '트랜잭션', 5000,4,'Y');
    
UPDATE
    tbl_menu
SET
    menu_name = '테스트'
WHERE
    menu_code = 1;

-- 현재 트랜잭션의 작업 내용을 최종 반영한다.
COMMIT;


-- 다시  rollback 명령어를 수행하더라도 이미 반영된 변경 사항을 되돌릴 수 없다.
ROLLBACK;