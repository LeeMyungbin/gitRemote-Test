-- Active: 1773035626917@@127.0.0.1@3306@menudb
-- 15_Built-in Functions
-- 문자열 / 숫자 / 날짜 및 시간 관련 내장 함수

-- 1. 문자열 관련 함수

-- ASCII : 문자 -> 아스키 코드
-- CHAR  : 아스키 코드 -> 문자
-- 문자와 숫자 코드의 상호 변환
SELECT
       ASCII('A') AS ascii_a,
       CHAR(65)   AS char_65;


-- 문자열 길이 확인
-- BIT_LENGTH : 문자열의 비트 수 반환
-- CHAR_LENGTH: 문자열의 문자 수 반환
-- LENGTH     : 문자열의 바이트 수 반환
SELECT
       BIT_LENGTH('pie')  AS bit_length_pie,
       CHAR_LENGTH('pie') AS char_length_pie,
       LENGTH('pie')      AS length_pie;

SELECT
       menu_name,
       BIT_LENGTH(menu_name)  AS bit_length_menu_name,
       CHAR_LENGTH(menu_name) AS char_length_menu_name,
       LENGTH(menu_name)      AS length_menu_name
  FROM tbl_menu;


-- 문자열 연결
-- CONCAT    : 여러 문자열을 하나로 연결
-- CONCAT_WS : 구분자를 포함하여 문자열 연결
SELECT
       CONCAT('호랑이', '기린', '토끼') AS concat_result;

SELECT
       CONCAT_WS(',', '호랑이', '기린', '토끼') AS concat_ws_comma;

SELECT
       CONCAT_WS('-', '2023', '05', '31') AS concat_ws_date;


-- 문자열 위치 관련 함수
-- ELT         : 지정한 위치의 문자열 반환
-- FIELD       : 문자열 목록에서 특정 값의 위치 반환
-- FIND_IN_SET : 콤마로 구분된 문자열 목록에서 값의 위치 반환
-- INSTR       : 특정 부분 문자열이 처음 나타나는 위치 반환
-- LOCATE      : 특정 부분 문자열이 처음 나타나는 위치 반환
SELECT
       ELT(2, '사과', '딸기', '바나나')          AS elt_result,
       FIELD('딸기', '사과', '딸기', '바나나')   AS field_result,
       FIND_IN_SET('바나나', '사과,딸기,바나나') AS find_in_set_result,
       INSTR('사과딸기바나나', '딸기')           AS instr_result,       -- 1 부터 넘버링
       LOCATE('딸기', '사과딸기바나나')          AS locate_result;


-- 숫자 포맷팅
-- FORMAT : 숫자를 지정한 자리수까지 반올림하여 문자열 형태로 반환
SELECT
       FORMAT(123142512521.5635326, 3) AS format_result;


-- 진수 변환 표현
-- BIN : 2진수 문자열 반환
-- OCT : 8진수 문자열 반환
-- HEX : 16진수 문자열 반환
SELECT
       BIN(65) AS bin_result,
       OCT(65) AS oct_result,
       HEX(65) AS hex_result;


-- 문자열 삽입
-- INSERT : 문자열의 특정 위치 일부를 다른 문자열로 바꿔 넣음
SELECT
       INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동') AS insert_result;


-- 왼쪽 / 오른쪽 일부 추출
-- LEFT  : 왼쪽부터 지정한 길이만큼 추출
-- RIGHT : 오른쪽부터 지정한 길이만큼 추출
SELECT
       LEFT('Hello World!', 3)  AS left_result,
       RIGHT('Hello World!', 3) AS right_result;


-- 대소문자 변환
-- LOWER : 소문자로 변환
-- UPPER : 대문자로 변환
SELECT
       LOWER('Hello World!') AS lower_result,
       UPPER('Hello World!') AS upper_result;


-- 문자열 채우기
-- LPAD : 왼쪽에 문자를 채워 길이를 맞춤
-- RPAD : 오른쪽에 문자를 채워 길이를 맞춤
SELECT
       LPAD('왼쪽', 6, '@')   AS lpad_result,
       RPAD('오른쪽', 6, '@') AS rpad_result;


-- 왼쪽 / 오른쪽 공백 제거
-- LTRIM : 왼쪽 공백 제거
-- RTRIM : 오른쪽 공백 제거
SELECT
       LTRIM('    왼쪽')   AS ltrim_result,
       RTRIM('오른쪽    ') AS rtrim_result;


-- 양쪽 공백 제거 / 특정 문자 제거
-- TRIM : 양쪽 공백 제거 또는 지정한 문자 제거
SELECT
       TRIM('    MySQL    ')                AS trim_space_result,
       TRIM(BOTH '@' FROM '@@@@MySQL@@@@') AS trim_char_result;


-- 문자열 반복
-- REPEAT : 문자열을 지정한 횟수만큼 반복
SELECT
       REPEAT('재밌어', 3) AS repeat_result;


-- 문자열 치환
-- REPLACE : 특정 문자열을 다른 문자열로 치환
SELECT
       REPLACE('마이SQL', '마이', 'My') AS replace_result;


-- 문자열 뒤집기
-- REVERSE : 문자열 순서를 반대로 뒤집음
SELECT
       REVERSE('stressed') AS reverse_result;


-- 공백 문자열 생성
-- SPACE : 지정한 길이만큼 공백 문자열 생성
SELECT
       CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세입니다.') AS space_result;


-- 부분 문자열 추출
-- SUBSTRING : 특정 위치에서 지정한 길이만큼 또는 끝까지 추출
SELECT
       SUBSTRING('안녕하세요 반갑습니다.', 7, 2) AS substring_fixed,
       SUBSTRING('안녕하세요 반갑습니다.', 7)    AS substring_to_end;


-- 구분자 기준 부분 문자열 추출
-- SUBSTRING_INDEX : 구분자를 기준으로 왼쪽/오른쪽 일부 추출
SELECT
       SUBSTRING_INDEX('hong.test@gmail.com', '.', 2)  AS substring_index_left,
       SUBSTRING_INDEX('hong.test@gmail.com', '.', -2) AS substring_index_right;


-- 2. 숫자 관련 함수

-- 절대값
-- ABS : 숫자의 절대값 반환
SELECT
       ABS(-123) AS abs_result;


-- 올림 / 내림 / 반올림
-- CEILING : 올림
-- FLOOR   : 내림
-- ROUND   : 반올림
SELECT
       CEILING(1234.56) AS ceiling_result,
       FLOOR(1234.56)   AS floor_result,
       ROUND(1234.56)   AS round_result;


-- 진법 변환
-- CONV : 지정한 진법의 수를 다른 진법 문자열로 변환
SELECT
       CONV('A', 16, 10) AS conv_hex_to_dec,
       CONV('A', 16, 2)  AS conv_hex_to_bin,
       CONV(1010, 2, 8)  AS conv_bin_to_oct;


-- 나머지 연산
-- MOD / % / MOD 키워드 : 나눗셈의 나머지 반환
SELECT
       MOD(75, 10) AS mod_func_result,
       75 % 10     AS mod_operator_result,
       75 MOD 10   AS mod_keyword_result;


-- 거듭제곱 / 제곱근
-- POW  : 거듭제곱 계산
-- SQRT : 제곱근 계산
SELECT
       POW(2, 4) AS pow_result,
       SQRT(16)  AS sqrt_result;


-- 난수 생성
-- RAND : 0 이상 1 미만의 난수 생성
-- FLOOR(RAND() * (최대값 - 최소값 + 1) + 최소값) : 범위 정수 생성 공식
SELECT
       RAND()                       AS rand_result,
       FLOOR(RAND() * (11 - 1) + 1) AS rand_int_1_to_10;


-- 부호 판별
-- SIGN : 양수는 1, 0은 0, 음수는 -1 반환
SELECT
       SIGN(10.1)  AS sign_positive,
       SIGN(0)     AS sign_zero,
       SIGN(-10.1) AS sign_negative;


-- 소수점 버림
-- TRUNCATE : 지정한 자리수까지 남기고 나머지 버림
SELECT
       TRUNCATE(12345.12345, 2)  AS truncate_positive_digit,
       TRUNCATE(12345.12345, -2) AS truncate_negative_digit;


-- 3. 날짜 및 시간 관련 함수

-- 날짜 더하기 / 빼기
-- ADDDATE : 날짜에 일정 기간 더하기
-- SUBDATE : 날짜에서 일정 기간 빼기
SELECT
       ADDDATE('2023-05-31', INTERVAL 30 DAY)  AS adddate_day_result,
       ADDDATE('2023-05-31', INTERVAL 6 MONTH) AS adddate_month_result;

SELECT
       SUBDATE('2023-05-31', INTERVAL 30 DAY)  AS subdate_day_result,
       SUBDATE('2023-05-31', INTERVAL 6 MONTH) AS subdate_month_result;


-- 시간 더하기 / 빼기
-- ADDTIME : 시간 또는 날짜시간에 시간 더하기
-- SUBTIME : 시간 또는 날짜시간에서 시간 빼기
SELECT
       ADDTIME('2023-05-31 09:00:00', '1:0:1') AS addtime_result,
       SUBTIME('2023-05-31 09:00:00', '1:0:1') AS subtime_result;


-- 현재 날짜 / 시간
-- CURDATE : 현재 날짜 반환
-- CURTIME : 현재 시간 반환
-- NOW     : 현재 날짜와 시간 반환
-- SYSDATE : 함수 실행 시점의 현재 날짜와 시간 반환
SELECT
       CURDATE() AS curdate_result,
       CURTIME() AS curtime_result,
       NOW()     AS now_result,
       SYSDATE() AS sysdate_result;


-- 같은 의미의 날짜 관련 표현
-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 모두 현재 날짜 반환
SELECT
       CURDATE()      AS curdate_func,
       CURRENT_DATE() AS current_date_func,
       CURRENT_DATE   AS current_date_keyword;


-- 같은 의미의 시간 관련 표현
-- CURTIME(), CURRENT_TIME(), CURRENT_TIME는 모두 현재 시간 반환
SELECT
       CURTIME()      AS curtime_func,             -- my sql 전용
       CURRENT_TIME() AS current_time_func,
       CURRENT_TIME   AS current_time_keyword;


-- 현재 날짜시간 관련 표현
-- NOW, LOCALTIME, LOCALTIMESTAMP는 현재 날짜와 시간 반환
SELECT
       NOW()            AS now_func,
       LOCALTIME        AS localtime_keyword,
       LOCALTIME()      AS localtime_func,
       LOCALTIMESTAMP   AS localtimestamp_keyword,
       LOCALTIMESTAMP() AS localtimestamp_func;


-- 날짜/시간 구성 요소 추출
-- YEAR / MONTH / DAYOFMONTH : 날짜의 연 / 월 / 일 추출
SELECT
       YEAR(CURDATE())       AS year_result,
       MONTH(CURDATE())      AS month_result,
       DAYOFMONTH(CURDATE()) AS dayofmonth_result;

-- HOUR / MINUTE / SECOND / MICROSECOND : 시간의 시 / 분 / 초 / 마이크로초 추출
SELECT
       HOUR(CURTIME())           AS hour_result,
       MINUTE(CURTIME())         AS minute_result,
       SECOND(CURRENT_TIME)      AS second_result,
       MICROSECOND(CURRENT_TIME(6)) AS microsecond_result;  -- 안에 숫자를 넣으면 더 자세한 마이크로 초를 반환함


-- 날짜 / 시간만 추출
-- DATE : 날짜 부분만 추출
-- TIME : 시간 부분만 추출
SELECT
       DATE(NOW()) AS date_result,
       TIME(NOW()) AS time_result;

-- 날짜 형식 지정
-- DATE_FORMAT : 날짜/시간 값을 원하는 형식의 문자열로 변환
-- %Y : 4자리 연도
-- %m : 2자리 월
-- %d : 2자리 일
-- %H : 24시간 형식 시
-- %i : 분
-- %s : 초
-- %W : 요일명
SELECT
       NOW() AS now_value,
       DATE_FORMAT(NOW(), '%Y-%m-%d') AS date_format_basic,
       DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS date_format_datetime,
       DATE_FORMAT(NOW(), '%Y년 %m월 %d일') AS date_format_kor,
       DATE_FORMAT(NOW(), '%Y-%m-%d (%W)') AS date_format_dayname;

-- 날짜 차이 / 시간 차이
-- DATEDIFF : 두 날짜 사이의 일 수 차이 반환
-- TIMEDIFF : 두 시간 사이의 차이 반환
SELECT
       DATEDIFF('2023-05-31', NOW())    AS datediff_result,     -- 과거에서 현재를 빼면 음수로 반환
       TIMEDIFF('17:07:11', '13:06:10') AS timediff_result;

-- 날짜/시간 단위 차이 계산
-- TIMESTAMPDIFF : 두 날짜/시간 사이의 차이를 지정한 단위로 반환
-- 단위 예: SECOND, MINUTE, HOUR, DAY, MONTH, YEAR
SELECT
       TIMESTAMPDIFF(SECOND, '2023-05-31 09:00:00', NOW()) AS diff_seconds,
       TIMESTAMPDIFF(MINUTE, '2023-05-31 09:00:00', NOW()) AS diff_minutes,
       TIMESTAMPDIFF(HOUR,   '2023-05-31 09:00:00', NOW()) AS diff_hours,
       TIMESTAMPDIFF(DAY,    '2023-05-31', NOW())          AS diff_days,
       TIMESTAMPDIFF(MONTH,  '2020-01-01', NOW())          AS diff_months,
       TIMESTAMPDIFF(YEAR,   '2000-01-01', NOW())          AS diff_years;


-- 요일 / 월 이름 / 올해 몇 번째 날인지
-- DAYOFWEEK : 요일 번호 반환 (1 = 일요일)
-- MONTHNAME : 월 이름 반환
-- DAYOFYEAR : 해당 연도의 몇 번째 날인지 반환
SELECT
       DAYOFWEEK(CURDATE()) AS dayofweek_result,
       MONTHNAME(CURDATE()) AS monthname_result,
       DAYOFYEAR(CURDATE()) AS dayofyear_result;


-- 해당 월의 마지막 날짜
-- LAST_DAY : 해당 날짜가 속한 월의 마지막 날짜 반환
SELECT
       LAST_DAY('20230201') AS last_day_result;


-- 연도 + 몇 번째 날인지로 날짜 생성
-- MAKEDATE : 연도와 일차(몇 번째 날)로 DATE 생성
SELECT
       MAKEDATE(2023, 32) AS makedate_result;


-- 시 / 분 / 초로 TIME 생성
-- MAKETIME : 시, 분, 초 값으로 TIME 생성
SELECT
       MAKETIME(17, 3, 2) AS maketime_result;


-- 연월 계산
-- PERIOD_ADD  : YYYYMM 형식 값에 개월 수 더하기
-- PERIOD_DIFF : 두 YYYYMM 형식 값의 개월 수 차이 반환
SELECT
       PERIOD_ADD(202305, 6)      AS period_add_result,
       PERIOD_DIFF(202305, 202311) AS period_diff_result;


-- 분기 구하기
-- QUARTER : 해당 날짜가 속한 분기 반환
SELECT
       QUARTER('2023-05-31') AS quarter_result;


-- 시간을 초 단위로 변환
-- TIME_TO_SEC : TIME 값을 초(second)로 변환
SELECT
       TIME_TO_SEC('1:1:1') AS time_to_sec_result;


-- 자주 쓰는 함수

-- 문자열
-- CONCAT / CONCAT_WS  : 문자열 연결
-- LENGTH / CHAR_LENGTH: 길이 확인
-- SUBSTRING           : 부분 문자열 추출
-- REPLACE             : 문자열 치환
-- TRIM                : 공백/특정 문자 제거
-- UPPER / LOWER       : 대소문자 변환

-- 숫자
-- ROUND / CEILING / FLOOR : 반올림 / 올림 / 내림
-- ABS                     : 절대값
-- MOD                     : 나머지
-- RAND                    : 난수 생성
-- TRUNCATE                : 버림

-- 날짜 / 시간
-- NOW / CURDATE / CURTIME         : 현재 날짜시간 / 날짜 / 시간
-- DATE / TIME                     : 날짜 부분 / 시간 부분 추출
-- YEAR / MONTH / DAYOFMONTH       : 연 / 월 / 일 추출
-- ADDDATE / SUBDATE               : 날짜 더하기 / 빼기
-- DATEDIFF / TIMEDIFF             : 날짜 차이 / 시간 차이
-- LAST_DAY / QUARTER              : 말일 / 분기 구하기
-- DATE_FORMAT                     : 날짜 출력 형식 지정 시 자주 사용
-- TIMESTAMPDIFF                   : 두 날짜시간 사이 차이를 원하는 단위로 계산할 때 자주 사용