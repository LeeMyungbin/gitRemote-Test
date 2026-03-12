-- Active: 1773035626917@@127.0.0.1@3306@menudb

-- 18_index
DROP TABLE phone;
CREATE Table phone
(
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(255),
    phone_price DECIMAL(10,2)
);

INSERT INTO phone
VALUES
(1, 'galaxyS23', 1300000),
(2, 'galaxyZfold', 1400000),
(3, 'iphone15pro', 1500000);

-- phone_name (인덱스 없는 컬럼) 기준 조회 실행 계획 확인
-- type : ALL => table full scan
-- rows : 해당 실행 계획으로 조회할 때 찾아봐야 하는 행의 개수 (많아지면 조회 효율 떨어짐)
EXPLAIN
SELECT 
     * 
FROM
    phone
WHERE
    phone_name = 'iphone15pro';

-- 단일 컬럼 인덱스 생성 (phone_name 대상)
CREATE INDEX idx_name ON phone(phone_name);

-- 인덱스 확인 (PK를 대상으로 한 인덱스는 자동으로 생성 됨)
SHOW INDEX FROM phone;

-- phone_name (인덱스 생성 된 컬럼) 기준 조회 실행 계획 확인
-- type : ref, possible keys : idx_name => 방금 생성한 index를 참조하여 실행
-- rows : 1 => index가 관리하는 포인터를 통해 바로 데이터 조회

EXPLAIN
SELECT 
     * 
FROM
    phone
WHERE
    phone_name = 'iphone15pro';

-- 복합 인덱스 생성 (주로 첫 번째 컬럼 검색에 더 많이 사용 됨)
CREATE INDEX idx_name_price ON phone(phone_name, phone_price);
SHOW INDEX FROM phone;

-- 복합 인덱스 활용한 조회
EXPLAIN
SELECT 
      * 
FROM  phone
WHERE
      phone_name = 'iphone15pro' AND
      phone_price = 1500000;

-- 모든 조회 상황에서 인덱스가 필요한 것이 아니라 10-15% 이내의 데이터를 필터링 할 때 더 효율적
-- 그 이상은 full scan이 효율적

-- 데이터 대량 변경(insert, update), 인덱스 파편화 문제가 있을 수 있음
-- 인덱스 삭제 후 재생성 / 인덱스 저장 구조 재정리가 필요할 수 있음

ALTER TABLE phone DROP INDEX idx_name;
ALTER TABLE phone ADD INDEX idx_name (phone_name);
OPTIMIZE TABLE phone;