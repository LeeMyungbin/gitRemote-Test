-- Active: 1773041969583@@127.0.0.1@3306@employeedb
-- 06_join
-- 두 개 이상의 테이블을 공통 된 컬럼 값을 기준으로 행을 결합하여 하나의 결과 집합을 만드는 SQL 연산
-- 일반적으로 두 테이블은 공통 된 의미를 가지는 컬럼(키)를 기준으로 결합하며 이를 join 조건이라고 한다.

-- 1. 조인의 종류
-- (1) inner join
-- : 두 테이블에서 join 조건에 일치하는 행만 결합하여 반환한다.
SELECT
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a       -- 테이블 별칭 사용
-- INNER (일반적으로는 많이 생략해서 사용)
INNER JOIN tbl_category b ON (a.category_code = b.category_code);

-- employeedb의 employee + department
-- ON 은 join 조건 컬럼명이 같아도 되고 달라도 된다. 두 테이블 간의 관계를 조건식으로 직접 작성한다.
SELECT
     a.emp_name,
     b.dept_title
FROM  
    employee a  
JOIN department b ON a.dept_code = b.dept_id;

-- inner join 은 조건이 일치하는 행만 반환하므오 employee에서 dept_code가 null인 사원은 포함되지 않는다.
-- 일치하지 않는 행도 포함하여 조회하려면 outer join 을 사용해야 한다,

--using을 이용한 inner join
-- 두 테이블에서 join 기준 컬럼명이 동일한 경우에 사용할 수 있다.
-- 결과 집합에서도 해당 컬럼이 하나만 표시 된다.
SELECT
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a       
INNER JOIN tbl_category b USING (category_code);


-- (2) outer join
--left join
-- : 왼쪽 테이블의 모든 행을 유지하고 오른쪽 테이블에서 조건이 일치하는 행이 있으면 결합한다.
--   일치하는 행이 없으면 오른쪽 테이블의 컬럼은 null로 채워진다.

SELECT
     a.emp_name,
     b.dept_title
FROM  
    employee a  
LEFT JOIN department b ON a.dept_code = b.dept_id;


-- right join
-- : 오른쪽 테이블의 모든 행을 유지하고 왼쪽 테이블에서 조건이 일치하는 행이 있으면 결합한다.
--   일치하는 행이 없으면 왼쪽 테이블의 컬럼은 null로 채워진다.
--   가족성 때문에 right join 대신 테이블 순서를 바꾼 left join을 더 많이 사용한다.
SELECT
     a.emp_name,
     b.dept_title
FROM  
    employee a  
RIGHT JOIN department b ON a.dept_code = b.dept_id;

-- (3) cross join
-- : 두 테이블의 모든 가능한 조합을 반환한다.
--   예를 들어 a 테이블의 행이 10개 b 테이블의 행이 5개면 10x5=50 개의 행이 반환 된다.
SELECT
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a 
CROSS JOIN tbl_category b ON (a.category_code = b.category_code);

-- 3. JOIN 활용 패턴

-- (1) self join
-- 같은 테이블을 두 번 이상 참조하여 동일 테이블 내의 행과 행 사이의 관계를 조회하는 join 방식

-- 카테고리 상위/하위 관계 조회
SELECT
      a.category_name as sub_category,
      b.category_name as parent_category
FROM
     tbl_category
JOIN
    tbl_category b ON a.ref_category_code = b.category_code;

-- employee  테이블에서 사원과 관리자 조회
-- 단, 관리자가 없는 사원도 결과에 포함한다.
SELECT
    a.emp_name as 사원명,
    b.emp_name as 관리자명
FROM
    employee a
LEFT JOIN employee b ON a.manager_id = b.emp_id;

-- (2) 다중 테이블 join
-- 두 개 이상의 테이블도 join을 통해 연결할 수 있다.
-- 각 테이블 사이의 관계를 순차적으로 join 조건에 작성한다.

-- 사원명, 부서명, 직급명 조회 (부서가 없는 사원도 결과에 포함)
SELECT
    a.emp_name,
    b.dept_title,
    c.job_name
FROM 
    employee a 
LEFT JOIN  
    department b ON a.dept_code = b.DEPT_ID
JOIN
    job c ON a.job_code=c.job_code;

-- 사원명, 근무 지역명, 근무 국가명 검색
SELECT
    emp_name 사원명,
    local_name 근무지역명,
    national_name 근무국가명
FROM
    employee a
JOIN 
    department b ON a.dept_code = b.dept_id
JOIN 
    location c ON b.location_id = c.local_code
JOIN 
    national d ON c.national_code = d.national_code;