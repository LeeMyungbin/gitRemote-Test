'''
텍스트 파일 I/O 기본
'''

from paths import DATA_DIR
from datetime import datetime

def demo_open_close_and_modes():
    '''
    open(경로,모드, encoding)은 파일 객체를 반환한다.
    모드
    w : 쓰기(덮어쓰기)
    a : 추가(이어쓰기)
    r : 읽기 

    encoding : 텍스트 파일은 utf-8 권장 (한글 깨짐 방지)
    '''
    hello_path=DATA_DIR /"hello.txt"

    #쓰기 모드(덮어쓰기)
    f=open(hello_path ,"w", encoding="UTF-8" )
    f.write("hello, File IO!\n")
    f.write(f"Created_at: {datetime.now().strftime("%Y-%m-%d %H:%M:$S")}\n")
    f.close()    # 파일을 열었을 경우 반드시 닫아준다 (리소스 반환)
    #쓰기 모드(이어쓰기)
    f = open(hello_path, "w", encoding="utf-8")
    f.write("append line!\n")
    f.close()
    #읽기모드
    f = open(hello_path, "r", encoding="utf-8")
    content= f.read()
    f.close()

    print("[content]:",content)

def demo_with_is_recommended():
    '''
    with open(...)as f:
    -블록이 끝날 때 자동으로 close()가 호출 된다.
    -예외가 발생하더라도 파일이 안전하게 닫힌다.
    '''

    path= DATA_DIR /"with_demo.txt"

    with open(path, "w", encoding="utf-8") as f:
        f.write("with는 자동으로 닫아준다.\n")
    
    with open(path, "a", encoding="utf-8") as f:
        f.write("append line!\n")

    with open(path, "r", encoding="utf-8") as f:
        print("read content :", f. read())