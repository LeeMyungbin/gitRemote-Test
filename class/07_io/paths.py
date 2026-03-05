'''
파일 I/O 챕터애서 사용할 "작업 폴더"를 준비한다.
-파일 I/O는 실행 결과로 실제 파일이 생성 되는데 저장 위치를 한 곳에 모아두면 깔끔하다.
-path;ib.Path 를 사용하면 운영체제별로 경로 구분자 (/,\\) 차이를 신경쓰지 않아도 된다.
'''

from pathlib import Path
#현재 작업 폴더(프로젝트 루트)를 절대 경로로 얻는다.
#resolve()를 쓰면 상대 경로가 절대 경로로 바뀌어 디버깅이 편하다.
BASE_DIR = Path(".").resolve()

#실습 파일들을 저장할 폴더 설정한다.
#/ :나누기 연산자가 아니라 Path 객체를 대상으로 하는 경로 연결 연산자
DATA_DIR= BASE_DIR /"data"

#폴더가 없으면 생성한다.
#parents=True : 중간 폴더도 같이 생성
#exist_ok=True :이미 폴더가 있어도 에러를 내지 않음
DATA_DIR.mkdir(parents=True, exist_ok=True)
