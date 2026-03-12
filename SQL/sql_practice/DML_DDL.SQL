-- 부모 테이블
CREATE TABLE IF NOT EXISTS team_info
(
    team_code INT AUTO_INCREMENT PRIMARY KEY COMMENT '소속코드',            
    team_name VARCHAR(100) NOT NULL COMMENT '소속명' ,
    team_detail VARCHAR(500) COMMENT '소속상세정보',
    use_YN CHAR(2) NOT NULL DEFAULT 'Y' CHECK (use_YN IN ('Y', 'N')) COMMENT '사용여부'
) COMMENT '소속정보'; 
-- 자식 테이블
CREATE TABLE IF NOT EXISTS member_info
(
    member_code INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원코드',              
    member_name VARCHAR(70) NOT NULL COMMENT '회원이름' ,
    birth_date DATE COMMENT '생년월일',
    division_code CHAR(2) COMMENT '구분코드',
    detail_info VARCHAR(500) COMMENT '상세정보',
    contact VARCHAR(50) NOT NULL COMMENT '연락처',
    team_code INT NOT NULL COMMENT '소속코드',
    active_status CHAR(2) NOT NULL COMMENT '활동상태',
    FOREIGN KEY(team_code) REFERENCES team_info (team_code)
) COMMENT '회원정보';

