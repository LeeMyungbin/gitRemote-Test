-- Active: 1773041969583@@127.0.0.1@3306@employeedb
-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1행)
SELECT
    a.emp_no,
    a.emp_name,
    b.dept_title
FROM
    employee a
JOIN
    department b ON a.dept_code = b.dept_id
WHERE
    a.EMP_NAME LIKE '%형%';

-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9행)
SELECT 
    a.emp_name, 
    b.job_name, 
    a.dept_code, 
    c.dept_title
FROM 
    employee a
JOIN
    department c ON a.dept_code = c.DEPT_ID
JOIN 
    job b ON a.job_code = b.job_code           
WHERE 
     c.dept_title LIKE '%해외영업%';               

-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8행)
-- (INNER JOIN 결과)
SELECT
    a.emp_name 사원명,
    a.BONUS 보너스포인트,
    dept_title 부서명,
    local_name 근무지역명
FROM 
   employee a
JOIN
   department b on a.DEPT_CODE = b.DEPT_ID
JOIN
   location c on b.LOCATION_ID = c.LOCAL_CODE
WHERE
   a.BONUS IS NOT NULL ;


-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3행)
SELECT
    a.emp_name 사원명,
    b.job_name 직급명,
    c.dept_title 부서명,
    d.local_name 근무지역명
FROM 
   employee a
JOIN
   job b ON a.JOB_CODE = b.JOB_CODE
JOIN
   department c on a.DEPT_CODE = c.DEPT_ID
JOIN
   location d on c.LOCATION_ID = d.LOCAL_CODE
WHERE
   a.DEPT_CODE ='D2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20행)
SELECT
    a.emp_name 사원명,
    b.job_name 직급명,
    a.salary 급여,
    (a.salary * (1 + IFNULL(a.bonus, 0)) * 12)  as 연봉
FROM
    employee a
JOIN
    job b ON a.JOB_CODE = b.JOB_CODE
JOIN
    sal_grade c ON a.SAL_LEVEL = c.SAL_LEVEL
WHERE
    a.SALARY > c.MIN_SAL ;



-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15행)
SELECT
    a.emp_name 사원명,
    dept_title 부서명,
    local_name 지역명,
    national_name 국가명
FROM
    employee a
JOIN department b ON a.DEPT_CODE = b.DEPT_ID
JOIN location c ON b.LOCATION_ID = c.LOCAL_CODE
JOIN national d ON c.NATIONAL_CODE = d.NATIONAL_CODE
WHERE
  c.NATIONAL_CODE IN ('KO','JP');


-- 7. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8행)
SELECT
    a.emp_name 사원명,
    b.job_name 직급명,
    a.salary 급여
FROM
    employee a
JOIN
    job b ON a.JOB_CODE = b.JOB_CODE
WHERE
    a.BONUS IS NULL AND
    a.JOB_CODE IN ('J4','J7')
 
-- 8. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회(2행)
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오.
   SELECT
       a.EMP_ID 사번,
       a.EMP_NAME 이름,
       b.JOB_NAME 직급명,
       c.DEPT_TITLE 부서명,
       d.LOCAL_NAME 근무지역명,
       a.SALARY 급여
    FROM 
       employee a
    JOIN job b ON a.JOB_CODE= b.JOB_CODE
    join department c ON a.DEPT_CODE = c.DEPT_ID
    join location d ON c.LOCATION_ID = d.LOCAL_CODE
    WHERE
       b.JOB_NAME = '대리' AND
       d.LOCAL_NAME LIKE '%ASIA%' ;
-- 9. 각 부서별 평균 급여와 직원 수를 조회하시오. (NULL 급여는 제외) 
-- 평균 급여가 높은 순으로 정렬하시오. (6행)
SELECT 
    b.DEPT_TITLE 부서명,
    AVG(a.SALARY) 평균급여,
    COUNT(a.EMP_NAME) 직원수
FROM
   employee a 
JOIN 
   department b ON a.DEPT_CODE = b.DEPT_ID
WHERE
   a.salary IS NOT NULL
GROUP BY
   b.DEPT_TITLE
ORDER BY
   AVG(a.salary) DESC ;
 
-- 10. 직원 중 보너스를 받는 직원들의 연봉 총합이 1억 원을 
-- 초과하는 부서의 부서명과 연봉 총합을 조회하시오. (1행)
SELECT
   b.dept_title 부서명,
   sum((a.salary * (1 + IFNULL(a.bonus, 0)) * 12)) 연봉총합
FROM
   employee a 
JOIN
   department b ON a.DEPT_CODE = b.DEPT_ID
WHERE
   a.BONUS IS NOT NULL
GROUP BY 
    b.dept_title  
HAVING
    SUM((a.salary * (1 + IFNULL(a.bonus, 0)) * 12)) > 100000000;
 
-- 11. 국내 근무하는 직원들 중 평균 급여 이상을 받는 
-- 직원들의 사원명, 급여, 부서명을 조회하시오. (서브쿼리 사용) (4행)
SELECT
    a.EMP_NAME 사원명,
    a.SALARY 급여,
    b.dept_title 부서명
FROM employee a
JOIN
   department b ON a.DEPT_CODE = b.DEPT_ID
JOIN
   location c ON b.LOCATION_ID = c.LOCAL_CODE
JOIN
    national d ON c.NATIONAL_CODE = d.NATIONAL_CODE
WHERE
    d.NATIONAL_NAME = '한국' AND
    a.SALARY >= (SELECT avg(salary)
                  from employee) ;

-- 12. 모든 부서의 부서명과 해당 부서에 소속된 직원 수를 조회하시오. 
-- 직원이 없는 부서도 함께 표시하시오. (9행)
SELECT 
    b.dept_title 부서명, 
    COUNT(a.emp_id)  직원수
FROM department b              
LEFT JOIN employee a ON b.dept_id = a.dept_code 
GROUP BY b.dept_title;

-- 13. 차장(J4) 이상 직급을 가진 직원과 사원(J7) 직급을 가진 
-- 직원들의 급여 합계를 비교하여 결과를 출력하시오. (SET OPERATOR 사용) (2행)
-- 1. 차장 이상(J4)의 급여 합계
SELECT
  '차장 이상' AS '구분',
  SUM(a.salary) AS '급여합계'
FROM 
  employee a
WHERE 
  a.job_code IN ('J1', 'J2', 'J3', 'J4')
UNION ALL
SELECT
  '사원' AS '구분',
  SUM(a.salary) AS '급여합계'
FROM 
  employee a
WHERE 
  a.job_code = 'J7';