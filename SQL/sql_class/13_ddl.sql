-- 13_DDL (데이터 정의 언어)
-- CREATE / ALTER / DROP

-- 1. CREATE
CREATE Table IF NOT EXISTS tbl
(
    pk INT PRIMARY KEY,
    fk INT ,
    col VARCHAR(255),
    CHECK (col IN ('Y','N'))
) ;

DESCRIBE tbl;


-- AUTO_INCREMENT
CREATE TABLE IF NOT EXISTS tb2
(
    pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col VARCHAR(255),
    CHECK (col IN ('Y','N'))
);
INSERT INTO tb2 (fk,col) VALUES (10,'Y');
INSERT INTO tb2 (fk,col) VALUES (20,'N');
SELECT * FROM tb2;


-- 2. ALTER : 데이터 정의 수정
-- 컬럼 추가
ALTER TABLE tb2
ADD col2 INT NOT NULL DEFAULT 0;

DESCRIBE tb2;

SELECT * FROM tb2;
ALTER Table tb2
DROP COLUMN col2;


-- 컬럼 이름 및 데이터 형식 변경
ALTER Table tb2
CHANGE COLUMN fk change_fk INT NOT NULL;

DESCRIBE tb2;

-- 컬럼 정의만 변경
ALTER TABLE tb2
MODIFY pk INT;

-- 3. DROP : 테이블(객체) 삭제
DROP TABLE IF EXISTS tbl;
DROP TABLE IF EXISTS tbl,tb2;

-- 4. TRUNCATE
SELECT * FROM tb2;

-- 테이블의 구조는 남기지만 데이터 행은 모두 제거하고 싶을 경우
-- delete from table 로 작성하는 것보다 효율적으로 truncate를 사용
-- drop + create 의 형태로 DDL이므로 암시적 commit이 일어나 rollback 불가
TRUNCATE tb2;