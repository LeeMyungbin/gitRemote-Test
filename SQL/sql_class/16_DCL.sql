-- Active: 1773033941696@@127.0.0.1@3306@mysql
-- 16_DCL (데이터 제어 언어)
-- GRANT : 사용자에게 권한을 부여하는 명령어
-- REVOKE : 이미 부여된 권한을 회수하는 명령어
-- SHOW GRANTS : 현재 계정에 부여된 권한을 확인
-- 권한 관리는 최소 권환 원칙을 권장

-- 이 스크립트는 권한이 있는 계정(root)으로 실행한다.

-- 계정 생성
CREATE USER 'user01'@'%' IDENTIFIED BY 'pass01';
-- 계정 삭제
DROP USER IF EXISTS 'user01'@'%' ; 


-- 권한 확인
SHOW GRANTS FOR 'user01'@'%';
-- 여러 권한 한 번에 부여
-- 메뉴 테이블에 대한 삽입, 수정 권한을 user01 계정에 부여
GRANT INSERT, UPDATE ON menudb.tbl_menu TO 'user01'@'%';
SHOW GRANTS FOR 'user01'@'%';
-- 권한 부여
-- menudb 데이터베이스의 모든 객체를 조회할 수 있는 권한을 user01에 부여
GRANT SELECT ON menudb.* TO 'user01'@'%';

-- 권한 회수
-- 메뉴 테이블에 대한 수정 권한을 user01 계정에게서 회수
REVOKE UPDATE ON menidb.tbl_menu FROM 'user01'@'%'

SHOW GRANTS FOR 'user01'@'%';
-- ALL PRIVIELEGES : 모든 권한
-- 모든 권한 회수
REVOKE ALL PRIVILEGES ON menudb.* FROM 'user01'@'%';
SHOW GRANTS FOR 'user01'@'%';

-- user01 로 접속해서 테스트
SELECT * FROM tbl_menu;
INSERT INTO tbl_menu VALUES (NULL, '메뉴명', 1000, 4,'Y');    -- 권한 없음

INSERT INTO tbl_category VALUES (15, '이름', )